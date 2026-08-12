part of '../../main.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key, required this.model, required this.changed});
  final ScrapprModel model;
  final VoidCallback changed;
  @override
  Widget build(BuildContext context) => PageShell(
    title: 'Object Library',
    fab: FloatingActionButton.extended(
      onPressed: () => showDialog(
        context: context,
        builder: (_) => TemplateDialog(model: model, changed: changed),
      ),
      icon: const Icon(Icons.add),
      label: const Text('Add object'),
    ),
    child: ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Card(
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Text(
              'Cargo demand: Full cargo means the object uses the main cargo area of the selected vehicle.',
            ),
          ),
        ),
        for (final template in model.templates)
          Card(
            child: ExpansionTile(
              title: Text(template.name),
              subtitle: Text(
                '${template.category}  -  Cargo demand: ${cargoLabel(template.cargoDemand)}  -  \$${template.lowValue.toStringAsFixed(0)}-\$${template.highValue.toStringAsFixed(0)}',
              ),
              children: [
                ListTile(
                  title: const Text('Aliases'),
                  subtitle: Text(template.aliases),
                ),
                ListTile(
                  title: const Text('Destination & strip work'),
                  subtitle: Text(
                    '${destinationLabel(template.destination)}  -  ${template.stripMinutes} min  -  difficulty ${template.stripDifficulty}/5',
                  ),
                ),
                ListTile(
                  title: const Text('Recoverable materials'),
                  subtitle: Text(template.recoverableMaterials),
                ),
                ListTile(
                  title: const Text('Safety'),
                  subtitle: Text(template.safetyNotes),
                ),
                ListTile(
                  title: const Text('Tools / part-out'),
                  subtitle: Text(
                    '${template.toolsNeeded}\n${template.partOutNotes}',
                  ),
                ),
                OverflowBar(
                  children: [
                    TextButton.icon(
                      onPressed: () => CameraService().attach(
                        context,
                        model: model,
                        changed: changed,
                        ownerId: template.id,
                        ownerType: PhotoOwnerType.objectTemplate,
                        label: 'Object library reference',
                      ),
                      icon: const Icon(Icons.add_a_photo_outlined),
                      label: Text(
                        'Reference photos (${model.photoCount(template.id, PhotoOwnerType.objectTemplate)})',
                      ),
                    ),
                    TextButton(
                      onPressed: () => showDialog(
                        context: context,
                        builder: (_) => TemplateDialog(
                          model: model,
                          changed: changed,
                          template: template,
                        ),
                      ),
                      child: const Text('Edit'),
                    ),
                    TextButton(
                      onPressed: () async {
                        final removedItemIds = model.items
                            .where((item) => item.templateId == template.id)
                            .map((item) => item.id)
                            .toSet();
                        model.items.removeWhere(
                          (item) => removedItemIds.contains(item.id),
                        );
                        model.run.itemIds.removeWhere(removedItemIds.contains);
                        final service = PhotoAttachmentService();
                        for (final itemId in removedItemIds) {
                          await service.deleteForOwner(
                            model.photos,
                            ownerId: itemId,
                            ownerTypes: const [
                              PhotoOwnerType.inboxItem,
                              PhotoOwnerType.runItem,
                              PhotoOwnerType.processingItem,
                            ],
                          );
                        }
                        final photos = service.listForOwner(
                          model.photos,
                          ownerId: template.id,
                          ownerType: PhotoOwnerType.objectTemplate,
                        );
                        for (final photo in photos) {
                          await service.delete(model.photos, photo);
                        }
                        model.templates.remove(template);
                        changed();
                      },
                      child: const Text('Delete'),
                    ),
                  ],
                ),
              ],
            ),
          ),
      ],
    ),
  );
}
