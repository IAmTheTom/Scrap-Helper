import 'package:flutter/material.dart';

import '../../data/models/history_models.dart';
import '../../data/repositories/history_repository.dart';
import '../receipts/receipt_entry_page.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final _repository = HistoryRepository();
  late Future<List<FinalizedLoadSummary>> _future;

  @override
  void initState() {
    super.initState();
    _reload();
  }

  void _reload() {
    _future = _repository.getFinalizedLoads();
  }

  Future<void> _addReceipt(FinalizedLoadSummary load) async {
    await Navigator.push(
      context,
      MaterialPageRoute<void>(builder: (_) => ReceiptEntryPage(load: load)),
    );
    if (mounted) setState(_reload);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Load History')),
      body: FutureBuilder<List<FinalizedLoadSummary>>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('History failed: ${snapshot.error}'));
          }
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final loads = snapshot.data!;
          if (loads.isEmpty) {
            return const Center(child: Text('No finalized loads yet.'));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: loads.length,
            itemBuilder: (context, index) {
              final load = loads[index];
              final variance = load.actualPaidCents - load.estimatedLikelyCents;
              return Card(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 14, 8, 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Load #${load.loadId} • ${load.date}',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Estimate: '
                        '\$${(load.estimatedLowCents / 100).toStringAsFixed(2)} – '
                        '\$${(load.estimatedHighCents / 100).toStringAsFixed(2)}',
                      ),
                      Text(
                        'Likely: \$${(load.estimatedLikelyCents / 100).toStringAsFixed(2)}',
                      ),
                      if (load.receiptCount > 0) ...[
                        Text(
                          'Actual: \$${(load.actualPaidCents / 100).toStringAsFixed(2)}',
                          style: const TextStyle(fontWeight: FontWeight.w700),
                        ),
                        Text(
                          'Difference from likely: '
                          '${variance >= 0 ? '+' : '-'}'
                          '\$${(variance.abs() / 100).toStringAsFixed(2)}',
                        ),
                      ] else
                        const Text('No receipt entered yet.'),
                      Row(
                        children: [
                          Text('${load.itemCount} load item record(s)'),
                          const Spacer(),
                          TextButton.icon(
                            onPressed: () => _addReceipt(load),
                            icon: const Icon(Icons.receipt_long),
                            label: const Text('Add Receipt'),
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
    );
  }
}
