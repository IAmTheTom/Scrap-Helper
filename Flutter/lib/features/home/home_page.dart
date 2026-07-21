import 'package:flutter/material.dart';

import '../../config/app_config.dart';
import '../../data/models/productivity_models.dart';
import '../../data/repositories/dashboard_repository.dart';
import '../exports/exports_page.dart';
import '../finalize/finalize_load_page.dart';
import '../history/history_page.dart';
import '../loads/load_builder_page.dart';
import '../objects/object_browser_page.dart';
import '../opportunities/opportunity_queue_page.dart';
import '../performance/performance_page.dart';
import '../prices/prices_page.dart';
import '../reports/reports_page.dart';
import '../search/universal_search_page.dart';
import '../settings/settings_page.dart';
import '../storage/storage_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _repository = DashboardRepository();
  late Future<DashboardSummary> _future;

  @override
  void initState() {
    super.initState();
    _reload();
  }

  void _reload() {
    _future = _repository.load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConfig.appName),
        actions: [
          IconButton(
            onPressed: () => _open(const UniversalSearchPage()),
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () => _open(const SettingsPage()),
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          setState(_reload);
          await _future;
        },
        child: FutureBuilder<DashboardSummary>(
          future: _future,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return ListView(
                children: [
                  const SizedBox(height: 180),
                  Center(child: Text('Dashboard failed: ${snapshot.error}')),
                ],
              );
            }
            if (!snapshot.hasData) {
              return ListView(
                children: const [
                  SizedBox(height: 180),
                  Center(child: CircularProgressIndicator()),
                ],
              );
            }
            final summary = snapshot.data!;

            return ListView(
              padding: const EdgeInsets.all(14),
              children: [
                Text(
                  'Field Dashboard',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 10),
                _HeroCard(summary: summary),
                const SizedBox(height: 8),
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  childAspectRatio: 1.55,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  children: [
                    _MetricCard(
                      label: 'Pending pickups',
                      value: '${summary.activeOpportunities}',
                      icon: Icons.add_location_alt,
                    ),
                    _MetricCard(
                      label: 'Stored items',
                      value: '${summary.storedItemCount}',
                      icon: Icons.inventory_2,
                    ),
                    _MetricCard(
                      label: 'Stored value',
                      value:
                          '\$${(summary.storedValueCents / 100).toStringAsFixed(2)}',
                      icon: Icons.savings,
                    ),
                    _MetricCard(
                      label: 'Draft items',
                      value: '${summary.draftLoadItemCount}',
                      icon: Icons.local_shipping,
                    ),
                  ],
                ),
                if (summary.topRecommendation != null)
                  Card(
                    child: ListTile(
                      leading: const CircleAvatar(child: Icon(Icons.recommend)),
                      title: const Text('Top personal performer'),
                      subtitle: Text(summary.topRecommendation!),
                    ),
                  ),
                const SizedBox(height: 8),
                Text(
                  'Quick Actions',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                _ActionCard(
                  icon: Icons.add_location_alt,
                  title: 'Pickup Opportunities',
                  subtitle: 'Rank possible pickups.',
                  onTap: () => _open(const OpportunityQueuePage()),
                ),
                _ActionCard(
                  icon: Icons.inventory_2,
                  title: 'Storage & Processing Queue',
                  subtitle: 'Track waiting items and stored value.',
                  onTap: () => _open(const StoragePage()),
                ),
                _ActionCard(
                  icon: Icons.price_change,
                  title: 'Update Yard Prices',
                  subtitle: 'Enter current yard rates.',
                  onTap: () => _open(const PricesPage()),
                ),
                _ActionCard(
                  icon: Icons.search,
                  title: 'Evaluate an Object',
                  subtitle: 'Browse objects and recovery depth.',
                  onTap: () => _open(const ObjectBrowserPage()),
                ),
                _ActionCard(
                  icon: Icons.local_shipping,
                  title: 'Current Load',
                  subtitle: 'Review the draft load.',
                  onTap: () => _open(const LoadBuilderPage()),
                ),
                _ActionCard(
                  icon: Icons.lock,
                  title: 'Finalize Current Load',
                  subtitle: 'Lock the estimate.',
                  onTap: () => _open(const FinalizeLoadPage()),
                ),
                _ActionCard(
                  icon: Icons.history,
                  title: 'Loads, Receipts & Results',
                  subtitle: 'Compare estimates and actual payouts.',
                  onTap: () => _open(const HistoryPage()),
                ),
                _ActionCard(
                  icon: Icons.insights,
                  title: 'Personal Performance',
                  subtitle: 'Net/hour and recommendations.',
                  onTap: () => _open(const PerformancePage()),
                ),
                _ActionCard(
                  icon: Icons.assessment,
                  title: 'Reports',
                  subtitle: 'Today through lifetime performance.',
                  onTap: () => _open(const ReportsPage()),
                ),
                _ActionCard(
                  icon: Icons.ios_share,
                  title: 'Export Data',
                  subtitle: 'Complete JSON and load-summary CSV.',
                  onTap: () => _open(const ExportsPage()),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _open(Widget page) {
    Navigator.push(context, MaterialPageRoute<void>(builder: (_) => page)).then(
      (_) {
        if (mounted) setState(_reload);
      },
    );
  }
}

class _HeroCard extends StatelessWidget {
  const _HeroCard({required this.summary});

  final DashboardSummary summary;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('This Month'),
            Text(
              '\$${(summary.monthNetCents / 100).toStringAsFixed(2)} net',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              '\$${(summary.monthActualCents / 100).toStringAsFixed(2)} gross • '
              '\$${(summary.monthCostCents / 100).toStringAsFixed(2)} costs',
            ),
            const Divider(),
            Text(
              'Lifetime net: '
              '\$${(summary.lifetimeNetCents / 100).toStringAsFixed(2)} • '
              '${summary.finalizedLoadCount} finalized loads',
            ),
          ],
        ),
      ),
    );
  }
}

class _MetricCard extends StatelessWidget {
  const _MetricCard({
    required this.label,
    required this.value,
    required this.icon,
  });

  final String label;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            const SizedBox(height: 4),
            Text(value, style: Theme.of(context).textTheme.titleLarge),
            Text(label, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}

class _ActionCard extends StatelessWidget {
  const _ActionCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: CircleAvatar(child: Icon(icon)),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}
