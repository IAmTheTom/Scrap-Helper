import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../../recognition/runtime/model_pack_installer.dart';
import '../../recognition/runtime/model_pack_validator.dart';

class LocalModelManagerPage extends StatefulWidget {
  const LocalModelManagerPage({super.key});

  @override
  State<LocalModelManagerPage> createState() => _LocalModelManagerPageState();
}

class _LocalModelManagerPageState extends State<LocalModelManagerPage> {
  String _status = 'No model pack validated in this session.';
  bool _busy = false;

  Future<void> _validateAndInstall() async {
    final picked = await FilePicker.platform.getDirectoryPath(
      dialogTitle: 'Choose Scrap Helper model-pack folder',
    );
    if (picked == null) return;
    setState(() {
      _busy = true;
      _status = 'Validating model pack...';
    });
    try {
      final validation = await const ModelPackValidator().validateDirectory(
        picked,
      );
      if (!validation.isValid) {
        setState(() => _status = validation.message);
        return;
      }
      final installed = await const ModelPackInstaller().installFromDirectory(
        picked,
      );
      final manifest = installed.validation.manifest!;
      setState(() {
        _status =
            'Installed ${manifest.modelName} ${manifest.modelVersion}\n'
            'Taxonomy ${manifest.taxonomyVersion}\n'
            'Runtime ${manifest.runtime}\n'
            'Stored locally at ${installed.directoryPath}';
      });
    } catch (error) {
      setState(() => _status = 'Model installation failed: $error');
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Local AI Model')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Card(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Models are imported from local folders, validated by '
                'SHA-256, and run entirely on-device.',
              ),
            ),
          ),
          const SizedBox(height: 12),
          FilledButton.icon(
            key: const Key('import_local_model_pack'),
            onPressed: _busy ? null : _validateAndInstall,
            icon: _busy
                ? const SizedBox.square(
                    dimension: 18,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Icon(Icons.memory),
            label: const Text('Import Local Model Pack'),
          ),
          const SizedBox(height: 16),
          SelectableText(_status, key: const Key('local_model_status')),
        ],
      ),
    );
  }
}
