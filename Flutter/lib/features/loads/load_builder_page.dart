import 'package:flutter/material.dart';

import '../../data/models/load_models.dart';
import '../../data/models/reference_models.dart';
import '../../data/repositories/scrap_repository.dart';
import '../../domain/calculation/load_estimator.dart';
import '../../domain/enums/app_enums.dart';

class LoadBuilderPage extends StatefulWidget {
  const LoadBuilderPage({super.key});

  @override
  State<LoadBuilderPage> createState() => _LoadBuilderPageState();
}

class _LoadBuilderPageState extends State<LoadBuilderPage> {
  final _repository = ScrapRepository();
  late Future<_LoadData> _future;

  @override
  void initState() {
    super.initState();
    _reload();
  }

  void _reload() {
    _future = _load();
  }

  Future<_LoadData> _load() async {
    final yards = await _repository.getScrapyards();
    final yard = yards.first;
    final load = await _repository.getOrCreateDraftLoad(yard.id!);
    final items = await _repository.getLoadItems(load.id);
    final prices = await _repository.getCurrentPrices(yard.id!);
    final categories = await _repository.getCategories();

    final componentsByObject = <int, List<RecoverableComponent>>{};
    for (final item in items) {
      componentsByObject.putIfAbsent(
        item.objectTemplateId,
        () => <RecoverableComponent>[],
      );
    }
    for (final objectId in componentsByObject.keys) {
      componentsByObject[objectId] = await _repository.getComponents(objectId);
    }

    final estimate = LoadEstimator.calculate(
      items: items,
      componentsByObject: componentsByObject,
      prices: prices,
    );

    return _LoadData(
      yard: yard,
      load: load,
      items: items,
      categories: categories,
      estimate: estimate,
    );
  }

  Future<void> _remove(int id) async {
    await _repository.removeLoadItem(id);
    setState(_reload);
  }

  Future<void> _changeLevel(LoadObjectItem item, RecoveryLevel level) async {
    await _repository.changeLoadItem(itemId: item.id, recoveryLevel: level);
    setState(_reload);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Current Load')),
      body: FutureBuilder<_LoadData>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Load failed: ${snapshot.error}'));
          }
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final data = snapshot.data!;

          return RefreshIndicator(
            onRefresh: () async {
              setState(_reload);
              await _future;
            },
            child: ListView(
              padding: const EdgeInsets.all(12),
              children: [
                _EstimateCard(data: data),
                const SizedBox(height: 8),
                if (data.items.isEmpty)
                  const Card(
                    child: Padding(
                      padding: EdgeInsets.all(24),
                      child: Text(
                        'Current load is empty. Add an object from the Object Library.',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                for (final item in data.items)
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${item.objectName} × ${item.quantity}',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.titleMedium,
                                ),
                                DropdownButton<RecoveryLevel>(
                                  value: item.recoveryLevel,
                                  isExpanded: true,
                                  items: [
                                    for (final level in RecoveryLevel.values)
                                      DropdownMenuItem(
                                        value: level,
                                        child: Text(_label(level)),
                                      ),
                                  ],
                                  onChanged: (level) =>
                                      _changeLevel(item, level!),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () => _remove(item.id),
                            icon: const Icon(Icons.delete_outline),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  static String _label(RecoveryLevel level) => switch (level) {
    RecoveryLevel.sellWhole => 'Sell whole',
    RecoveryLevel.quick => 'Quick strip',
    RecoveryLevel.standard => 'Standard strip',
    RecoveryLevel.deep => 'Deep recovery',
  };
}

class _EstimateCard extends StatelessWidget {
  const _EstimateCard({required this.data});

  final _LoadData data;

  @override
  Widget build(BuildContext context) {
    final estimate = data.estimate;
    final missingNames = data.categories
        .where(
          (category) => estimate.missingPriceCategoryIds.contains(category.id),
        )
        .map((category) => category.name)
        .toList();

    return Card(
      color: Theme.of(context).colorScheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data.yard.name,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 6),
            Text(
              '\$${(estimate.lowPayoutCents / 100).toStringAsFixed(2)} – '
              '\$${(estimate.highPayoutCents / 100).toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              'Likely: \$${(estimate.typicalPayoutCents / 100).toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            if (missingNames.isNotEmpty) ...[
              const SizedBox(height: 10),
              Text(
                'Missing prices: ${missingNames.join(', ')}',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.error,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
            const SizedBox(height: 8),
            const Text(
              'Starter yield ranges are low-confidence until replaced by your measurements.',
            ),
          ],
        ),
      ),
    );
  }
}

final class _LoadData {
  const _LoadData({
    required this.yard,
    required this.load,
    required this.items,
    required this.categories,
    required this.estimate,
  });

  final Scrapyard yard;
  final LoadRecord load;
  final List<LoadObjectItem> items;
  final List<ScrapCategory> categories;
  final LoadEstimate estimate;
}
