part of '../../main.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key, required this.model, required this.changed});
  final ScrapprModel model;
  final VoidCallback changed;
  @override
  Widget build(BuildContext context) => PageShell(
    title: 'Settings',
    child: ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Card(
          child: ListTile(
            leading: Icon(Icons.storage_outlined),
            title: Text('SQLite persistence active'),
            subtitle: Text(
              'Restart check: edit a vehicle note, add a receipt and object template, close Scrappr, then relaunch and verify them here.',
            ),
          ),
        ),
        sectionTitle(
          context,
          'Home Base',
          action: TextButton(
            onPressed: () => showDialog<void>(
              context: context,
              builder: (_) =>
                  HomeBaseDialog(homeBase: model.homeBase, changed: changed),
            ),
            child: const Text('Edit'),
          ),
        ),
        Card(
          child: ListTile(
            leading: const Icon(Icons.home_outlined),
            title: Text(model.homeBase.label),
            subtitle: Text(
              '${model.homeBase.address}, ${model.homeBase.cityStateZip}\nFuel: \$${model.homeBase.defaultFuelPrice.toStringAsFixed(2)}/gal - ${model.homeBase.notes}',
            ),
            isThreeLine: true,
          ),
        ),
        sectionTitle(
          context,
          'Vehicles',
          action: TextButton.icon(
            onPressed: () => showDialog(
              context: context,
              builder: (_) => VehicleDialog(model: model, changed: changed),
            ),
            icon: const Icon(Icons.add),
            label: const Text('Add'),
          ),
        ),
        for (final vehicle in model.vehicles)
          Card(
            child: ListTile(
              onTap: () => showDialog(
                context: context,
                builder: (_) => VehicleDialog(
                  model: model,
                  changed: changed,
                  vehicle: vehicle,
                ),
              ),
              title: Text(vehicle.name),
              subtitle: Text(
                '${vehicle.type}  -  ${vehicle.mpg} MPG  -  ${vehicle.cargoLength}x${vehicle.cargoWidth}x${vehicle.cargoHeight} in  -  ${vehicle.payloadLimit} lb\nLimits: ${vehicle.fullCargo} full cargo, ${vehicle.largeUpright} upright, ${vehicle.medium} medium  -  ${vehicle.notes}',
              ),
              isThreeLine: true,
              trailing: IconButton(
                onPressed: model.vehicles.length == 1
                    ? null
                    : () {
                        model.vehicles.remove(vehicle);
                        if (model.run.vehicleId == vehicle.id) {
                          model.run.vehicleId = model.vehicles.first.id;
                        }
                        changed();
                      },
                icon: const Icon(Icons.delete_outline),
              ),
            ),
          ),
        sectionTitle(
          context,
          'Scrapyards',
          action: TextButton.icon(
            onPressed: () => showDialog(
              context: context,
              builder: (_) => YardDialog(model: model, changed: changed),
            ),
            icon: const Icon(Icons.add),
            label: const Text('Add'),
          ),
        ),
        for (final yard in model.yards)
          Card(
            child: ExpansionTile(
              title: Text(
                '${yard.preferred ? 'Preferred:  ' : ''}${yard.name}',
              ),
              subtitle: Text(
                '${yard.address}, ${yard.cityStateZip}\n${yard.phone}  -  ${yard.hours}',
              ),
              children: [
                ListTile(
                  title: const Text('Notes'),
                  subtitle: Text(yard.notes),
                ),
                ...model.yardPrices
                    .where((p) => p.yardId == yard.id)
                    .map(
                      (price) => ListTile(
                        title: Text(price.material),
                        subtitle: Text(
                          '\$${price.price.toStringAsFixed(2)} ${price.unit}  -  updated ${price.updatedAt.toLocal().toString().split(' ').first}\n${price.notes}',
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            model.yardPrices.remove(price);
                            changed();
                          },
                          icon: const Icon(Icons.delete_outline),
                        ),
                      ),
                    ),
                OverflowBar(
                  children: [
                    TextButton(
                      onPressed: () => showDialog(
                        context: context,
                        builder: (_) => YardPriceDialog(
                          model: model,
                          changed: changed,
                          yardId: yard.id,
                        ),
                      ),
                      child: const Text('Add price'),
                    ),
                    TextButton(
                      onPressed: () => showDialog(
                        context: context,
                        builder: (_) => YardDialog(
                          model: model,
                          changed: changed,
                          yard: yard,
                        ),
                      ),
                      child: const Text('Edit yard'),
                    ),
                    TextButton(
                      onPressed: () async {
                        final service = PhotoAttachmentService();
                        await service.deleteForOwner(
                          model.photos,
                          ownerId: yard.id,
                          ownerTypes: const [PhotoOwnerType.yard],
                        );
                        final receiptIds = model.receipts
                            .where((receipt) => receipt.yardId == yard.id)
                            .map((receipt) => receipt.id)
                            .toList();
                        for (final receiptId in receiptIds) {
                          await service.deleteForOwner(
                            model.photos,
                            ownerId: receiptId,
                            ownerTypes: const [PhotoOwnerType.receipt],
                          );
                        }
                        model.yards.remove(yard);
                        model.yardPrices.removeWhere(
                          (p) => p.yardId == yard.id,
                        );
                        model.receipts.removeWhere(
                          (receipt) => receipt.yardId == yard.id,
                        );
                        changed();
                      },
                      child: const Text('Delete'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        sectionTitle(context, 'Search Sources'),
        const Card(
          child: ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('Search integrations are placeholders'),
            subtitle: Text(
              'Sources configure in-memory workflow only. No marketplace scraping is connected.',
            ),
          ),
        ),
        for (final source in model.searchSources)
          Card(
            child: ExpansionTile(
              leading: Switch(
                value: source.enabled,
                onChanged: (value) {
                  source.enabled = value;
                  changed();
                },
              ),
              title: Text(source.name),
              subtitle: Text(
                '${source.type} - ${source.defaultRadius.toStringAsFixed(0)} mi default',
              ),
              children: [
                ListTile(
                  title: const Text('Capabilities'),
                  subtitle: Text(
                    'Direct links: ${source.supportsDirectLink ? 'yes' : 'no'} - '
                    'Manual entry: ${source.supportsManualEntry ? 'yes' : 'no'} - '
                    'Notifications: ${source.supportsNotifications ? 'yes' : 'no'}',
                  ),
                ),
                ListTile(
                  title: const Text('Notes'),
                  subtitle: Text(source.notes),
                  trailing: TextButton(
                    onPressed: () => showDialog<void>(
                      context: context,
                      builder: (_) =>
                          SearchSourceDialog(source: source, changed: changed),
                    ),
                    child: const Text('Edit'),
                  ),
                ),
              ],
            ),
          ),
        sectionTitle(
          context,
          'Search Rules',
          action: TextButton.icon(
            onPressed: () => showDialog(
              context: context,
              builder: (_) => SearchRuleDialog(model: model, changed: changed),
            ),
            icon: const Icon(Icons.add),
            label: const Text('Add'),
          ),
        ),
        for (final rule in model.searchRules)
          Card(
            child: ListTile(
              onTap: () => showDialog(
                context: context,
                builder: (_) => SearchRuleDialog(
                  model: model,
                  changed: changed,
                  rule: rule,
                ),
              ),
              title: Text(rule.name),
              subtitle: Text(
                '${model.sourceSummary(rule)} - ${rule.maxRadius} mi - ${rule.enabled ? 'Enabled' : 'Disabled'} - notify ${rule.notify ? 'yes' : 'no'}\nKeywords: ${rule.keywords}\nExclude: ${rule.excludedWords}',
              ),
              isThreeLine: true,
              trailing: IconButton(
                onPressed: () {
                  model.searchRules.remove(rule);
                  changed();
                },
                icon: const Icon(Icons.delete_outline),
              ),
            ),
          ),
        sectionTitle(
          context,
          'Notifications',
          action: TextButton(
            onPressed: () => showDialog<void>(
              context: context,
              builder: (_) => NotificationSettingsDialog(
                settings: model.notificationSettings,
                changed: changed,
              ),
            ),
            child: const Text('Edit'),
          ),
        ),
        Card(
          child: ListTile(
            leading: const Icon(Icons.notifications_outlined),
            title: const Text('Android notification integration pending.'),
            subtitle: Text(
              '${model.notificationSettings.notificationsEnabled ? 'Enabled in prototype' : 'Disabled'} - '
              'threshold \$${model.notificationSettings.minimumValueThreshold.toStringAsFixed(0)} - '
              'quiet hours ${model.notificationSettings.quietHoursEnabled ? '${model.notificationSettings.quietStart}-${model.notificationSettings.quietEnd}' : 'off'}',
            ),
          ),
        ),
        const Card(
          child: ListTile(
            leading: Icon(Icons.camera_alt_outlined),
            title: Text('Camera & photos'),
            subtitle: Text(
              'Android camera capture and photo selection are available. Capture is unavailable on unsupported platforms.',
            ),
          ),
        ),
        const Card(
          child: ListTile(
            leading: Icon(Icons.auto_awesome),
            title: Text('AI assistant'),
            subtitle: Text(
              'No AI model is connected. Responses are deterministic/rule-engine placeholders.',
            ),
          ),
        ),
      ],
    ),
  );
}
