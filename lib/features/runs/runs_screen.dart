part of '../../main.dart';

class RunsScreen extends StatelessWidget {
  const RunsScreen({super.key, required this.model, required this.changed});
  final ScrapprModel model;
  final VoidCallback changed;
  @override
  Widget build(BuildContext context) => PageShell(
    title: 'Runs',
    fab: FloatingActionButton.extended(
      onPressed: () => showDialog(
        context: context,
        builder: (_) => ItemDialog(model: model, changed: changed),
      ),
      icon: const Icon(Icons.add),
      label: const Text('Add item'),
    ),
    child: ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text(model.run.name, style: Theme.of(context).textTheme.headlineSmall),
        Text(model.vehicle.name),
        const SizedBox(height: 12),
        metricGrid(context, [
          Metric('Estimated value', '\$${model.runValue.toStringAsFixed(0)}'),
          Metric('Estimated miles', model.runMiles.toStringAsFixed(1)),
          Metric('Estimated fuel', '\$${model.fuelCost.toStringAsFixed(2)}'),
          Metric('Estimated time', '${model.runMinutes} min'),
          Metric('Vehicle fit', model.fitsVehicle ? 'Fits' : 'Warning'),
          Metric(
            'Destinations',
            '${model.homeCount} home / ${model.yardCount} yard',
          ),
        ]),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            FilledButton.tonalIcon(
              onPressed: () => const RouteService().showHandoff(context, model),
              icon: const Icon(Icons.map_outlined),
              label: const Text('Open in Maps'),
            ),
            FilledButton.tonalIcon(
              onPressed: () => pending(context, 'Route optimization pending.'),
              icon: const Icon(Icons.alt_route),
              label: const Text('Optimize route'),
            ),
            FilledButton.tonalIcon(
              onPressed: () => pending(context, 'Run splitting pending.'),
              icon: const Icon(Icons.call_split),
              label: const Text('Split run'),
            ),
            OutlinedButton(
              onPressed: () => openAssistant(context, model),
              child: const Text('Why?'),
            ),
            OutlinedButton(
              onPressed: () => openAssistant(context, model),
              child: const Text('What should I strip?'),
            ),
            OutlinedButton(
              onPressed: () => openAssistant(context, model),
              child: const Text('Safety concerns'),
            ),
            OutlinedButton(
              onPressed: () => openAssistant(context, model),
              child: const Text('Home or yard?'),
            ),
          ],
        ),
        if (!model.fitsVehicle)
          Card(
            color: Theme.of(context).colorScheme.errorContainer,
            child: const ListTile(
              leading: Icon(Icons.warning),
              title: Text('Vehicle fit warning'),
              subtitle: Text('Cargo demand exceeds the vehicle profile.'),
            ),
          ),
        sectionTitle(context, 'Run items'),
        if (model.runItems.isEmpty) const Text('No items in this run.'),
        for (final item in model.runItems)
          Card(
            child: ListTile(
              onTap: () => showDialog(
                context: context,
                builder: (_) =>
                    ItemDialog(model: model, changed: changed, item: item),
              ),
              leading: IconButton(
                tooltip:
                    'Pickup photos (${model.photoCount(item.id, PhotoOwnerType.runItem)})',
                onPressed: () => CameraService().attach(
                  context,
                  model: model,
                  changed: changed,
                  ownerId: item.id,
                  ownerType: PhotoOwnerType.runItem,
                  label: 'Run item pickup',
                ),
                icon: const Icon(Icons.add_a_photo_outlined),
              ),
              title: Text(item.title),
              subtitle: Text(
                '${item.pickupAddress}  -  ${item.timeWindow}\n${destinationLabel(item.destination)}  -  ${statusLabel(item.status)}',
              ),
              isThreeLine: true,
              trailing: Wrap(
                spacing: 4,
                children: [
                  IconButton(
                    tooltip: 'Mark picked up',
                    onPressed: () {
                      item.status = ItemStatus.pickedUp;
                      changed();
                    },
                    icon: const Icon(Icons.check_circle_outline),
                  ),
                  IconButton(
                    tooltip: 'Remove',
                    onPressed: () {
                      model.run.itemIds.remove(item.id);
                      changed();
                    },
                    icon: const Icon(Icons.remove_circle_outline),
                  ),
                ],
              ),
            ),
          ),
      ],
    ),
  );
}
