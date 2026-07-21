import 'package:flutter/material.dart';

import '../../data/models/opportunity_models.dart';
import '../../data/repositories/opportunity_repository.dart';
import '../../domain/opportunities/opportunity_score.dart';
import '../../domain/units/currency_input.dart';
import '../../domain/units/mileage_input.dart';

class OpportunityQueuePage extends StatefulWidget {
  const OpportunityQueuePage({super.key});

  @override
  State<OpportunityQueuePage> createState() => _OpportunityQueuePageState();
}

class _OpportunityQueuePageState extends State<OpportunityQueuePage> {
  final _repository = OpportunityRepository();
  late Future<List<PickupOpportunity>> _future;

  @override
  void initState() {
    super.initState();
    _reload();
  }

  void _reload() {
    _future = _repository.getActive();
  }

  Future<void> _create() async {
    await Navigator.push(
      context,
      MaterialPageRoute<void>(builder: (_) => const OpportunityEditorPage()),
    );
    if (mounted) setState(_reload);
  }

  Future<void> _status(PickupOpportunity opportunity, String status) async {
    await _repository.setStatus(opportunity.id!, status);
    setState(_reload);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pickup Opportunities'),
        actions: [IconButton(onPressed: _create, icon: const Icon(Icons.add))],
      ),
      body: FutureBuilder<List<PickupOpportunity>>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Queue failed: ${snapshot.error}'));
          }
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final opportunities = snapshot.data!;
          if (opportunities.isEmpty) {
            return const Center(child: Text('No active pickup opportunities.'));
          }

          final ranked = [...opportunities]
            ..sort(
              (a, b) => OpportunityScore.evaluate(
                b,
              ).score.compareTo(OpportunityScore.evaluate(a).score),
            );

          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: ranked.length,
            itemBuilder: (context, index) {
              final opportunity = ranked[index];
              final decision = OpportunityScore.evaluate(opportunity);
              return Card(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 12, 8, 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              opportunity.title,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ),
                          CircleAvatar(child: Text('${decision.score}')),
                        ],
                      ),
                      Text('${decision.title} • ${opportunity.sourceType}'),
                      if (opportunity.locationText != null)
                        Text(opportunity.locationText!),
                      Text(
                        'Expected net: '
                        '\$${(decision.estimatedNetCents / 100).toStringAsFixed(2)}',
                      ),
                      Text(
                        'Distance: '
                        '${(opportunity.distanceMilesMilli / 1000).toStringAsFixed(1)} mi • '
                        '${opportunity.estimatedMinutes} min • '
                        'space ${opportunity.spaceScore}/5',
                      ),
                      const SizedBox(height: 4),
                      Text(decision.explanation),
                      Wrap(
                        spacing: 4,
                        alignment: WrapAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () => _status(opportunity, 'SCHEDULED'),
                            child: const Text('Schedule'),
                          ),
                          TextButton(
                            onPressed: () => _status(opportunity, 'COLLECTED'),
                            child: const Text('Collected'),
                          ),
                          TextButton(
                            onPressed: () => _status(opportunity, 'PASSED'),
                            child: const Text('Pass'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _create,
        icon: const Icon(Icons.add),
        label: const Text('Add Pickup'),
      ),
    );
  }
}

class OpportunityEditorPage extends StatefulWidget {
  const OpportunityEditorPage({super.key});

  @override
  State<OpportunityEditorPage> createState() => _OpportunityEditorPageState();
}

class _OpportunityEditorPageState extends State<OpportunityEditorPage> {
  final _repository = OpportunityRepository();
  final _title = TextEditingController();
  final _source = TextEditingController(text: 'CURBSIDE');
  final _location = TextEditingController();
  final _distance = TextEditingController();
  final _pickupCost = TextEditingController();
  final _low = TextEditingController();
  final _likely = TextEditingController();
  final _high = TextEditingController();
  final _minutes = TextEditingController();
  int _spaceScore = 3;
  String _confidence = 'LOW';

