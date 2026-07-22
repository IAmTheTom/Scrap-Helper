import 'package:flutter/material.dart';

import '../ai/ai_item_advisor_page.dart';
import '../backup/backup_restore_page.dart';
import '../exports/exports_page.dart';
import '../finalize/finalize_load_page.dart';
import '../history/history_page.dart';
import '../loads/load_builder_page.dart';
import '../objects/object_browser_page.dart';
import '../opportunities/opportunity_queue_page.dart';
import '../performance/performance_page.dart';
import '../prices/prices_page.dart';
import '../reports/reports_page.dart';
import '../settings/settings_page.dart';
import '../storage/storage_page.dart';
import 'field_home_page.dart';

class FieldShell extends StatefulWidget {
  const FieldShell({super.key});

  @override
  State<FieldShell> createState() => _FieldShellState();
}

class _FieldShellState extends State<FieldShell> {
  int _selectedIndex = 0;

  late final List<Widget> _pages = <Widget>[
    FieldHomePage(openTab: _selectTab),
    const OpportunityQueuePage(),
    const LoadBuilderPage(),
    const ObjectBrowserPage(),
    const StoragePage(),
  ];

  void _selectTab(int index) {
    setState(() => _selectedIndex = index);
  }

  Future<void> _openPage(Widget page) async {
    await Navigator.push(
      context,
      MaterialPageRoute<void>(builder: (_) => page),
    );
  }

  void _openUtility(String value) {
    switch (value) {
      case 'advisor':
        _openPage(const AiItemAdvisorPage());
        return;
      case 'finalize':
        _openPage(const FinalizeLoadPage());
        return;
      case 'history':
        _openPage(const HistoryPage());
        return;
      case 'performance':
        _openPage(const PerformancePage());
        return;
      case 'reports':
        _openPage(const ReportsPage());
        return;
      case 'prices':
        _openPage(const PricesPage());
        return;
      case 'backup':
        _openPage(const BackupRestorePage());
        return;
      case 'export':
        _openPage(const ExportsPage());
        return;
      case 'settings':
        _openPage(const SettingsPage());
        return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          IndexedStack(index: _selectedIndex, children: _pages),
          Positioned(
            top: 5,
            right: 54,
            child: SafeArea(
              child: Material(
                elevation: 1,
                color: Theme.of(context).colorScheme.surfaceContainerHigh,
                shape: const CircleBorder(),
                child: PopupMenuButton<String>(
                  tooltip: 'More tools',
                  icon: const Icon(Icons.more_vert),
                  onSelected: _openUtility,
                  itemBuilder: (context) => const [
                    PopupMenuItem(
                      value: 'advisor',
                      child: ListTile(
                        leading: Icon(Icons.auto_awesome),
                        title: Text('Item Advisor'),
                      ),
                    ),
                    PopupMenuItem(
                      value: 'finalize',
                      child: ListTile(
                        leading: Icon(Icons.lock),
                        title: Text('Finalize Current Load'),
                      ),
                    ),
                    PopupMenuItem(
                      value: 'history',
                      child: ListTile(
                        leading: Icon(Icons.receipt_long),
                        title: Text('Loads & Receipts'),
                      ),
                    ),
                    PopupMenuItem(
                      value: 'performance',
                      child: ListTile(
                        leading: Icon(Icons.insights),
                        title: Text('Performance'),
                      ),
                    ),
                    PopupMenuItem(
                      value: 'reports',
                      child: ListTile(
                        leading: Icon(Icons.assessment),
                        title: Text('Reports'),
                      ),
                    ),
                    PopupMenuDivider(),
                    PopupMenuItem(
                      value: 'prices',
                      child: ListTile(
                        leading: Icon(Icons.price_change),
                        title: Text('Yard Prices'),
                      ),
                    ),
                    PopupMenuItem(
                      value: 'backup',
                      child: ListTile(
                        leading: Icon(Icons.backup),
                        title: Text('Backup & Restore'),
                      ),
                    ),
                    PopupMenuItem(
                      value: 'export',
                      child: ListTile(
                        leading: Icon(Icons.ios_share),
                        title: Text('Export Data'),
                      ),
                    ),
                    PopupMenuItem(
                      value: 'settings',
                      child: ListTile(
                        leading: Icon(Icons.settings),
                        title: Text('Settings'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _selectTab,
        destinations: const <NavigationDestination>[
          NavigationDestination(
            icon: Icon(Icons.dashboard_outlined),
            selectedIcon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          NavigationDestination(
            icon: Icon(Icons.add_location_alt_outlined),
            selectedIcon: Icon(Icons.add_location_alt),
            label: 'Pickups',
          ),
          NavigationDestination(
            icon: Icon(Icons.local_shipping_outlined),
            selectedIcon: Icon(Icons.local_shipping),
            label: 'Load',
          ),
          NavigationDestination(
            icon: Icon(Icons.inventory_2_outlined),
            selectedIcon: Icon(Icons.inventory_2),
            label: 'Objects',
          ),
          NavigationDestination(
            icon: Icon(Icons.warehouse_outlined),
            selectedIcon: Icon(Icons.warehouse),
            label: 'Storage',
          ),
        ],
      ),
    );
  }
}
