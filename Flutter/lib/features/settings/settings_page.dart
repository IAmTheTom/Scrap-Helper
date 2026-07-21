import 'package:flutter/material.dart';

import '../../data/models/productivity_models.dart';
import '../../data/repositories/settings_repository.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final _repository = SettingsRepository();
  late Future<AppPreferences> _future;
  AppPreferences? _preferences;
  final _travelCost = TextEditingController();

  @override
  void initState() {
    super.initState();
    _future = _repository.load();
  }

  @override
  void dispose() {
    _travelCost.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final preferences = _preferences;
    if (preferences == null) return;
    final cost = int.tryParse(_travelCost.text.trim());
    if (cost == null || cost < 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Enter travel cost as cents per mile.')),
      );
      return;
    }

    await _repository.save(
      AppPreferences(
        weightDisplaySystem: preferences.weightDisplaySystem,
        themeMode: preferences.themeMode,
        travelCostCentsPerMile: cost,
        defaultRecoveryLevel: preferences.defaultRecoveryLevel,
        currencyCode: preferences.currencyCode,
      ),
    );
    if (!mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Settings saved.')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: FutureBuilder<AppPreferences>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Settings failed: ${snapshot.error}'));
          }
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          _preferences ??= snapshot.data;
          final preferences = _preferences!;
          if (_travelCost.text.isEmpty) {
            _travelCost.text = preferences.travelCostCentsPerMile.toString();
          }

          return ListView(
            padding: const EdgeInsets.all(12),
            children: [
              DropdownButtonFormField<String>(
                initialValue: preferences.weightDisplaySystem,
                decoration: const InputDecoration(labelText: 'Weight units'),
                items: const [
                  DropdownMenuItem(
                    value: 'US_CUSTOMARY',
                    child: Text('US customary'),
                  ),
                  DropdownMenuItem(value: 'METRIC', child: Text('Metric')),
                ],
                onChanged: (value) => setState(() {
                  _preferences = AppPreferences(
                    weightDisplaySystem: value!,
                    themeMode: preferences.themeMode,
                    travelCostCentsPerMile: preferences.travelCostCentsPerMile,
                    defaultRecoveryLevel: preferences.defaultRecoveryLevel,
                    currencyCode: preferences.currencyCode,
                  );
                }),
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                initialValue: preferences.themeMode,
                decoration: const InputDecoration(labelText: 'Theme'),
                items: const [
                  DropdownMenuItem(value: 'SYSTEM', child: Text('System')),
                  DropdownMenuItem(value: 'LIGHT', child: Text('Light')),
                  DropdownMenuItem(value: 'DARK', child: Text('Dark')),
                ],
                onChanged: (value) => setState(() {
                  _preferences = AppPreferences(
                    weightDisplaySystem: preferences.weightDisplaySystem,
                    themeMode: value!,
                    travelCostCentsPerMile: preferences.travelCostCentsPerMile,
                    defaultRecoveryLevel: preferences.defaultRecoveryLevel,
                    currencyCode: preferences.currencyCode,
                  );
                }),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _travelCost,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Planning travel cost',
                  suffixText: 'cents/mile',
                ),
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                initialValue: preferences.defaultRecoveryLevel,
                decoration: const InputDecoration(
                  labelText: 'Default recovery level',
                ),
                items: const [
                  DropdownMenuItem(
                    value: 'SELL_WHOLE',
                    child: Text('Sell whole'),
                  ),
                  DropdownMenuItem(value: 'QUICK', child: Text('Quick')),
                  DropdownMenuItem(value: 'STANDARD', child: Text('Standard')),
                  DropdownMenuItem(value: 'DEEP', child: Text('Deep')),
                ],
                onChanged: (value) => setState(() {
                  _preferences = AppPreferences(
                    weightDisplaySystem: preferences.weightDisplaySystem,
                    themeMode: preferences.themeMode,
                    travelCostCentsPerMile: preferences.travelCostCentsPerMile,
                    defaultRecoveryLevel: value!,
                    currencyCode: preferences.currencyCode,
                  );
                }),
              ),
              const SizedBox(height: 16),
              FilledButton.icon(
                onPressed: _save,
                icon: const Icon(Icons.save),
                label: const Text('Save Settings'),
              ),
            ],
          );
        },
      ),
    );
  }
}
