part of '../../main.dart';

class CaptureScreen extends StatefulWidget {
  const CaptureScreen({super.key, required this.model, required this.changed});
  final ScrapprModel model;
  final VoidCallback changed;

  @override
  State<CaptureScreen> createState() => _CaptureScreenState();
}

class _CaptureScreenState extends State<CaptureScreen> {
  final service = PhotoAttachmentService();
  String ownerKey = 'unassigned';

  List<(String, String, String)> get owners =>
      captureOwnerOptions(widget.model);

  Future<void> attach(PhotoAttachmentAction action) async {
    final owner = owners.firstWhere((entry) => entry.$1 == ownerKey);
    final ownerId = owner.$1 == 'unassigned'
        ? 'capture-${DateTime.now().microsecondsSinceEpoch}'
        : owner.$1;
    final (result, attachment) = await service.attach(
      ownerId: ownerId,
      ownerType: owner.$2,
      action: action,
      caption: owner.$3,
    );
    if (!mounted) return;
    final message = switch (result) {
      PhotoAttachmentResult.attached => 'Photo saved.',
      PhotoAttachmentResult.cancelled => 'Photo selection cancelled.',
      PhotoAttachmentResult.unsupported =>
        'Camera capture failed or is unavailable on this device.',
      PhotoAttachmentResult.failed =>
        action == PhotoAttachmentAction.camera
            ? 'Camera capture failed or is unavailable on this device.'
            : 'Photo selection failed or is unavailable on this device.',
    };
    if (attachment != null) {
      widget.model.photos.add(attachment);
      widget.changed();
    }
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) => PageShell(
    title: 'Capture',
    child: ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Card(
          child: ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('Android camera is the product target'),
            subtitle: Text(
              'Other platforms can choose an existing photo; camera availability is reported honestly.',
            ),
          ),
        ),
        DropdownButtonFormField<String>(
          initialValue: ownerKey,
          decoration: const InputDecoration(labelText: 'Attach to'),
          items: owners
              .map(
                (owner) =>
                    DropdownMenuItem(value: owner.$1, child: Text(owner.$3)),
              )
              .toList(),
          onChanged: (value) => setState(() => ownerKey = value ?? ownerKey),
        ),
        const SizedBox(height: 16),
        FilledButton.icon(
          onPressed: () => attach(PhotoAttachmentAction.camera),
          icon: const Icon(Icons.photo_camera_outlined),
          label: const Text('Capture photo'),
        ),
        const SizedBox(height: 8),
        OutlinedButton.icon(
          onPressed: () => attach(PhotoAttachmentAction.gallery),
          icon: const Icon(Icons.photo_library_outlined),
          label: const Text('Choose existing photo'),
        ),
      ],
    ),
  );
}

List<(String, String, String)> captureOwnerOptions(ScrapprModel model) => [
  ('unassigned', PhotoOwnerType.unassignedCapture, 'Unassigned capture'),
  for (final item in model.leads)
    (item.id, PhotoOwnerType.inboxItem, 'Inbox: ${item.title}'),
  for (final item in model.runItems)
    (item.id, PhotoOwnerType.runItem, 'Run: ${item.title}'),
  for (final item in model.processingItems)
    (item.id, PhotoOwnerType.processingItem, 'Processing: ${item.title}'),
  for (final receipt in model.receipts)
    (
      receipt.id,
      PhotoOwnerType.receipt,
      'Receipt: \$${receipt.amount.toStringAsFixed(2)}',
    ),
  for (final template in model.templates)
    (template.id, PhotoOwnerType.objectTemplate, 'Template: ${template.name}'),
];
