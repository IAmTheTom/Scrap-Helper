import 'package:flutter/material.dart';

import '../../data/models/reference_models.dart';
import '../../data/repositories/scrap_repository.dart';
import '../../domain/enums/app_enums.dart';

class ObjectEditorPage extends StatefulWidget {
  const ObjectEditorPage({super.key});

  @override
  State<ObjectEditorPage> createState() => _ObjectEditorPageState();
}

class _ObjectEditorPageState extends State<ObjectEditorPage> {
  static const double _gramsPerPound = 453.59237;

  final _repository = ScrapRepository();
  final _name = TextEditingController();
  final _subtype = TextEditingController();
  final _description = TextEditingController();
  final _lowPounds = TextEditingController();
  final _typicalPounds = TextEditingController();
  final _highPounds = TextEditingController();
  final _safety = TextEditingController();
  final _preparation = TextEditingController();

  ConfidenceLevel _confidence = ConfidenceLevel.low;
  bool _saving = false;

  @override
  void dispose() {
    for (final controller in <TextEditingController>[
      _name,
      _subtype,
      _description,
      _lowPounds,
      _typicalPounds,
      _highPounds,
      _safety,
      _preparation,
    ]) {
      controller.dispose();
    }
    super.dispose();
  }

  int _poundsToGrams(TextEditingController controller) {
    final text = controller.text.trim();

    if (text.isEmpty) {
      return 0;
    }

    final pounds = double.tryParse(text);

    if (pounds == null || pounds < 0) {
      throw const FormatException('Weights must be valid positive numbers.');
    }

    return (pounds * _gramsPerPound).round();
  }

  Future<void> _save() async {
    if (_saving) return;

    setState(() => _saving = true);

    try {
      final object = await _repository.createObject(
        name: _name.text,
        subtype: _subtype.text,
        description: _description.text,
        wholeWeightLowG: _poundsToGrams(_lowPounds),
        wholeWeightTypicalG: _poundsToGrams(_typicalPounds),
        wholeWeightHighG: _poundsToGrams(_highPounds),
        confidence: _confidence,
        safetyWarnings: _safety.text,
        preparationNotes: _preparation.text,
      );

      if (mounted) {
        Navigator.pop<ObjectTemplate>(context, object);
      }
    } on FormatException catch (error) {
      if (!mounted) return;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(error.message)));
    } catch (error) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Object could not be saved: $error')),
      );
    } finally {
      if (mounted) {
        setState(() => _saving = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Object')),
      body: ListView(
        padding: const EdgeInsets.all(14),
        children: [
          TextField(
            controller: _name,
            textCapitalization: TextCapitalization.words,
            decoration: const InputDecoration(
              labelText: 'Object name',
              hintText: 'Microwave, washer, aluminum wheel',
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: _subtype,
            textCapitalization: TextCapitalization.words,
            decoration: const InputDecoration(
              labelText: 'Subtype',
              hintText: 'Optional',
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: _description,
            maxLines: 3,
            decoration: const InputDecoration(labelText: 'Description'),
          ),
          const SizedBox(height: 16),
          Text(
            'Typical whole weight',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: _WeightField(controller: _lowPounds, label: 'Low'),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _WeightField(
                  controller: _typicalPounds,
                  label: 'Typical',
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _WeightField(controller: _highPounds, label: 'High'),
              ),
            ],
          ),
          const SizedBox(height: 10),
          DropdownButtonFormField<ConfidenceLevel>(
            initialValue: _confidence,
            decoration: const InputDecoration(labelText: 'Weight confidence'),
            items: [
              for (final confidence in ConfidenceLevel.values)
                DropdownMenuItem(
                  value: confidence,
                  child: Text(_confidenceLabel(confidence)),
                ),
            ],
            onChanged: (value) {
              if (value != null) {
                setState(() => _confidence = value);
              }
            },
          ),
          const SizedBox(height: 10),
          TextField(
            controller: _safety,
            maxLines: 2,
            decoration: const InputDecoration(
              labelText: 'Safety warnings',
              hintText: 'Optional',
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: _preparation,
            maxLines: 3,
            decoration: const InputDecoration(
              labelText: 'Preparation notes',
              hintText: 'Optional',
            ),
          ),
          const SizedBox(height: 18),
          FilledButton.icon(
            onPressed: _saving ? null : _save,
            icon: _saving
                ? const SizedBox.square(
                    dimension: 18,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Icon(Icons.save),
            label: Text(_saving ? 'Saving...' : 'Save Object'),
          ),
        ],
      ),
    );
  }

  static String _confidenceLabel(ConfidenceLevel confidence) {
    return switch (confidence) {
      ConfidenceLevel.low => 'Low',
      ConfidenceLevel.medium => 'Medium',
      ConfidenceLevel.high => 'High',
      ConfidenceLevel.measured => 'Measured',
    };
  }
}

class _WeightField extends StatelessWidget {
  const _WeightField({required this.controller, required this.label});

  final TextEditingController controller;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(labelText: label, suffixText: 'lb'),
    );
  }
}