  @override
  void dispose() {
    for (final controller in <TextEditingController>[
      _title,
      _source,
      _location,
      _distance,
      _pickupCost,
      _low,
      _likely,
      _high,
      _minutes,
    ]) {
      controller.dispose();
    }
    super.dispose();
  }

  int _money(TextEditingController controller) {
    final text = controller.text.trim();
    return text.isEmpty ? 0 : CurrencyInput.dollarsToCents(text);
  }

  Future<void> _save() async {
    try {
      if (_title.text.trim().isEmpty) {
        throw const FormatException('A pickup title is required.');
      }
      await _repository.save(
        PickupOpportunity(
          title: _title.text.trim(),
          sourceType: _source.text.trim().isEmpty
              ? 'OTHER'
              : _source.text.trim().toUpperCase(),
          locationText: _location.text.trim().isEmpty
              ? null
              : _location.text.trim(),
          distanceMilesMilli: _distance.text.trim().isEmpty
              ? 0
              : MileageInput.milesToMilli(_distance.text),
          pickupCostCents: _money(_pickupCost),
          estimatedLowCents: _money(_low),
          estimatedLikelyCents: _money(_likely),
          estimatedHighCents: _money(_high),
          estimatedMinutes: int.tryParse(_minutes.text.trim()) ?? 0,
          spaceScore: _spaceScore,
          confidence: _confidence,
          status: 'SEEN',
        ),
      );
      if (mounted) Navigator.pop(context);
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
      appBar: AppBar(title: const Text('New Pickup Opportunity')),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          _TextField(controller: _title, label: 'Item or pickup title'),
          _TextField(controller: _source, label: 'Source'),
          _TextField(controller: _location, label: 'Location or address'),
          _TextField(controller: _distance, label: 'Round-trip miles'),
          _MoneyField(controller: _pickupCost, label: 'Purchase/pickup cost'),
          _MoneyField(controller: _low, label: 'Estimated low payout'),
          _MoneyField(controller: _likely, label: 'Estimated likely payout'),
          _MoneyField(controller: _high, label: 'Estimated high payout'),
          _TextField(
            controller: _minutes,
            label: 'Estimated processing minutes',
          ),
          DropdownButtonFormField<int>(
            initialValue: _spaceScore,
            decoration: const InputDecoration(labelText: 'Space required'),
            items: [
              for (var value = 1; value <= 5; value++)
                DropdownMenuItem(value: value, child: Text('$value / 5')),
            ],
            onChanged: (value) => setState(() => _spaceScore = value!),
          ),
          const SizedBox(height: 8),
          DropdownButtonFormField<String>(
            initialValue: _confidence,
            decoration: const InputDecoration(labelText: 'Confidence'),
            items: const [
              DropdownMenuItem(value: 'LOW', child: Text('Low')),
              DropdownMenuItem(value: 'MEDIUM', child: Text('Medium')),
              DropdownMenuItem(value: 'HIGH', child: Text('High')),
              DropdownMenuItem(value: 'MEASURED', child: Text('Measured')),
            ],
            onChanged: (value) => setState(() => _confidence = value!),
          ),
          const SizedBox(height: 16),
          FilledButton.icon(
            onPressed: _save,
            icon: const Icon(Icons.save),
            label: const Text('Save Opportunity'),
          ),
        ],
      ),
    );
  }
}

class _TextField extends StatelessWidget {
  const _TextField({required this.controller, required this.label});

  final TextEditingController controller;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: TextField(
        controller: controller,
        keyboardType: label.contains('miles') || label.contains('minutes')
            ? const TextInputType.numberWithOptions(decimal: true)
            : TextInputType.text,
        decoration: InputDecoration(labelText: label),
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
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        decoration: InputDecoration(labelText: label, prefixText: r'$'),
      ),
    );
  }
}
