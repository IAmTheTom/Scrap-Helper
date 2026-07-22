import 'dart:io';

import 'package:flutter/material.dart';

import '../../data/models/attachment_models.dart';
import '../../data/repositories/attachment_repository.dart';
import '../../services/file_selection_service.dart';

class AttachmentsPage extends StatefulWidget {
  const AttachmentsPage({
    required this.entityType,
    required this.entityId,
    required this.title,
    super.key,
  });

  final String entityType;
  final int entityId;
  final String title;

  @override
  State<AttachmentsPage> createState() => _AttachmentsPageState();
}

class _AttachmentsPageState extends State<AttachmentsPage> {
  final _repository = AttachmentRepository();
  late Future<List<AttachmentRecord>> _future;

  @override
  void initState() {
    super.initState();
    _reload();
  }

  void _reload() {
    _future = _repository.listFor(
      entityType: widget.entityType,
      entityId: widget.entityId,
    );
  }

  Future<void> _add() async {
    final path = await FileSelectionService.selectAttachment();
    if (path == null) return;

    final lower = path.toLowerCase();
    final mediaType = lower.endsWith('.pdf') ? 'DOCUMENT' : 'IMAGE';
    await _repository.add(
      entityType: widget.entityType,
      entityId: widget.entityId,
      sourcePath: path,
      mediaType: mediaType,
    );
    setState(_reload);
  }

  Future<void> _remove(AttachmentRecord record) async {
    await _repository.remove(record);
    setState(_reload);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(onPressed: _add, icon: const Icon(Icons.attach_file)),
        ],
      ),
      body: FutureBuilder<List<AttachmentRecord>>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Attachments failed: ${snapshot.error}'));
          }
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final records = snapshot.data!;
          if (records.isEmpty) {
            return const Center(child: Text('No attachments yet.'));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: records.length,
            itemBuilder: (context, index) {
              final record = records[index];
              final exists = File(record.filePath).existsSync();
              return Card(
                child: ListTile(
                  leading: Icon(
                    record.mediaType == 'IMAGE'
                        ? Icons.image
                        : Icons.description,
                  ),
                  title: Text(record.displayName ?? 'Attachment'),
                  subtitle: Text(
                    exists ? record.filePath : 'Missing local file',
                  ),
                  trailing: IconButton(
                    onPressed: () => _remove(record),
                    icon: const Icon(Icons.delete_outline),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        heroTag: null,
        onPressed: _add,
        icon: const Icon(Icons.add_photo_alternate),
        label: const Text('Attach'),
      ),
    );
  }
}
