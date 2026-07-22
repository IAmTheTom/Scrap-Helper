import 'package:flutter/material.dart';

import '../../config/app_config.dart';
import '../../data/models/productivity_models.dart';
import '../../data/repositories/dashboard_repository.dart';

class FieldHomePage extends StatefulWidget {
  const FieldHomePage({required this.openTab, super.key});

  final ValueChanged<int> openTab;

  @override
  State<FieldHomePage> createState() => _FieldHomePageState();
}

class _FieldHomePageState extends State<FieldHomePage> {
  final DashboardRepository _repository = DashboardRepository();

  DashboardSummary? _summary;
  String? _loadError;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadDashboard();
  }

  Future<void> _loadDashboard() async {
    if (mounted) {
      setState(() {
        _loading = true;
        _loadError = null;
      });
    }

    try {
      final summary = await _repository.load();

      if (!mounted) return;

      setState(() {
        _summary = summary;
        _loading = false;
      });
    } catch (error) {
      if (!mounted) return;

      setState(() {
        _loadError = error.toString();
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final summary = _summary;

    return Scaffold(
      appBar: AppBar(title: const Text(AppConfig.appName)),
      body: RefreshIndicator(
        onRefresh: _loadDashboard,
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(14, 12, 14, 24),
          children: [
            Text(
              'Field Dashboard',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 4),
            const Text('Current work, pickup decisions, storage, and results.'),
            const SizedBox(height: 14),
            _CurrentLoadCard(
              itemCount: summary?.draftLoadItemCount ?? 0,
              loading: _loading && summary == null,
              onOpen: () => widget.openTab(2),
            ),
            const SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: _MetricCard(
                    title: 'This Month',
                    value: summary == null
                        ? r'$0.00'
                        : '\$${(summary.monthNetCents / 100).toStringAsFixed(2)}',
                    subtitle: 'net',
                    icon: Icons.calendar_month,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _MetricCard(
                    title: 'Stored Value',
                    value: summary == null
                        ? r'$0.00'
                        : '\$${(summary.storedValueCents / 100).toStringAsFixed(2)}',
                    subtitle: summary == null
                        ? '0 items'
                        : '${summary.storedItemCount} items',
                    icon: Icons.warehouse,
                    onTap: () => widget.openTab(4),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            _PickupCard(
              opportunityCount: summary?.activeOpportunities ?? 0,
              topPerformer: summary?.topRecommendation,
              onOpen: () => widget.openTab(1),
            ),
            if (_loading) ...[
              const SizedBox(height: 12),
              const LinearProgressIndicator(),
            ],
            if (_loadError != null) ...[
              const SizedBox(height: 12),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.warning_amber),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              'Dashboard totals unavailable',
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        'Navigation and data-entry tools remain available.',
                      ),
                      const SizedBox(height: 10),
                      OutlinedButton.icon(
                        onPressed: _loadDashboard,
                        icon: const Icon(Icons.refresh),
                        label: const Text('Retry Totals'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
            const SizedBox(height: 14),
            Card(
              child: ListTile(
                leading: const CircleAvatar(child: Icon(Icons.insights)),
                title: const Text('Lifetime Results'),
                subtitle: Text(
                  summary == null
                      ? 'No totals loaded'
                      : '${summary.finalizedLoadCount} finalized loads',
                ),
                trailing: Text(
                  summary == null
                      ? r'$0.00'
                      : '\$${(summary.lifetimeNetCents / 100).toStringAsFixed(2)}',
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CurrentLoadCard extends StatelessWidget {
  const _CurrentLoadCard({
    required this.itemCount,
    required this.loading,
    required this.onOpen,
  });

  final int itemCount;
  final bool loading;
  final VoidCallback onOpen;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.primaryContainer,
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: const CircleAvatar(child: Icon(Icons.local_shipping)),
        title: const Text(
          'Current Load',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        subtitle: Text(
          loading
              ? 'Loading current load...'
              : itemCount == 0
              ? 'No items added yet'
              : '$itemCount item(s) in the draft load',
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: onOpen,
      ),
    );
  }
}

class _MetricCard extends StatelessWidget {
  const _MetricCard({
    required this.title,
    required this.value,
    required this.subtitle,
    required this.icon,
    this.onTap,
  });

  final String title;
  final String value;
  final String subtitle;
  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon),
              const SizedBox(height: 10),
              Text(value, style: Theme.of(context).textTheme.titleLarge),
              Text(title),
              Text(subtitle, style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ),
      ),
    );
  }
}

class _PickupCard extends StatelessWidget {
  const _PickupCard({
    required this.opportunityCount,
    required this.topPerformer,
    required this.onOpen,
  });

  final int opportunityCount;
  final String? topPerformer;
  final VoidCallback onOpen;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.all(14),
        leading: const CircleAvatar(child: Icon(Icons.recommend)),
        title: Text(
          opportunityCount == 0
              ? 'No pending pickups'
              : '$opportunityCount pending pickup(s)',
        ),
        subtitle: Text(
          topPerformer == null
              ? 'Performance recommendations will appear after results are recorded.'
              : 'Best recorded performer: $topPerformer',
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: onOpen,
      ),
    );
  }
}
