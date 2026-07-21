import 'package:flutter/material.dart';

import '../../data/models/productivity_models.dart';
import '../../data/repositories/report_repository.dart';

class ReportsPage extends StatefulWidget {
  const ReportsPage({super.key});

  @override
  State<ReportsPage> createState() => _ReportsPageState();
}

class _ReportsPageState extends State<ReportsPage> {
  final _repository = ReportRepository();
  late Future<List<PeriodReport>> _future;

  @override
  void initState() {
    super.initState();
    _future = _repository.loadStandardPeriods();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reports')),
      body: FutureBuilder<List<PeriodReport>>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Reports failed: ${snapshot.error}'));
          }
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView(
            padding: const EdgeInsets.all(12),
            children: [
              for (final report in snapshot.data!) _ReportCard(report: report),
            ],
          );
        },
      ),
    );
  }
}

class _ReportCard extends StatelessWidget {
  const _ReportCard({required this.report});

  final PeriodReport report;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(report.label, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 6),
            Text('Gross: \$${(report.grossCents / 100).toStringAsFixed(2)}'),
            Text('Costs: \$${(report.costCents / 100).toStringAsFixed(2)}'),
            Text(
              'Net: \$${(report.netCents / 100).toStringAsFixed(2)}',
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
            Text(
              'Net/hour: \$${(report.netPerHourCents / 100).toStringAsFixed(2)}',
            ),
            Text(
              'Net/mile: \$${(report.netPerMileCents / 100).toStringAsFixed(2)}',
            ),
            Text(
              '${report.loadCount} loads • ${report.receiptCount} receipts • '
              '${(report.processingMinutes / 60).toStringAsFixed(1)} processing hours',
            ),
            Text(
              'Estimate error: '
              '${(report.estimateErrorBasisPoints / 100).toStringAsFixed(1)}%',
            ),
          ],
        ),
      ),
    );
  }
}
