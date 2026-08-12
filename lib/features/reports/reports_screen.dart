part of '../../main.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key, required this.model, required this.changed});
  final ScrapprModel model;
  final VoidCallback changed;
  @override
  Widget build(BuildContext context) {
    final profit = model.runValue - model.fuelCost;
    final perMile = model.runMiles == 0 ? 0 : profit / model.runMiles;
    return PageShell(
      title: 'Reports',
      fab: FloatingActionButton.extended(
        onPressed: () => showDialog(
          context: context,
          builder: (_) => ReceiptDialog(model: model, changed: changed),
        ),
        icon: const Icon(Icons.receipt_long),
        label: const Text('Add receipt'),
      ),
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          metricGrid(context, [
            Metric(
              'Total recorded payout',
              '\$${model.totalPayout.toStringAsFixed(2)}',
            ),
            Metric('Receipt count', '${model.receipts.length}'),
            Metric(
              'Active run value',
              '\$${model.runValue.toStringAsFixed(2)}',
            ),
            Metric(
              'Estimated fuel cost',
              '\$${model.fuelCost.toStringAsFixed(2)}',
            ),
            Metric('Profit after fuel', '\$${profit.toStringAsFixed(2)}'),
            Metric('Return per mile', '\$${perMile.toStringAsFixed(2)}'),
            const Metric('Return per hour', 'Pending'),
            const Metric('Best item / yard', 'Pending'),
          ]),
          sectionTitle(context, 'Receipt history'),
          for (final receipt in model.receipts)
            Card(
              child: ListTile(
                leading: IconButton(
                  tooltip:
                      'Receipt photos (${model.photoCount(receipt.id, PhotoOwnerType.receipt)})',
                  onPressed: () => CameraService().attach(
                    context,
                    model: model,
                    changed: changed,
                    ownerId: receipt.id,
                    ownerType: PhotoOwnerType.receipt,
                    label: 'Receipt',
                  ),
                  icon: const Icon(Icons.add_a_photo_outlined),
                ),
                title: Text('\$${receipt.amount.toStringAsFixed(2)}'),
                subtitle: Text(
                  '${model.yards.firstWhere((y) => y.id == receipt.yardId).name}  -  ${receipt.date.toLocal().toString().split(' ').first}\n${receipt.notes}',
                ),
                isThreeLine: true,
              ),
            ),
          sectionTitle(context, 'Run history'),
          Card(
            child: ListTile(
              title: Text(model.run.name),
              subtitle: Text(
                'In-memory placeholder  -  ${model.runItems.length} items  -  \$${model.runValue.toStringAsFixed(2)} estimated',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
