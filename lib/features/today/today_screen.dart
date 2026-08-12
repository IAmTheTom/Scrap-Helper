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
    final nextAction = !model.fitsVehicle
        ? 'Split the active run before leaving.'
        : model.leads.isNotEmpty
        ? 'Review ${model.leads.length} new lead${model.leads.length == 1 ? '' : 's'} and add the best pickup.'
        : activeProcessing > 0
        ? 'Process the oldest item in the at-home queue.'
        : 'Refresh Search for new local placeholder leads.';

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
          Card(
            color: Theme.of(context).colorScheme.primaryContainer,
            child: ListTile(
              dense: true,
              leading: const Icon(Icons.bolt),
              title: const Text('Best next action'),
              subtitle: Text(nextAction),
              trailing: TextButton(
                onPressed: model.leads.isNotEmpty ? () => goTo(1) : null,
                child: const Text('Open'),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              model.run.name,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Text(
                              '${model.runItems.length} pickups - ${model.vehicle.name}',
                            ),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () => goTo(2),
                        child: const Text('View run'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      _TodayMetric(
                        label: 'Value',
                        value: '\$${model.runValue.toStringAsFixed(0)}',
                      ),
                      _TodayMetric(
                        label: 'Miles',
                        value: model.runMiles.toStringAsFixed(0),
                      ),
                      _TodayMetric(
                        label: 'Fuel',
                        value: '\$${model.fuelCost.toStringAsFixed(2)}',
                      ),
                      _TodayMetric(
                        label: 'Time',
                        value: '${model.runMinutes} min',
                      ),
                      _TodayMetric(
                        label: 'Fit',
                        value: model.fitsVehicle ? 'Ready' : 'Warning',
                      ),
                    ],
                  ),
                ],
              ),
            ),
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
          sectionTitle(context, 'Needs attention'),
          if (model.fitsVehicle && model.leads.isEmpty && activeProcessing == 0)
            const Card(
              child: ListTile(
                dense: true,
                leading: Icon(Icons.check_circle_outline),
                title: Text('Nothing urgent'),
              ),
            ),
          if (!model.fitsVehicle)
            Card(
              color: Theme.of(context).colorScheme.errorContainer,
              child: const ListTile(
                dense: true,
                leading: Icon(Icons.warning_amber),
                title: Text('Vehicle fit warning'),
                subtitle: Text('Split the active run before leaving.'),
              ),
            ),
          if (model.leads.isNotEmpty)
            ListTile(
              dense: true,
              leading: const Icon(Icons.inbox_outlined),
              title: Text('${model.leads.length} search leads to review'),
              trailing: TextButton(
                onPressed: () => goTo(1),
                child: const Text('Review'),
              ),
            ),
          if (activeProcessing > 0)
            ListTile(
              dense: true,
              leading: const Icon(Icons.construction_outlined),
              title: Text('$activeProcessing processing items open'),
              subtitle: Text('$ready ready for yard'),
              trailing: TextButton(
                onPressed: () => goTo(3),
                child: const Text('Open'),
              ),
            ),
        ],
      ),
    );
  }
}

class _TodayMetric extends StatelessWidget {
  const _TodayMetric({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Text('$label: $value'),
  );
}
