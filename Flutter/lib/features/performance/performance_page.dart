import 'package:flutter/material.dart';

import '../../data/models/performance_models.dart';
import '../../data/repositories/performance_repository.dart';
import '../../domain/recommendations/recommendation_engine.dart';

class PerformancePage extends StatefulWidget {
  const PerformancePage({super.key});

  @override
  State<PerformancePage> createState() => _PerformancePageState();
}

class _PerformancePageState extends State<PerformancePage> {
  final _repository = PerformanceRepository();
  late Future<List<ObjectPerformance>> _future;

  @override
  void initState() {
    super.initState();
    _future = _repository.getObjectPerformance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Personal Performance')),
      body: FutureBuilder<List<ObjectPerformance>>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Performance failed: ${snapshot.error}'));
          }
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final performance = snapshot.data!;
          if (performance.isEmpty) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(24),
                child: Text(
                  'No item outcomes have been recorded yet. '
                  'Open a finalized load and record work, costs, and allocated payout.',
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: performance.length,
            itemBuilder: (context, index) {
              final item = performance[index];
              final recommendation = RecommendationEngine.evaluate(item);
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.objectName,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 6),
                      Text(
                        '${item.totalQuantity} completed • '
                        '${item.sampleCount} recorded load sample(s)',
                      ),
                      Text(
                        'Average net/item: '
                        '\$${(item.averageNetPerItemCents / 100).toStringAsFixed(2)}',
                      ),
                      Text(
                        'Net/hour: '
                        '\$${(item.netPerHourCents / 100).toStringAsFixed(2)}',
                      ),
                      Text(
                        'Average time/item: '
                        '${item.averageMinutesPerItem} min',
                      ),
                      Text(
                        'Estimate error: '
                        '${(item.estimateErrorBasisPoints / 100).toStringAsFixed(1)}%',
                      ),
                      const Divider(),
                      Text(
                        recommendation.title,
                        style: const TextStyle(fontWeight: FontWeight.w700),
                      ),
                      Text(recommendation.explanation),
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
