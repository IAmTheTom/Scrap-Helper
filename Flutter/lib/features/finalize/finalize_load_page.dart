import 'package:flutter/material.dart';

import '../../domain/workflows/load_finalization_service.dart';
import '../history/history_page.dart';

class FinalizeLoadPage extends StatefulWidget {
  const FinalizeLoadPage({super.key});

  @override
  State<FinalizeLoadPage> createState() => _FinalizeLoadPageState();
}

class _FinalizeLoadPageState extends State<FinalizeLoadPage> {
  final _service = LoadFinalizationService();
  late Future<_DraftStatus> _future;
  bool _working = false;

  @override
  void initState() {
    super.initState();
    _future = _load();
  }

  Future<_DraftStatus> _load() async {
    final loadId = await _service.findDraftLoadId();
    if (loadId == null) {
      return const _DraftStatus(loadId: null, itemCount: 0);
    }
    return _DraftStatus(
      loadId: loadId,
      itemCount: await _service.countActiveItems(loadId),
    );
  }

  Future<void> _finalize(_DraftStatus status) async {
    if (status.loadId == null || status.itemCount == 0 || _working) return;

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Finalize this load?'),
        content: const Text(
          'The load contents and estimate will be locked. Receipts can be added afterward.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Finalize'),
          ),
        ],
      ),
    );
    if (confirmed != true) return;

    setState(() => _working = true);
    try {
      final result = await _service.finalize(status.loadId!);
      if (!mounted) return;
      await showDialog<void>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Load finalized'),
          content: Text(
            'Final estimate: '
            '\$${(result.lowCents / 100).toStringAsFixed(2)} – '
            '\$${(result.highCents / 100).toStringAsFixed(2)}\n'
            'Likely: \$${(result.likelyCents / 100).toStringAsFixed(2)}',
          ),
          actions: [
            FilledButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Continue'),
            ),
          ],
        ),
      );
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute<void>(builder: (_) => const HistoryPage()),
      );
    } catch (error) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not finalize load: $error')),
      );
    } finally {
      if (mounted) setState(() => _working = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Finalize Current Load')),
      body: FutureBuilder<_DraftStatus>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Could not load draft: ${snapshot.error}'),
            );
          }
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final status = snapshot.data!;
          if (status.loadId == null) {
            return const Center(child: Text('There is no active draft load.'));
          }

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Card(
                child: ListTile(
                  leading: const CircleAvatar(
                    child: Icon(Icons.local_shipping),
                  ),
                  title: Text('Draft load #${status.loadId}'),
                  subtitle: Text('${status.itemCount} object(s)'),
                ),
              ),
              const Card(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    'Finalizing creates an immutable estimate snapshot. Later price or template changes will not rewrite this load.',
                  ),
                ),
              ),
              const SizedBox(height: 12),
              FilledButton.icon(
                onPressed: status.itemCount > 0 && !_working
                    ? () => _finalize(status)
                    : null,
                icon: _working
                    ? const SizedBox.square(
                        dimension: 18,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.lock),
                label: const Text('Finalize and Lock Estimate'),
              ),
            ],
          );
        },
      ),
    );
  }
}

final class _DraftStatus {
  const _DraftStatus({required this.loadId, required this.itemCount});

  final int? loadId;
  final int itemCount;
}
