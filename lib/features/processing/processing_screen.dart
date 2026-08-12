part of '../../main.dart';

class ProcessingScreen extends StatelessWidget {
  const ProcessingScreen({
    super.key,
    required this.model,
    required this.changed,
  });
  final ScrapprModel model;
  final VoidCallback changed;
  @override
  Widget build(BuildContext context) {
    const groups = [
      ItemStatus.atHome,
      ItemStatus.needsStripping,
      ItemStatus.processing,
      ItemStatus.readyForYard,
      ItemStatus.complete,
    ];
    return PageShell(
      title: 'Processing',
      fab: FloatingActionButton.extended(
        onPressed: () => showDialog(
          context: context,
          builder: (_) => ProcessingItemDialog(model: model, changed: changed),
        ),
        icon: const Icon(Icons.add),
        label: const Text('Add processing item'),
      ),
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          for (final group in groups) ...[
            sectionTitle(context, statusLabel(group)),
            if (model.processingItems.where((i) => i.status == group).isEmpty)
              const Text('No items'),
            for (final item in model.processingItems.where(
              (i) => i.status == group,
            ))
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 6),
                      DropdownButton<ItemStatus>(
                        value: item.status,
                        items: groups
                            .map(
                              (s) => DropdownMenuItem(
                                value: s,
                                child: Text(statusLabel(s)),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          if (value != null) {
                            item.status = value;
                            changed();
                          }
                        },
                      ),
                      Wrap(
                        spacing: 6,
                        runSpacing: 6,
                        children: [
                          TextButton.icon(
                            onPressed: () => CameraService().attach(
                              context,
                              model: model,
                              changed: changed,
                              ownerId: item.id,
                              ownerType: PhotoOwnerType.processingItem,
                              label: 'Processing item',
                            ),
                            icon: const Icon(Icons.add_a_photo_outlined),
                            label: Text(
                              'Photos (${model.photoCount(item.id, PhotoOwnerType.processingItem)})',
                            ),
                          ),
                          TextButton.icon(
                            onPressed: () => openAssistant(context, model),
                            icon: const Icon(Icons.auto_awesome),
                            label: const Text('Ask AI'),
                          ),
                          TextButton(
                            onPressed: () {
                              item.status = ItemStatus.readyForYard;
                              changed();
                            },
                            child: const Text('Mark ready for yard'),
                          ),
                          TextButton(
                            onPressed: () {
                              item.status = ItemStatus.complete;
                              changed();
                            },
                            child: const Text('Complete'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ],
      ),
    );
  }
}
