import 'package:flutter/material.dart';

import '../../data/models/storage_models.dart';
import '../../data/repositories/storage_repository.dart';
import '../../domain/units/currency_input.dart';

class StoragePage extends StatefulWidget {
  const StoragePage({super.key});

  @override
  State<StoragePage> createState() => _StoragePageState();
}

class _StoragePageState extends State<StoragePage> {
  final _repository = StorageRepository();
  late Future<_StorageData> _future;

  @override
  void initState() {
    super.initState();
    _reload();
  }

  void _reload() {
    _future = _load();
  }

  Future<_StorageData> _load() async {
    return _StorageData(
      summaries: await _repository.getSummaries(),
      items: await _repository.getItems(),
    );
  }

  Future<void> _add(List<StorageSummary> summaries) async {
    await Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (_) => StorageItemEditorPage(
          locations: summaries.map((item) => item.location).toList(),
        ),
      ),
    );
    if (mounted) setState(_reload);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Storage & Processing Queue')),
      body: FutureBuilder<_StorageData>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Storage failed: ${snapshot.error}'));
          }
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final data = snapshot.data!;
          return ListView(
            padding: const EdgeInsets.all(12),
            children: [
              for (final summary in data.summaries)
                Card(
                  child: ListTile(
                    title: Text(summary.location.name),
                    subtitle: Text(
                      '${summary.waitingCount} item(s) • '
                      '${summary.processingMinutes} processing min',
                    ),
                    trailing: Text(
                      '\$${(summary.estimatedValueCents / 100).toStringAsFixed(2)}',
                    ),
                  ),
                ),
              const SizedBox(height: 8),
              Text(
                'Processing priority',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              for (final item in data.items)
                Card(
                  child: ListTile(
                    title: Text('${item.label} × ${item.quantity}'),
                    subtitle: Text(
                      'Priority ${item.priority}/5 • '
                      '${item.estimatedProcessingMinutes} min • ${item.status}',
                    ),
                    trailing: Text(
                      '\$${(item.estimatedValueCents / 100).toStringAsFixed(2)}',
                    ),
                  ),
                ),
            ],
          );
        },
      ),
      floatingActionButton: FutureBuilder<_StorageData>(
        future: _future,
        builder: (context, snapshot) => FloatingActionButton.extended(
          heroTag: null,
          onPressed: snapshot.hasData
              ? () => _add(snapshot.data!.summaries)
              : null,
          icon: const Icon(Icons.add),
          label: const Text('Add Stored Item'),
        ),
      ),
    );
  }
}

class StorageItemEditorPage extends StatefulWidget {
  const StorageItemEditorPage({required this.locations, super.key});

  final List<StorageLocation> locations;

  @override
  State<StorageItemEditorPage> createState() => _StorageItemEditorPageState();
}

class _StorageItemEditorPageState extends State<StorageItemEditorPage> {
  final _repository = StorageRepository();
  final _label = TextEditingController();
  final _quantity = TextEditingController(text: '1');
  final _value = TextEditingController();
  final _minutes = TextEditingController();
  int? _locationId;
  int _priority = 3;

  @override
  void initState() {
    super.initState();
    if (widget.locations.isNotEmpty) {
      _locationId = widget.locations.first.id;
    }
  }

  @override
  void dispose() {
    _label.dispose();
    _quantity.dispose();
    _value.dispose();
    _minutes.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    try {
      if (_locationId == null || _label.text.trim().isEmpty) {
        throw const FormatException('Location and item label are required.');
      }
      final now = DateTime.now();
      final acquiredAt =
          '${now.year.toString().padLeft(4, '0')}-'
          '${now.month.toString().padLeft(2, '0')}-'
          '${now.day.toString().padLeft(2, '0')}';
      await _repository.saveItem(
        StorageItem(
          storageLocationId: _locationId!,
          label: _label.text.trim(),
          quantity: int.tryParse(_quantity.text.trim()) ?? 1,
          estimatedValueCents: _value.text.trim().isEmpty
              ? 0
              : CurrencyInput.dollarsToCents(_value.text),
          estimatedProcessingMinutes: int.tryParse(_minutes.text.trim()) ?? 0,
          priority: _priority,
          status: 'WAITING',
          acquiredAt: acquiredAt,
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
      appBar: AppBar(title: const Text('Add Stored Item')),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          DropdownButtonFormField<int>(
            initialValue: _locationId,
            decoration: const InputDecoration(labelText: 'Storage location'),
            items: [
              for (final location in widget.locations)
                DropdownMenuItem(
                  value: location.id,
                  child: Text(location.name),
                ),
            ],
            onChanged: (value) => setState(() => _locationId = value),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _label,
            decoration: const InputDecoration(labelText: 'Item label'),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _quantity,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Quantity'),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _value,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: const InputDecoration(
              labelText: 'Estimated total value',
              prefixText: r'$',
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _minutes,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Processing minutes'),
          ),
          const SizedBox(height: 8),
          DropdownButtonFormField<int>(
            initialValue: _priority,
            decoration: const InputDecoration(labelText: 'Priority'),
            items: [
              for (var value = 1; value <= 5; value++)
                DropdownMenuItem(value: value, child: Text('$value / 5')),
            ],
            onChanged: (value) => setState(() => _priority = value!),
          ),
          const SizedBox(height: 16),
          FilledButton.icon(
            onPressed: _save,
            icon: const Icon(Icons.save),
            label: const Text('Save Stored Item'),
          ),
        ],
      ),
    );
  }
}

final class _StorageData {
  const _StorageData({required this.summaries, required this.items});

  final List<StorageSummary> summaries;
  final List<StorageItem> items;
}
