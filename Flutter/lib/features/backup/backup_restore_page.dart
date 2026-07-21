import 'package:flutter/material.dart';

import '../../services/backup_service.dart';
import '../../services/file_selection_service.dart';

class BackupRestorePage extends StatefulWidget {
  const BackupRestorePage({super.key});

  @override
  State<BackupRestorePage> createState() => _BackupRestorePageState();
}

class _BackupRestorePageState extends State<BackupRestorePage> {
  final _service = BackupService();
  bool _working = false;

  Future<void> _backup() async {
    if (_working) return;
    setState(() => _working = true);
    try {
      final file = await _service.createBackup();
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Backup created: ${file.path}')));
    } finally {
      if (mounted) setState(() => _working = false);
    }
  }

  Future<void> _restore() async {
    if (_working) return;
    final path = await FileSelectionService.selectBackup();
    if (path == null) return;

    final validation = await _service.validateFile(path);
    if (!mounted) return;
    if (!validation.isValid) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(validation.message)));
      return;
    }

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Restore backup?'),
        content: const Text(
          'This replaces the current local database with the selected backup.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Restore'),
          ),
        ],
      ),
    );
    if (confirmed != true) return;

    setState(() => _working = true);
    try {
      await _service.restoreFromFile(path);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Backup restored. Restart the app before continuing.'),
        ),
      );
    } catch (error) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Restore failed: $error')));
    } finally {
      if (mounted) setState(() => _working = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Backup & Restore')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Card(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Backups contain the complete local dataset. Keep copies outside the device before major updates.',
              ),
            ),
          ),
          FilledButton.icon(
            onPressed: _working ? null : _backup,
            icon: const Icon(Icons.backup),
            label: const Text('Create Full Backup'),
          ),
          const SizedBox(height: 8),
          OutlinedButton.icon(
            onPressed: _working ? null : _restore,
            icon: const Icon(Icons.restore),
            label: const Text('Validate and Restore Backup'),
          ),
        ],
      ),
    );
  }
}
