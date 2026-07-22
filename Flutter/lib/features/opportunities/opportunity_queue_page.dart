import 'package:flutter/material.dart';

import '../../data/models/opportunity_models.dart';
import '../../data/models/reference_models.dart';
import '../../data/repositories/opportunity_repository.dart';
import '../../data/repositories/scrap_repository.dart';
import '../../domain/opportunities/opportunity_score.dart';
import '../../domain/units/currency_input.dart';
import '../../domain/units/mileage_input.dart';
import '../objects/object_editor_page.dart';

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

    if (mounted) {
      setState(_reload);
    }
  }

  Future<void> _status(PickupOpportunity opportunity, String status) async {
    await _repository.setStatus(opportunity.id!, status);

    if (mounted) {
      setState(_reload);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pickup Opportunities'),
        actions: [
          IconButton(
            onPressed: _create,
            tooltip: 'Add pickup',
            icon: const Icon(Icons.add),
          ),
        ],
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
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.add_location_alt_outlined, size: 56),
                    const SizedBox(height: 12),
                    Text(
                      'No active pickups',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      'Add a pickup and select its item from the Object Library.',
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 14),
                    FilledButton.icon(
                      onPressed: _create,
                      icon: const Icon(Icons.add),
                      label: const Text('Add Pickup'),
                    ),
                  ],
                ),
              ),
            );
          }

          final ranked = [...opportunities]
            ..sort(
              (a, b) => OpportunityScore.evaluate(
                b,
              ).score.compareTo(OpportunityScore.evaluate(a).score),
            );

          return ListView.builder(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 88),
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
        heroTag: null,
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
  final _scrapRepository = ScrapRepository();

  final _title = TextEditingController();
  final _source = TextEditingController(text: 'CURBSIDE');
  final _location = TextEditingController();
  final _distance = TextEditingController();
  final _pickupCost = TextEditingController();
  final _low = TextEditingController();
  final _likely = TextEditingController();
  final _high = TextEditingController();
  final _minutes = TextEditingController();

  List<ObjectTemplate> _objects = const [];
  int? _selectedObjectId;
  bool _loadingObjects = true;
  bool _saving = false;
  int _spaceScore = 3;
  String _confidence = 'LOW';

  @override
  void initState() {
    super.initState();
    _loadObjects();
  }

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

  Future<void> _loadObjects({int? selectId}) async {
    final objects = await _scrapRepository.getObjects();

    if (!mounted) return;

    setState(() {
      _objects = objects;
      _loadingObjects = false;

      if (selectId != null) {
        _selectedObjectId = selectId;
      } else if (_selectedObjectId == null && objects.isNotEmpty) {
        _selectedObjectId = objects.first.id;
      }
    });

    final selected = _selectedObject;

    if (_title.text.trim().isEmpty && selected != null) {
      _title.text = selected.name;
    }
  }

  ObjectTemplate? get _selectedObject {
    final selectedId = _selectedObjectId;

    if (selectedId == null) return null;

    for (final object in _objects) {
      if (object.id == selectedId) {
        return object;
      }
    }

    return null;
  }

  Future<void> _addNewObject() async {
    final created = await Navigator.push<ObjectTemplate>(
      context,
      MaterialPageRoute<ObjectTemplate>(
        builder: (_) => const ObjectEditorPage(),
      ),
    );

    if (created == null) return;

    await _loadObjects(selectId: created.id);
    _title.text = created.name;
  }

  int _money(TextEditingController controller) {
    final text = controller.text.trim();
    return text.isEmpty ? 0 : CurrencyInput.dollarsToCents(text);
  }

  Future<void> _save() async {
    if (_saving) return;

    try {
      final selectedObject = _selectedObject;

      if (selectedObject == null) {
        throw const FormatException(
          'Select an Object Library item or add a new object.',
        );
      }

      if (_title.text.trim().isEmpty) {
        _title.text = selectedObject.name;
      }

      setState(() => _saving = true);

      await _repository.save(
        PickupOpportunity(
          objectTemplateId: selectedObject.id,
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

      if (mounted) {
        Navigator.pop(context);
      }
    } on FormatException catch (error) {
      if (!mounted) return;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(error.message)));
    } finally {
      if (mounted) {
        setState(() => _saving = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New Pickup Opportunity')),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _loadingObjects
                    ? const LinearProgressIndicator()
                    : DropdownButtonFormField<int>(
                        initialValue: _selectedObjectId,
                        isExpanded: true,
                        decoration: const InputDecoration(
                          labelText: 'Object Library item',
                        ),
                        items: [
                          for (final object in _objects)
                            DropdownMenuItem(
                              value: object.id,
                              child: Text(
                                object.subtype.isEmpty
                                    ? object.name
                                    : '${object.name} — ${object.subtype}',
                              ),
                            ),
                        ],
                        onChanged: (value) {
                          setState(() => _selectedObjectId = value);

                          final selected = _selectedObject;

                          if (selected != null) {
                            _title.text = selected.name;
                          }
                        },
                      ),
              ),
              const SizedBox(width: 8),
              IconButton.filled(
                onPressed: _addNewObject,
                tooltip: 'Add new object',
                icon: const Icon(Icons.add),
              ),
            ],
          ),
          if (!_loadingObjects && _objects.isEmpty) ...[
            const SizedBox(height: 8),
            Card(
              child: ListTile(
                leading: const Icon(Icons.info_outline),
                title: const Text('Object Library is empty'),
                subtitle: const Text(
                  'Add an object before saving this pickup.',
                ),
                trailing: FilledButton(
                  onPressed: _addNewObject,
                  child: const Text('Add'),
                ),
              ),
            ),
          ],
          const SizedBox(height: 10),
          _TextField(
            controller: _title,
            label: 'Pickup title',
            hint: 'Optional listing-specific description',
          ),
          _TextField(controller: _source, label: 'Source'),
          _TextField(controller: _location, label: 'Location or address'),
          _TextField(
            controller: _distance,
            label: 'Round-trip miles',
            numeric: true,
          ),
          _MoneyField(controller: _pickupCost, label: 'Purchase/pickup cost'),
          _MoneyField(controller: _low, label: 'Estimated low payout'),
          _MoneyField(controller: _likely, label: 'Estimated likely payout'),
          _MoneyField(controller: _high, label: 'Estimated high payout'),
          _TextField(
            controller: _minutes,
            label: 'Estimated processing minutes',
            numeric: true,
          ),
          DropdownButtonFormField<int>(
            initialValue: _spaceScore,
            decoration: const InputDecoration(labelText: 'Space required'),
            items: [
              for (var value = 1; value <= 5; value++)
                DropdownMenuItem(value: value, child: Text('$value / 5')),
            ],
            onChanged: (value) {
              if (value != null) {
                setState(() => _spaceScore = value);
              }
            },
          ),
          const SizedBox(height: 8),
          DropdownButtonFormField<String>(
            initialValue: _confidence,
            decoration: const InputDecoration(labelText: 'Estimate confidence'),
            items: const [
              DropdownMenuItem(value: 'LOW', child: Text('Low')),
              DropdownMenuItem(value: 'MEDIUM', child: Text('Medium')),
              DropdownMenuItem(value: 'HIGH', child: Text('High')),
              DropdownMenuItem(value: 'MEASURED', child: Text('Measured')),
            ],
            onChanged: (value) {
              if (value != null) {
                setState(() => _confidence = value);
              }
            },
          ),
          const SizedBox(height: 16),
          FilledButton.icon(
            onPressed: _saving ? null : _save,
            icon: _saving
                ? const SizedBox.square(
                    dimension: 18,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Icon(Icons.save),
            label: Text(_saving ? 'Saving...' : 'Save Opportunity'),
          ),
        ],
      ),
    );
  }
}

class _TextField extends StatelessWidget {
  const _TextField({
    required this.controller,
    required this.label,
    this.hint,
    this.numeric = false,
  });

  final TextEditingController controller;
  final String label;
  final String? hint;
  final bool numeric;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: TextField(
        controller: controller,
        keyboardType: numeric
            ? const TextInputType.numberWithOptions(decimal: true)
            : TextInputType.text,
        decoration: InputDecoration(labelText: label, hintText: hint),
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
