import 'package:flutter/material.dart';

import '../backup/backup_restore_page.dart';
import '../exports/exports_page.dart';
import '../finalize/finalize_load_page.dart';
import '../history/history_page.dart';
import '../objects/object_browser_page.dart';
import '../performance/performance_page.dart';
import '../prices/prices_page.dart';
import '../reports/reports_page.dart';
import '../search/universal_search_page.dart';
import '../settings/settings_page.dart';

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('More')),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          const _SectionHeader('Workflows'),
          _MoreTile(
            icon: Icons.search,
            title: 'Object Library',
            subtitle: 'Add, browse, evaluate, and use reusable scrap objects.',
            page: const ObjectBrowserPage(),
          ),
          _MoreTile(
            icon: Icons.lock,
            title: 'Finalize Current Load',
            subtitle: 'Lock the current estimate before the yard run.',
            page: const FinalizeLoadPage(),
          ),
          _MoreTile(
            icon: Icons.history,
            title: 'Loads, Receipts & Results',
            subtitle: 'Review finalized loads and actual payouts.',
            page: const HistoryPage(),
          ),
          const _SectionHeader('Analysis'),
          _MoreTile(
            icon: Icons.insights,
            title: 'Personal Performance',
            subtitle: 'Net per item, net per hour, and recommendations.',
            page: const PerformancePage(),
          ),
          _MoreTile(
            icon: Icons.assessment,
            title: 'Reports',
            subtitle: 'Daily through lifetime results.',
            page: const ReportsPage(),
          ),
          _MoreTile(
            icon: Icons.manage_search,
            title: 'Search Everything',
            subtitle: 'Search objects, loads, pickups, and storage.',
            page: const UniversalSearchPage(),
          ),
          const _SectionHeader('Data & Configuration'),
          _MoreTile(
            icon: Icons.price_change,
            title: 'Yard Prices',
            subtitle: 'Update current scrapyard rates.',
            page: const PricesPage(),
          ),
          _MoreTile(
            icon: Icons.ios_share,
            title: 'Export Data',
            subtitle: 'Create JSON and CSV exports.',
            page: const ExportsPage(),
          ),
          _MoreTile(
            icon: Icons.backup,
            title: 'Backup & Restore',
            subtitle: 'Protect or restore the complete local database.',
            page: const BackupRestorePage(),
          ),
          _MoreTile(
            icon: Icons.settings,
            title: 'Settings',
            subtitle: 'Units, theme, travel cost, and defaults.',
            page: const SettingsPage(),
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 16, 8, 6),
      child: Text(text, style: Theme.of(context).textTheme.titleMedium),
    );
  }
}

class _MoreTile extends StatelessWidget {
  const _MoreTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.page,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final Widget page;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: CircleAvatar(child: Icon(icon)),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute<void>(builder: (_) => page),
        ),
      ),
    );
  }
}
