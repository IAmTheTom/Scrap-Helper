import 'package:flutter/material.dart';

import '../../data/models/history_models.dart';
import '../../data/models/reference_models.dart';
import '../../data/repositories/history_repository.dart';
import '../../data/repositories/scrap_repository.dart';
import '../../domain/calculation/rate_calculator.dart';
import '../../domain/enums/app_enums.dart';
import '../../domain/units/currency_input.dart';
import '../../domain/units/weight_converter.dart';

class ReceiptEntryPage extends StatefulWidget {
  const ReceiptEntryPage({required this.load, super.key});

  final FinalizedLoadSummary load;

  @override
  State<ReceiptEntryPage> createState() => _ReceiptEntryPageState();
}

class _ReceiptEntryPageState extends State<ReceiptEntryPage> {
  final _history = HistoryRepository();
  final _scrap = ScrapRepository();
  final _lines = <_LineInput>[_LineInput()];
  late Future<List<ScrapCategory>> _categoriesFuture;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    _categoriesFuture = _scrap.getCategories();
  }

  @override
  void dispose() {
    for (final line in _lines) {
      line.dispose();
    }
    super.dispose();
  }

  void _addLine() {
    setState(() => _lines.add(_LineInput()));
  }

  void _removeLine(int index) {
    if (_lines.length == 1) return;
    final removed = _lines.removeAt(index);
    removed.dispose();
    setState(() {});
  }

  Future<void> _save(List<ScrapCategory> categories) async {
    if (_saving) return;
    setState(() => _saving = true);

    try {
      final drafts = <ReceiptLineDraft>[];
      for (final input in _lines) {
        final categoryId = input.categoryId;
        if (categoryId == null) {
          throw const FormatException('Choose a category for every line.');
        }
        final category = categories.firstWhere((item) => item.id == categoryId);
        final weightG = WeightConverter.toGrams(
          input.weight.text,
          WeightUnit.pound,
        );
        final rateUnits = CurrencyInput.dollarsToRateUnits(input.rate.text);
        final payout = RateCalculator.payoutCents(
          rateUnits: rateUnits,
          rateUnit: PriceUnit.perPound,
          weightGrams: weightG,
        );
        final adjustment = input.adjustment.text.trim().isEmpty
            ? 0
            : CurrencyInput.dollarsToCents(input.adjustment.text);

        drafts.add(
          ReceiptLineDraft(
            categoryId: categoryId,
            yardCategoryName: category.name,
            weightG: weightG,
            sourceWeightValue: input.weight.text.trim(),
            sourceWeightUnit: WeightUnit.pound.dbValue,
            rateUnits: rateUnits,
            rateUnit: PriceUnit.perPound.dbValue,
            linePayoutCents: payout,
            lineAdjustmentCents: adjustment,
          ),
        );
      }

      final now = DateTime.now();
      final date =
          '${now.year.toString().padLeft(4, '0')}-'
          '${now.month.toString().padLeft(2, '0')}-'
          '${now.day.toString().padLeft(2, '0')}';

      await _history.saveReceipt(
        loadId: widget.load.loadId,
        scrapyardId: widget.load.scrapyardId,
        date: date,
        lines: drafts,
      );

      if (!mounted) return;
      Navigator.pop(context);
    } on FormatException catch (error) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(error.message)));
    } catch (error) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Could not save receipt: $error')));
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  int? _previewTotal() {
    try {
      var total = 0;
      for (final input in _lines) {
        if (input.weight.text.trim().isEmpty ||
            input.rate.text.trim().isEmpty) {
          continue;
        }
        final weightG = WeightConverter.toGrams(
          input.weight.text,
          WeightUnit.pound,
        );
        final rateUnits = CurrencyInput.dollarsToRateUnits(input.rate.text);
        total += RateCalculator.payoutCents(
          rateUnits: rateUnits,
          rateUnit: PriceUnit.perPound,
          weightGrams: weightG,
        );
        if (input.adjustment.text.trim().isNotEmpty) {
          total += CurrencyInput.dollarsToCents(input.adjustment.text);
        }
      }
      return total;
    } catch (_) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Receipt for Load #${widget.load.loadId}')),
      body: FutureBuilder<List<ScrapCategory>>(
        future: _categoriesFuture,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Could not load categories: ${snapshot.error}'),
            );
          }
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final categories = snapshot.data!;
          final preview = _previewTotal();

          return ListView(
            padding: const EdgeInsets.all(12),
            children: [
              Card(
                child: ListTile(
                  title: const Text('Calculated receipt total'),
                  subtitle: const Text(
                    'Weight × rate, plus any line adjustments',
                  ),
                  trailing: Text(
                    preview == null
                        ? '—'
                        : '\$${(preview / 100).toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ),
              for (var index = 0; index < _lines.length; index++)
                _ReceiptLineCard(
                  input: _lines[index],
                  categories: categories,
                  canRemove: _lines.length > 1,
                  onChanged: () => setState(() {}),
                  onRemove: () => _removeLine(index),
                ),
              OutlinedButton.icon(
                onPressed: _addLine,
                icon: const Icon(Icons.add),
                label: const Text('Add Receipt Line'),
              ),
              const SizedBox(height: 12),
              FilledButton.icon(
                onPressed: _saving ? null : () => _save(categories),
                icon: _saving
                    ? const SizedBox.square(
                        dimension: 18,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.save),
                label: const Text('Save Receipt'),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _ReceiptLineCard extends StatelessWidget {
  const _ReceiptLineCard({
    required this.input,
    required this.categories,
    required this.canRemove,
    required this.onChanged,
    required this.onRemove,
  });

  final _LineInput input;
  final List<ScrapCategory> categories;
  final bool canRemove;
  final VoidCallback onChanged;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: DropdownButton<int>(
                    value: input.categoryId,
                    isExpanded: true,
                    hint: const Text('Choose category'),
                    items: [
                      for (final category in categories)
                        DropdownMenuItem(
                          value: category.id,
                          child: Text(category.name),
                        ),
                    ],
                    onChanged: (value) {
                      input.categoryId = value;
                      onChanged();
                    },
                  ),
                ),
                IconButton(
                  onPressed: canRemove ? onRemove : null,
                  icon: const Icon(Icons.delete_outline),
                ),
              ],
            ),
            const SizedBox(height: 8),
            TextField(
              controller: input.weight,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(
                labelText: 'Receipt weight',
                suffixText: 'lb',
              ),
              onChanged: (_) => onChanged(),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: input.rate,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(
                labelText: 'Receipt rate',
                prefixText: r'$',
                suffixText: '/lb',
              ),
              onChanged: (_) => onChanged(),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: input.adjustment,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(
                labelText: 'Line adjustment (optional)',
                prefixText: r'$',
                helperText: 'Use a negative value for a deduction.',
              ),
              onChanged: (_) => onChanged(),
            ),
          ],
        ),
      ),
    );
  }
}

final class _LineInput {
  int? categoryId;
  final weight = TextEditingController();
  final rate = TextEditingController();
  final adjustment = TextEditingController();

  void dispose() {
    weight.dispose();
    rate.dispose();
    adjustment.dispose();
  }
}
