part of '../../main.dart';

class InboxScreen extends StatelessWidget {
  const InboxScreen({super.key, required this.model, required this.changed});
  final ScrapprModel model;
  final VoidCallback changed;

  String notificationEligibility(ScrapItem item) {
    final settings = model.notificationSettings;
    if (!settings.notificationsEnabled) {
      return 'Not eligible - prototype notifications are disabled';
    }
    if (!settings.notifyNewMatches) {
      return 'Not eligible - new match notifications are off';
    }
    final value = model.template(item.templateId).likelyValue;
    if (settings.notifyHighValueOnly &&
        value < settings.minimumValueThreshold) {
      return 'Not eligible - below the value threshold';
    }
    if (item.duplicateWarning && !settings.notifyDuplicates) {
      return 'Not eligible - duplicate notifications are off';
    }
    return 'Eligible placeholder - Android integration pending';
  }

  @override
  Widget build(BuildContext context) => PageShell(
    title: 'Inbox',
    child: ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Saved search results',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        model.lastRefresh == null
                            ? 'Not refreshed this session'
                            : 'Last refresh: ${model.lastRefresh!.toLocal()}',
                      ),
                    ],
                  ),
                ),
                FilledButton.icon(
                  onPressed: () {
                    model.refreshSearch();
                    changed();
                  },
                  icon: const Icon(Icons.refresh),
                  label: const Text('Refresh Search'),
                ),
              ],
            ),
          ),
        ),
        sectionTitle(context, 'Search results'),
        if (model.leads.isEmpty)
          const Card(
            child: ListTile(
              title: Text('Inbox clear'),
              subtitle: Text(
                'Refresh Search to generate local placeholder results.',
              ),
            ),
          ),
        for (final item in model.leads)
          Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          item.title,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      IconButton(
                        tooltip:
                            'Inbox result photos (${model.photoCount(item.id, PhotoOwnerType.inboxItem)})',
                        onPressed: () => CameraService().attach(
                          context,
                          model: model,
                          changed: changed,
                          ownerId: item.id,
                          ownerType: PhotoOwnerType.inboxItem,
                          label: 'Inbox result',
                        ),
                        icon: const Icon(Icons.add_a_photo_outlined),
                      ),
                    ],
                  ),
                  Text(
                    'Source: ${item.source} - ${item.locationName} - ${item.miles.toStringAsFixed(1)} mi',
                  ),
                  Text('${item.pickupAddress}  -  ${item.timeWindow}'),
                  const SizedBox(height: 6),
                  Text('Rule match: ${item.ruleMatch}'),
                  Text(
                    'Notification: ${notificationEligibility(item)}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  if (item.duplicateWarning)
                    const Padding(
                      padding: EdgeInsets.only(top: 6),
                      child: Row(
                        children: [
                          Icon(Icons.copy_all, size: 18),
                          SizedBox(width: 6),
                          Text('Possible duplicate - comparison pending'),
                        ],
                      ),
                    ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: [
                      FilledButton(
                        onPressed: () {
                          item.status = ItemStatus.claimed;
                          if (!model.run.itemIds.contains(item.id)) {
                            model.run.itemIds.add(item.id);
                          }
                          changed();
                        },
                        child: const Text('Add to Run'),
                      ),
                      TextButton(
                        onPressed: () {
                          item.status = ItemStatus.ignored;
                          changed();
                        },
                        child: const Text('Ignore'),
                      ),
                      TextButton(
                        onPressed: () => pending(
                          context,
                          'Opening source listings is not connected yet.',
                        ),
                        child: const Text('Open source listing'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
      ],
    ),
  );
}
