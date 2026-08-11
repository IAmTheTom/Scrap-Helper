part of '../../main.dart';

class TodayScreen extends StatelessWidget {
  const TodayScreen({
    super.key,
    required this.model,
    required this.changed,
    required this.goTo,
  });

  final ScrapprModel model;
  final VoidCallback changed;
  final ValueChanged<int> goTo;

  @override
  Widget build(BuildContext context) {
    final ready = model.items
        .where((item) => item.status == ItemStatus.readyForYard)
        .length;

    final activeProcessing = model.processingItems
        .where((item) => item.status != ItemStatus.complete)
        .length;

    return PageShell(
      title: 'Today',
      fab: FloatingActionButton.extended(
        onPressed: () => openAssistant(context, model),
        icon: const Icon(Icons.auto_awesome),
        label: const Text('Assistant'),
      ),
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            'Scrappr command center',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          sectionTitle(context, 'Quick actions'),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              FilledButton.icon(
                onPressed: () {
                  model.refreshSearch();
                  changed();
                  goTo(1);
                },
                icon: const Icon(Icons.refresh),
                label: const Text('Refresh Search'),
              ),
              FilledButton.tonalIcon(
                onPressed: () => showDialog<void>(
                  context: context,
                  builder: (_) => ItemDialog(model: model, changed: changed),
                ),
                icon: const Icon(Icons.add),
                label: const Text('Add Manual Item'),
              ),
              FilledButton.tonalIcon(
                onPressed: () => showDialog<void>(
                  context: context,
                  builder: (_) => ReceiptDialog(model: model, changed: changed),
                ),
                icon: const Icon(Icons.receipt_long),
                label: const Text('Add Receipt'),
              ),
              FilledButton.tonalIcon(
                onPressed: () => openAssistant(context, model),
                icon: const Icon(Icons.auto_awesome),
                label: const Text('Open Assistant'),
              ),
            ],
          ),
          sectionTitle(context, 'At a glance'),
          metricGrid(context, [
            Metric('New leads', '${model.leads.length}'),
            Metric('Processing queue', '$activeProcessing'),
            Metric('Ready for yard', '$ready'),
            Metric(
              'Active run',
              '\${model.runValue.toStringAsFixed(0)}',
              detail:
                  '${model.runItems.length} pickups  -  ${model.runMiles.toStringAsFixed(0)} mi',
            ),
          ]),
          if (!model.fitsVehicle)
            Card(
              color: Theme.of(context).colorScheme.errorContainer,
              child: const ListTile(
                leading: Icon(Icons.warning_amber),
                title: Text('Vehicle fit warning'),
                subtitle: Text(
                  'The active run exceeds the selected vehicle cargo limits. Split the run before leaving.',
                ),
              ),
            ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.route),
              title: Text(model.run.name),
              subtitle: Text(
                '${model.vehicle.name}  -  \${model.fuelCost.toStringAsFixed(2)} fuel  -  ${model.runMinutes} min',
              ),
              trailing: TextButton(
                onPressed: () => goTo(2),
                child: const Text('View run'),
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.lightbulb_outline),
              title: const Text('AI insight placeholder'),
              subtitle: Text(
                'Rule engine: ${model.fitsVehicle ? 'Your run fits. Compare yard prices before departure.' : 'Split the active run to stay within cargo limits.'}',
              ),
              trailing: TextButton(
                onPressed: () => openAssistant(context, model),
                child: const Text('Why?'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
