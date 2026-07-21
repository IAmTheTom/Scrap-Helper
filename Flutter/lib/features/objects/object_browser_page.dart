import 'package:flutter/material.dart';

import '../../data/models/reference_models.dart';
import '../../data/repositories/scrap_repository.dart';
import '../../domain/enums/app_enums.dart';
import '../loads/load_builder_page.dart';

class ObjectBrowserPage extends StatefulWidget {
  const ObjectBrowserPage({super.key});

  @override
  State<ObjectBrowserPage> createState() => _ObjectBrowserPageState();
}

class _ObjectBrowserPageState extends State<ObjectBrowserPage> {
  final _repository = ScrapRepository();
  final _searchController = TextEditingController();
  late Future<List<ObjectTemplate>> _future;

  @override
  void initState() {
    super.initState();
    _future = _repository.getObjects();
  }

  void _search() {
    setState(() {
      _future = _repository.getObjects(search: _searchController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Object Library')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: SearchBar(
              controller: _searchController,
              hintText: 'Search objects',
              leading: const Icon(Icons.search),
              trailing: [
                IconButton(
                  onPressed: _search,
                  icon: const Icon(Icons.arrow_forward),
                ),
              ],
              onSubmitted: (_) => _search(),
            ),
          ),
          Expanded(
            child: FutureBuilder<List<ObjectTemplate>>(
              future: _future,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text('Load failed: ${snapshot.error}'));
                }
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }
                final objects = snapshot.data!;
                if (objects.isEmpty) {
                  return const Center(child: Text('No matching objects.'));
                }
                return ListView.builder(
                  padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                  itemCount: objects.length,
                  itemBuilder: (context, index) {
                    final object = objects[index];
                    return Card(
                      child: ListTile(
                        leading: const CircleAvatar(
                          child: Icon(Icons.recycling),
                        ),
                        title: Text(object.name),
                        subtitle: Text(
                          '${(object.wholeWeightTypicalG / 453.59237).toStringAsFixed(0)} lb typical • ${object.confidence.dbValue} confidence',
                        ),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (_) => ObjectDetailPage(object: object),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ObjectDetailPage extends StatefulWidget {
  const ObjectDetailPage({required this.object, super.key});

  final ObjectTemplate object;

  @override
  State<ObjectDetailPage> createState() => _ObjectDetailPageState();
}

class _ObjectDetailPageState extends State<ObjectDetailPage> {
  final _repository = ScrapRepository();
  RecoveryLevel _level = RecoveryLevel.standard;
  int _quantity = 1;

  Future<void> _add() async {
    final yards = await _repository.getScrapyards();
    final load = await _repository.getOrCreateDraftLoad(yards.first.id!);
    await _repository.addObjectToLoad(
      loadId: load.id,
      objectTemplateId: widget.object.id!,
      recoveryLevel: _level,
      quantity: _quantity,
    );
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${widget.object.name} added to current load.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.object.name)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            widget.object.description ?? '',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 12),
          _InfoCard(
            title: 'Typical whole weight',
            value:
                '${(widget.object.wholeWeightLowG / 453.59237).toStringAsFixed(0)}–${(widget.object.wholeWeightHighG / 453.59237).toStringAsFixed(0)} lb',
          ),
          if (widget.object.safetyWarnings != null)
            _InfoCard(
              title: 'Safety',
              value: widget.object.safetyWarnings!,
              warning: true,
            ),
          if (widget.object.preparationNotes != null)
            _InfoCard(
              title: 'Preparation',
              value: widget.object.preparationNotes!,
            ),
          const SizedBox(height: 12),
          DropdownButtonFormField<RecoveryLevel>(
            initialValue: _level,
            decoration: const InputDecoration(
              labelText: 'Recovery level',
              border: OutlineInputBorder(),
            ),
            items: [
              for (final level in RecoveryLevel.values)
                DropdownMenuItem(value: level, child: Text(_label(level))),
            ],
            onChanged: (value) => setState(() => _level = value!),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Text('Quantity'),
              const Spacer(),
              IconButton(
                onPressed: _quantity > 1
                    ? () => setState(() => _quantity--)
                    : null,
                icon: const Icon(Icons.remove_circle_outline),
              ),
              Text('$_quantity'),
              IconButton(
                onPressed: () => setState(() => _quantity++),
                icon: const Icon(Icons.add_circle_outline),
              ),
            ],
          ),
          const SizedBox(height: 8),
          FilledButton.icon(
            onPressed: _add,
            icon: const Icon(Icons.add_shopping_cart),
            label: const Text('Add to Current Load'),
          ),
          TextButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute<void>(builder: (_) => const LoadBuilderPage()),
            ),
            child: const Text('Open Current Load'),
          ),
        ],
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

class _InfoCard extends StatelessWidget {
  const _InfoCard({
    required this.title,
    required this.value,
    this.warning = false,
  });

  final String title;
  final String value;
  final bool warning;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: warning ? Theme.of(context).colorScheme.errorContainer : null,
      child: ListTile(
        title: Text(title),
        subtitle: Text(value),
        leading: Icon(warning ? Icons.warning_amber : Icons.info_outline),
      ),
    );
  }
}
