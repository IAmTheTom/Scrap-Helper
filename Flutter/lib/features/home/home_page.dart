import 'package:flutter/material.dart';

import '../../config/app_config.dart';
import '../loads/load_builder_page.dart';
import '../objects/object_browser_page.dart';
import '../prices/prices_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppConfig.appName)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            'Field Dashboard',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 6),
          const Text(
            'Set current yard prices, add objects, and build a working load estimate.',
          ),
          const SizedBox(height: 20),
          _ActionCard(
            icon: Icons.price_change,
            title: 'Update Yard Prices',
            subtitle: 'Enter current EH Recycling rates.',
            onTap: () => _open(context, const PricesPage()),
          ),
          _ActionCard(
            icon: Icons.search,
            title: 'Evaluate an Object',
            subtitle: 'Browse starter objects and choose recovery depth.',
            onTap: () => _open(context, const ObjectBrowserPage()),
          ),
          _ActionCard(
            icon: Icons.local_shipping,
            title: 'Current Load',
            subtitle: 'Review objects and low / likely / high payout.',
            onTap: () => _open(context, const LoadBuilderPage()),
          ),
          const SizedBox(height: 20),
          const Card(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'This first usable slice deliberately excludes accounts, cloud sync, ads, gamification, and AI. All calculations are local and deterministic.',
              ),
            ),
          ),
        ],
      ),
    );
  }

  static void _open(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute<void>(builder: (_) => page));
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
        contentPadding: const EdgeInsets.all(14),
        leading: CircleAvatar(child: Icon(icon)),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}
