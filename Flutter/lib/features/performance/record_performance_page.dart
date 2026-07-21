import 'package:flutter/material.dart';

import '../../data/models/performance_models.dart';
import '../../data/repositories/performance_repository.dart';
import '../../domain/units/currency_input.dart';
import '../../domain/units/mileage_input.dart';

class RecordPerformancePage extends StatefulWidget {
  const RecordPerformancePage({
    required this.loadId,
    required this.actualPaidCents,
    required this.estimatedLikelyCents,
    super.key,
  });

  final int loadId;
  final int actualPaidCents;
  final int estimatedLikelyCents;

  @override
  State<RecordPerformancePage> createState() => _RecordPerformancePageState();
}

class _RecordPerformancePageState extends State<RecordPerformancePage> {
  final _repository = PerformanceRepository();
  late Future<List<FinalizedLoadItem>> _future;
  final _miles = TextEditingController();
  final _fuel = TextEditingController();
  final _purchase = TextEditingController();
  final _disposal = TextEditingController();
  final _tire = TextEditingController();
  final _other = TextEditingController();
  final _inputs = <int, _OutcomeInput>{};
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    _future = _repository.getFinalizedLoadItems(widget.loadId);
  }

  @override
  void dispose() {
    _miles.dispose();
    _fuel.dispose();
    _purchase.dispose();
    _disposal.dispose();
    _tire.dispose();
    _other.dispose();
    for (final input in _inputs.values) {
      input.dispose();
    }
    super.dispose();
  }

  int _moneyOrZero(TextEditingController controller) {
    final value = controller.text.trim();
    return value.isEmpty ? 0 : CurrencyInput.dollarsToCents(value);
  }

  Future<void> _save(List<FinalizedLoadItem> items) async {
    if (_saving) return;
    setState(() => _saving = true);

    try {
      await _repository.saveLoadCosts(
        LoadCostRecord(
          loadId: widget.loadId,
          pickupMilesMilli: _miles.text.trim().isEmpty
              ? 0
              : MileageInput.milesToMilli(_miles.text),
          fuelCostCents: _moneyOrZero(_fuel),
          purchaseCostCents: _moneyOrZero(_purchase),
          disposalCostCents: _moneyOrZero(_disposal),
          tireRemovalCostCents: _moneyOrZero(_tire),
          otherCostCents: _moneyOrZero(_other),
        ),
      );

      for (final item in items) {
        final input = _inputs[item.id]!;
        await _repository.saveOutcome(
          LoadItemOutcomeDraft(
            loadObjectItemId: item.id,
            completedQuantity: item.quantity,
            processingMinutes: int.tryParse(input.minutes.text.trim()) ?? 0,
            estimatedLikelyCents: _moneyOrZero(input.estimatedAllocation),
            allocatedActualPayoutCents: _moneyOrZero(input.actualAllocation),
            directCostCents: _moneyOrZero(input.directCost),
          ),
        );
      }

      if (!mounted) return;
      Navigator.pop(context);
    } on FormatException catch (error) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(error.message)));
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Work & Costs • Load #${widget.loadId}')),
      body: FutureBuilder<List<FinalizedLoadItem>>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Could not load items: ${snapshot.error}'),
            );
          }
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final items = snapshot.data!;
          for (final item in items) {
            _inputs.putIfAbsent(item.id, _OutcomeInput.new);
          }

          return ListView(
            padding: const EdgeInsets.all(12),
            children: [
              Text(
                'Load-level costs',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              _NumberField(controller: _miles, label: 'Pickup miles'),
              _MoneyField(controller: _fuel, label: 'Fuel cost'),
              _MoneyField(controller: _purchase, label: 'Purchase cost'),
              _MoneyField(controller: _disposal, label: 'Disposal cost'),
              _MoneyField(controller: _tire, label: 'Tire-removal cost'),
              _MoneyField(controller: _other, label: 'Other direct cost'),
              const SizedBox(height: 16),
              Text(
                'Allocate results by object',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const Text(
                'Allocate the estimate and actual receipt payout across the items so the app can learn which objects perform best.',
              ),
              for (final item in items)
                _OutcomeCard(item: item, input: _inputs[item.id]!),
              const SizedBox(height: 12),
              FilledButton.icon(
                onPressed: _saving ? null : () => _save(items),
                icon: _saving
                    ? const SizedBox.square(
                        dimension: 18,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.save),
                label: const Text('Save Work and Performance'),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _OutcomeCard extends StatelessWidget {
  const _OutcomeCard({required this.item, required this.input});

  final FinalizedLoadItem item;
  final _OutcomeInput input;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${item.objectName} × ${item.quantity}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(item.recoveryLevel),
            const SizedBox(height: 8),
            _NumberField(
              controller: input.minutes,
              label: 'Total processing minutes',
              integerOnly: true,
            ),
            _MoneyField(
              controller: input.estimatedAllocation,
              label: 'Allocated likely estimate',
            ),
            _MoneyField(
              controller: input.actualAllocation,
              label: 'Allocated actual payout',
            ),
            _MoneyField(
              controller: input.directCost,
              label: 'Object-specific direct cost',
            ),
          ],
        ),
      ),
    );
  }
}

class _MoneyField extends StatelessWidget {
  const _MoneyField({required this.controller, required this.label});

  final TextEditingController controller;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: TextField(
        controller: controller,
        keyboardType: const TextInputType.numberWithOptions(
          decimal: true,
          signed: true,
        ),
        decoration: InputDecoration(labelText: label, prefixText: r'$'),
      ),
    );
  }
}

class _NumberField extends StatelessWidget {
  const _NumberField({
    required this.controller,
    required this.label,
    this.integerOnly = false,
  });

  final TextEditingController controller;
  final String label;
  final bool integerOnly;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.numberWithOptions(decimal: !integerOnly),
        decoration: InputDecoration(labelText: label),
      ),
    );
  }
}

final class _OutcomeInput {
  final minutes = TextEditingController();
  final estimatedAllocation = TextEditingController();
  final actualAllocation = TextEditingController();
  final directCost = TextEditingController();

  void dispose() {
    minutes.dispose();
    estimatedAllocation.dispose();
    actualAllocation.dispose();
    directCost.dispose();
  }
}
