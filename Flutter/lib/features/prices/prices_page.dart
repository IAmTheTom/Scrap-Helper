import 'package:flutter/material.dart';

import '../../data/models/reference_models.dart';
import '../../data/repositories/scrap_repository.dart';
import '../../domain/units/rate_input.dart';

class PricesPage extends StatefulWidget {
  const PricesPage({super.key});

  @override
  State<PricesPage> createState() => _PricesPageState();
}

class _PricesPageState extends State<PricesPage> {
  final _repository = ScrapRepository();
  late Future<_PriceData> _future;

  @override
  void initState() {
    super.initState();
    _reload();
  }

  void _reload() {
    _future = _load();
  }

  Future<_PriceData> _load() async {
    final yards = await _repository.getScrapyards();
    if (yards.isEmpty) throw StateError('No scrapyard profile exists.');
    final categories = await _repository.getCategories();
    final prices = await _repository.getCurrentPrices(yards.first.id!);
    return _PriceData(
      yard: yards.first,
      categories: categories,
      prices: prices,
    );
  }

  Future<void> _editPrice(_PriceData data, ScrapCategory category) async {
    final current = data.priceByCategory[category.id];
    final controller = TextEditingController(
      text: current == null
          ? ''
          : (current.rateUnits / 10000).toStringAsFixed(4),
    );

    final accepted = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(category.name),
        content: TextField(
          controller: controller,
          autofocus: true,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          decoration: const InputDecoration(
            labelText: 'Current dollars per pound',
            prefixText: r'$',
            helperText: 'Use the exact current EH Recycling rate.',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Save'),
          ),
        ],
      ),
    );

    if (accepted != true) return;

    try {
      final rateUnits = RateInput.dollarsToRateUnits(controller.text);
      await _repository.setPerPoundPrice(
        scrapyardId: data.yard.id!,
        categoryId: category.id!,
        yardCategoryName: category.name,
        rateUnits: rateUnits,
      );
      setState(_reload);
    } on FormatException catch (error) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(error.message)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Yard Prices')),
      body: FutureBuilder<_PriceData>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Could not load prices: ${snapshot.error}'),
            );
          }
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final data = snapshot.data!;
          return ListView(
            padding: const EdgeInsets.all(12),
            children: [
              Card(
                child: ListTile(
                  title: Text(data.yard.name),
                  subtitle: Text(data.yard.location ?? 'Primary yard'),
                  trailing: const Icon(Icons.edit_note),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(8, 14, 8, 8),
                child: Text(
                  'Enter current prices before relying on load estimates.',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
              for (final category in data.categories)
                Card(
                  child: ListTile(
                    title: Text(category.name),
                    subtitle: Text(
                      data.priceByCategory[category.id] == null
                          ? 'Price not entered'
                          : '\$${(data.priceByCategory[category.id]!.rateUnits / 10000).toStringAsFixed(4)} per lb',
                    ),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () => _editPrice(data, category),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

final class _PriceData {
  const _PriceData({
    required this.yard,
    required this.categories,
    required this.prices,
  });

  final Scrapyard yard;
  final List<ScrapCategory> categories;
  final List<YardPrice> prices;

  Map<int?, YardPrice> get priceByCategory => <int?, YardPrice>{
    for (final price in prices) price.categoryId: price,
  };
}
