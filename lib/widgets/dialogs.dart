part of '../main.dart';

class ItemDialog extends StatefulWidget {
  const ItemDialog({
    super.key,
    required this.model,
    required this.changed,
    this.item,
  });
  final ScrapprModel model;
  final VoidCallback changed;
  final ScrapItem? item;
  @override
  State<ItemDialog> createState() => _ItemDialogState();
}

class _ItemDialogState extends State<ItemDialog> {
  late final title = TextEditingController(text: widget.item?.title ?? '');
  late final address = TextEditingController(
    text: widget.item?.pickupAddress ?? '',
  );
  late final location = TextEditingController(
    text: widget.item?.locationName ?? '',
  );
  late final miles = TextEditingController(text: '${widget.item?.miles ?? 5}');
  late final window = TextEditingController(
    text: widget.item?.timeWindow ?? 'Contact seller',
  );
  late final notes = TextEditingController(text: widget.item?.notes ?? '');
  late String templateId =
      widget.item?.templateId ?? widget.model.templates.first.id;
  late Destination destination = widget.item?.destination ?? Destination.home;
  late ItemStatus status = widget.item?.status ?? ItemStatus.claimed;
  @override
  Widget build(BuildContext context) => AlertDialog(
    title: Text(widget.item == null ? 'Add Manual Run Item' : 'Edit Run Item'),
    content: SizedBox(
      width: 520,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Fields(
              controllers: [
                (title, 'Title'),
                (address, 'Pickup address'),
                (location, 'Location name'),
                (miles, 'Estimated miles from home'),
                (window, 'Pickup time window'),
                (notes, 'Notes'),
              ],
            ),
            DropdownButtonFormField<String>(
              initialValue: templateId,
              decoration: const InputDecoration(labelText: 'Object type'),
              items: widget.model.templates
                  .map(
                    (t) => DropdownMenuItem(value: t.id, child: Text(t.name)),
                  )
                  .toList(),
              onChanged: (v) => setState(() => templateId = v ?? templateId),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<Destination>(
              initialValue: destination,
              decoration: const InputDecoration(labelText: 'Destination'),
              items: Destination.values
                  .map(
                    (d) => DropdownMenuItem(
                      value: d,
                      child: Text(destinationLabel(d)),
                    ),
                  )
                  .toList(),
              onChanged: (v) => setState(() => destination = v ?? destination),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<ItemStatus>(
              initialValue: status,
              decoration: const InputDecoration(labelText: 'Status'),
              items: ItemStatus.values
                  .where((s) => s != ItemStatus.ignored)
                  .map(
                    (s) =>
                        DropdownMenuItem(value: s, child: Text(statusLabel(s))),
                  )
                  .toList(),
              onChanged: (v) => setState(() => status = v ?? status),
            ),
          ],
        ),
      ),
    ),
    actions: [
      TextButton(
        onPressed: () => Navigator.pop(context),
        child: const Text('Cancel'),
      ),
      FilledButton(
        onPressed: () {
          final item =
              widget.item ??
              ScrapItem(
                id: 'item${DateTime.now().microsecondsSinceEpoch}',
                title: '',
                templateId: templateId,
                pickupAddress: '',
                locationName: '',
                miles: 0,
                timeWindow: '',
                destination: destination,
                status: status,
                notes: '',
                source: 'Manual',
              );
          item.title = title.text.trim().isEmpty
              ? widget.model.template(templateId).name
              : title.text.trim();
          item.templateId = templateId;
          item.pickupAddress = address.text;
          item.locationName = location.text;
          item.miles = double.tryParse(miles.text) ?? 0;
          item.timeWindow = window.text;
          item.destination = destination;
          item.status = status;
          item.notes = notes.text;
          if (widget.item == null) {
            widget.model.items.add(item);
            widget.model.run.itemIds.add(item.id);
          }
          widget.changed();
          Navigator.pop(context);
        },
        child: const Text('Save'),
      ),
    ],
  );
}

class ProcessingItemDialog extends StatefulWidget {
  const ProcessingItemDialog({
    super.key,
    required this.model,
    required this.changed,
  });
  final ScrapprModel model;
  final VoidCallback changed;
  @override
  State<ProcessingItemDialog> createState() => _ProcessingItemDialogState();
}

class _ProcessingItemDialogState extends State<ProcessingItemDialog> {
  final title = TextEditingController();
  late String templateId = widget.model.templates.first.id;
  @override
  Widget build(BuildContext context) => AlertDialog(
    title: const Text('Add processing item'),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          controller: title,
          decoration: const InputDecoration(labelText: 'Title'),
        ),
        const SizedBox(height: 10),
        DropdownButtonFormField<String>(
          initialValue: templateId,
          decoration: const InputDecoration(labelText: 'Object type'),
          items: widget.model.templates
              .map((t) => DropdownMenuItem(value: t.id, child: Text(t.name)))
              .toList(),
          onChanged: (v) => setState(() => templateId = v ?? templateId),
        ),
      ],
    ),
    actions: [
      TextButton(
        onPressed: () => Navigator.pop(context),
        child: const Text('Cancel'),
      ),
      FilledButton(
        onPressed: () {
          widget.model.items.add(
            ScrapItem(
              id: 'proc${DateTime.now().microsecondsSinceEpoch}',
              title: title.text.trim().isEmpty
                  ? widget.model.template(templateId).name
                  : title.text.trim(),
              templateId: templateId,
              pickupAddress: '',
              locationName: 'Home',
              miles: 0,
              timeWindow: '',
              destination: Destination.home,
              status: ItemStatus.atHome,
              notes: '',
              source: 'Manual',
            ),
          );
          widget.changed();
          Navigator.pop(context);
        },
        child: const Text('Add'),
      ),
    ],
  );
}

class VehicleDialog extends StatefulWidget {
  const VehicleDialog({
    super.key,
    required this.model,
    required this.changed,
    this.vehicle,
  });
  final ScrapprModel model;
  final VoidCallback changed;
  final Vehicle? vehicle;
  @override
  State<VehicleDialog> createState() => _VehicleDialogState();
}

class _VehicleDialogState extends State<VehicleDialog> {
  late final name = TextEditingController(text: widget.vehicle?.name ?? '');
  late final type = TextEditingController(
    text: widget.vehicle?.type ?? 'Pickup truck',
  );
  late final mpg = TextEditingController(text: '${widget.vehicle?.mpg ?? 20}');
  late final length = TextEditingController(
    text: '${widget.vehicle?.cargoLength ?? 72}',
  );
  late final width = TextEditingController(
    text: '${widget.vehicle?.cargoWidth ?? 44}',
  );
  late final height = TextEditingController(
    text: '${widget.vehicle?.cargoHeight ?? 30}',
  );
  late final payload = TextEditingController(
    text: '${widget.vehicle?.payloadLimit ?? 1000}',
  );
  late final full = TextEditingController(
    text: '${widget.vehicle?.fullCargo ?? 1}',
  );
  late final large = TextEditingController(
    text: '${widget.vehicle?.largeUpright ?? 2}',
  );
  late final medium = TextEditingController(
    text: '${widget.vehicle?.medium ?? 6}',
  );
  late final notes = TextEditingController(text: widget.vehicle?.notes ?? '');
  @override
  Widget build(BuildContext context) => AlertDialog(
    title: Text(widget.vehicle == null ? 'Add Vehicle' : 'Edit Vehicle'),
    content: SizedBox(
      width: 520,
      child: SingleChildScrollView(
        child: Fields(
          controllers: [
            (name, 'Name'),
            (type, 'Vehicle type'),
            (mpg, 'MPG'),
            (length, 'Cargo length (in)'),
            (width, 'Cargo width (in)'),
            (height, 'Cargo height (in)'),
            (payload, 'Payload limit (lb)'),
            (full, 'Max full-cargo items'),
            (large, 'Max large-upright items'),
            (medium, 'Max medium items'),
            (notes, 'Notes'),
          ],
        ),
      ),
    ),
    actions: [
      TextButton(
        onPressed: () => Navigator.pop(context),
        child: const Text('Cancel'),
      ),
      FilledButton(
        onPressed: () {
          final v =
              widget.vehicle ??
              Vehicle(
                id: 'v${DateTime.now().microsecondsSinceEpoch}',
                name: '',
                type: '',
                mpg: 20,
                cargoLength: 0,
                cargoWidth: 0,
                cargoHeight: 0,
                payloadLimit: 0,
                fullCargo: 0,
                largeUpright: 0,
                medium: 0,
                notes: '',
              );
          v.name = name.text;
          v.type = type.text;
          v.mpg = double.tryParse(mpg.text) ?? 20;
          v.cargoLength = double.tryParse(length.text) ?? 0;
          v.cargoWidth = double.tryParse(width.text) ?? 0;
          v.cargoHeight = double.tryParse(height.text) ?? 0;
          v.payloadLimit = double.tryParse(payload.text) ?? 0;
          v.fullCargo = int.tryParse(full.text) ?? 0;
          v.largeUpright = int.tryParse(large.text) ?? 0;
          v.medium = int.tryParse(medium.text) ?? 0;
          v.notes = notes.text;
          if (widget.vehicle == null) widget.model.vehicles.add(v);
          widget.changed();
          Navigator.pop(context);
        },
        child: const Text('Save'),
      ),
    ],
  );
}

class YardDialog extends StatefulWidget {
  const YardDialog({
    super.key,
    required this.model,
    required this.changed,
    this.yard,
  });
  final ScrapprModel model;
  final VoidCallback changed;
  final Yard? yard;
  @override
  State<YardDialog> createState() => _YardDialogState();
}

class _YardDialogState extends State<YardDialog> {
  late final name = TextEditingController(text: widget.yard?.name ?? '');
  late final address = TextEditingController(text: widget.yard?.address ?? '');
  late final city = TextEditingController(
    text: widget.yard?.cityStateZip ?? '',
  );
  late final phone = TextEditingController(text: widget.yard?.phone ?? '');
  late final hours = TextEditingController(text: widget.yard?.hours ?? '');
  late final notes = TextEditingController(text: widget.yard?.notes ?? '');
  late bool preferred = widget.yard?.preferred ?? false;
  @override
  Widget build(BuildContext context) => AlertDialog(
    title: Text(widget.yard == null ? 'Add Yard' : 'Edit Yard'),
    content: SizedBox(
      width: 520,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Fields(
              controllers: [
                (name, 'Name'),
                (address, 'Address'),
                (city, 'City / State / ZIP'),
                (phone, 'Phone'),
                (hours, 'Hours'),
                (notes, 'Notes'),
              ],
            ),
            SwitchListTile(
              title: const Text('Preferred yard'),
              value: preferred,
              onChanged: (v) => setState(() => preferred = v),
            ),
          ],
        ),
      ),
    ),
    actions: [
      TextButton(
        onPressed: () => Navigator.pop(context),
        child: const Text('Cancel'),
      ),
      FilledButton(
        onPressed: () {
          final y =
              widget.yard ??
              Yard(
                id: 'y${DateTime.now().microsecondsSinceEpoch}',
                name: '',
                address: '',
                cityStateZip: '',
                phone: '',
                hours: '',
                notes: '',
                preferred: false,
              );
          y.name = name.text;
          y.address = address.text;
          y.cityStateZip = city.text;
          y.phone = phone.text;
          y.hours = hours.text;
          y.notes = notes.text;
          y.preferred = preferred;
          if (widget.yard == null) widget.model.yards.add(y);
          widget.changed();
          Navigator.pop(context);
        },
        child: const Text('Save'),
      ),
    ],
  );
}

class YardPriceDialog extends StatefulWidget {
  const YardPriceDialog({
    super.key,
    required this.model,
    required this.changed,
    required this.yardId,
  });
  final ScrapprModel model;
  final VoidCallback changed;
  final String yardId;
  @override
  State<YardPriceDialog> createState() => _YardPriceDialogState();
}

class _YardPriceDialogState extends State<YardPriceDialog> {
  final material = TextEditingController(),
      price = TextEditingController(),
      unit = TextEditingController(text: r'$/lb'),
      notes = TextEditingController();
  @override
  Widget build(BuildContext context) => AlertDialog(
    title: const Text('Add Yard Price'),
    content: Fields(
      controllers: [
        (material, 'Material name'),
        (price, 'Price'),
        (unit, 'Unit'),
        (notes, 'Notes'),
      ],
    ),
    actions: [
      TextButton(
        onPressed: () => Navigator.pop(context),
        child: const Text('Cancel'),
      ),
      FilledButton(
        onPressed: () {
          widget.model.yardPrices.add(
            YardPrice(
              id: 'p${DateTime.now().microsecondsSinceEpoch}',
              yardId: widget.yardId,
              material: material.text,
              price: double.tryParse(price.text) ?? 0,
              unit: unit.text,
              updatedAt: DateTime.now(),
              notes: notes.text,
            ),
          );
          widget.changed();
          Navigator.pop(context);
        },
        child: const Text('Save'),
      ),
    ],
  );
}

class SearchRuleDialog extends StatefulWidget {
  const SearchRuleDialog({
    super.key,
    required this.model,
    required this.changed,
    this.rule,
  });
  final ScrapprModel model;
  final VoidCallback changed;
  final SearchRule? rule;
  @override
  State<SearchRuleDialog> createState() => _SearchRuleDialogState();
}

class _SearchRuleDialogState extends State<SearchRuleDialog> {
  late final name = TextEditingController(text: widget.rule?.name ?? '');
  late final keywords = TextEditingController(
    text: widget.rule?.keywords ?? '',
  );
  late final excluded = TextEditingController(
    text: widget.rule?.excludedWords ?? '',
  );
  late final radius = TextEditingController(
    text: '${widget.rule?.maxRadius ?? 25}',
  );
  late final source = TextEditingController(
    text: widget.rule?.source ?? 'Marketplace placeholder',
  );
  late bool notify = widget.rule?.notify ?? true,
      enabled = widget.rule?.enabled ?? true;
  @override
  Widget build(BuildContext context) => AlertDialog(
    title: Text(widget.rule == null ? 'Add Search Rule' : 'Edit Search Rule'),
    content: SizedBox(
      width: 520,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Fields(
              controllers: [
                (name, 'Rule name'),
                (keywords, 'Keywords'),
                (excluded, 'Excluded words'),
                (radius, 'Max radius (miles)'),
                (source, 'Source'),
              ],
            ),
            SwitchListTile(
              title: const Text('Notify'),
              value: notify,
              onChanged: (v) => setState(() => notify = v),
            ),
            SwitchListTile(
              title: const Text('Enabled'),
              value: enabled,
              onChanged: (v) => setState(() => enabled = v),
            ),
          ],
        ),
      ),
    ),
    actions: [
      TextButton(
        onPressed: () => Navigator.pop(context),
        child: const Text('Cancel'),
      ),
      FilledButton(
        onPressed: () {
          final r =
              widget.rule ??
              SearchRule(
                id: 'sr${DateTime.now().microsecondsSinceEpoch}',
                name: '',
                keywords: '',
                excludedWords: '',
                maxRadius: 0,
                source: '',
                notify: false,
                enabled: false,
              );
          r.name = name.text;
          r.keywords = keywords.text;
          r.excludedWords = excluded.text;
          r.maxRadius = double.tryParse(radius.text) ?? 0;
          r.source = source.text;
          r.notify = notify;
          r.enabled = enabled;
          if (widget.rule == null) widget.model.searchRules.add(r);
          widget.changed();
          Navigator.pop(context);
        },
        child: const Text('Save'),
      ),
    ],
  );
}

class TemplateDialog extends StatefulWidget {
  const TemplateDialog({
    super.key,
    required this.model,
    required this.changed,
    this.template,
  });
  final ScrapprModel model;
  final VoidCallback changed;
  final ObjectTemplate? template;
  @override
  State<TemplateDialog> createState() => _TemplateDialogState();
}

class _TemplateDialogState extends State<TemplateDialog> {
  late final name = TextEditingController(text: widget.template?.name ?? '');
  late final aliases = TextEditingController(
    text: widget.template?.aliases ?? '',
  );
  late final category = TextEditingController(
    text: widget.template?.category ?? 'Custom',
  );
  late final low = TextEditingController(
    text: '${widget.template?.lowValue ?? 0}',
  );
  late final likely = TextEditingController(
    text: '${widget.template?.likelyValue ?? 0}',
  );
  late final high = TextEditingController(
    text: '${widget.template?.highValue ?? 0}',
  );
  late final minutes = TextEditingController(
    text: '${widget.template?.stripMinutes ?? 0}',
  );
  late final difficulty = TextEditingController(
    text: '${widget.template?.stripDifficulty ?? 1}',
  );
  late final safety = TextEditingController(
    text: widget.template?.safetyNotes ?? '',
  );
  late final tools = TextEditingController(
    text: widget.template?.toolsNeeded ?? '',
  );
  late final materials = TextEditingController(
    text: widget.template?.recoverableMaterials ?? '',
  );
  late final partOut = TextEditingController(
    text: widget.template?.partOutNotes ?? '',
  );
  late final notes = TextEditingController(text: widget.template?.notes ?? '');
  late CargoDemand cargo = widget.template?.cargoDemand ?? CargoDemand.medium;
  late Destination destination =
      widget.template?.destination ?? Destination.home;
  @override
  Widget build(BuildContext context) => AlertDialog(
    title: Text(
      widget.template == null ? 'Add Object Template' : 'Edit Object Template',
    ),
    content: SizedBox(
      width: 560,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Fields(
              controllers: [
                (name, 'Name'),
                (aliases, 'Aliases'),
                (category, 'Category'),
              ],
            ),
            DropdownButtonFormField<CargoDemand>(
              initialValue: cargo,
              decoration: const InputDecoration(
                labelText: 'Cargo demand',
                helperText:
                    'Full cargo uses the main cargo area of the selected vehicle.',
              ),
              items: CargoDemand.values
                  .map(
                    (c) =>
                        DropdownMenuItem(value: c, child: Text(cargoLabel(c))),
                  )
                  .toList(),
              onChanged: (v) => setState(() => cargo = v ?? cargo),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<Destination>(
              initialValue: destination,
              decoration: const InputDecoration(
                labelText: 'Default destination',
              ),
              items: Destination.values
                  .map(
                    (d) => DropdownMenuItem(
                      value: d,
                      child: Text(destinationLabel(d)),
                    ),
                  )
                  .toList(),
              onChanged: (v) => setState(() => destination = v ?? destination),
            ),
            const SizedBox(height: 10),
            Fields(
              controllers: [
                (low, 'Low value'),
                (likely, 'Likely value'),
                (high, 'High value'),
                (minutes, 'Estimated strip time (minutes)'),
                (difficulty, 'Strip difficulty (1-5)'),
                (safety, 'Safety notes'),
                (tools, 'Tools needed'),
                (materials, 'Recoverable materials'),
                (partOut, 'Part-out notes'),
                (notes, 'Notes'),
              ],
            ),
            OutlinedButton.icon(
              onPressed: () => const CameraService().pending(
                context,
                'Object library reference',
              ),
              icon: const Icon(Icons.add_a_photo_outlined),
              label: const Text('Add reference photo'),
            ),
          ],
        ),
      ),
    ),
    actions: [
      TextButton(
        onPressed: () => Navigator.pop(context),
        child: const Text('Cancel'),
      ),
      FilledButton(
        onPressed: () {
          final t =
              widget.template ??
              ObjectTemplate(
                id: 'obj${DateTime.now().microsecondsSinceEpoch}',
                name: '',
                aliases: '',
                category: '',
                cargoDemand: cargo,
                destination: destination,
                lowValue: 0,
                likelyValue: 0,
                highValue: 0,
                stripMinutes: 0,
                stripDifficulty: 1,
                safetyNotes: '',
                toolsNeeded: '',
                recoverableMaterials: '',
                partOutNotes: '',
                notes: '',
              );
          t.name = name.text;
          t.aliases = aliases.text;
          t.category = category.text;
          t.cargoDemand = cargo;
          t.destination = destination;
          t.lowValue = double.tryParse(low.text) ?? 0;
          t.likelyValue = double.tryParse(likely.text) ?? 0;
          t.highValue = double.tryParse(high.text) ?? 0;
          t.stripMinutes = int.tryParse(minutes.text) ?? 0;
          t.stripDifficulty = int.tryParse(difficulty.text) ?? 1;
          t.safetyNotes = safety.text;
          t.toolsNeeded = tools.text;
          t.recoverableMaterials = materials.text;
          t.partOutNotes = partOut.text;
          t.notes = notes.text;
          if (widget.template == null) widget.model.templates.add(t);
          widget.changed();
          Navigator.pop(context);
        },
        child: const Text('Save'),
      ),
    ],
  );
}

class ReceiptDialog extends StatefulWidget {
  const ReceiptDialog({super.key, required this.model, required this.changed});
  final ScrapprModel model;
  final VoidCallback changed;
  @override
  State<ReceiptDialog> createState() => _ReceiptDialogState();
}

class _ReceiptDialogState extends State<ReceiptDialog> {
  final amount = TextEditingController(), notes = TextEditingController();
  late String yardId = widget.model.yards.first.id;
  @override
  Widget build(BuildContext context) => AlertDialog(
    title: const Text('Add Receipt'),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        DropdownButtonFormField<String>(
          initialValue: yardId,
          decoration: const InputDecoration(labelText: 'Yard'),
          items: widget.model.yards
              .map((y) => DropdownMenuItem(value: y.id, child: Text(y.name)))
              .toList(),
          onChanged: (v) => setState(() => yardId = v ?? yardId),
        ),
        const SizedBox(height: 10),
        Fields(controllers: [(amount, 'Total payout'), (notes, 'Notes')]),
        OutlinedButton.icon(
          onPressed: () => const CameraService().pending(context, 'Receipt'),
          icon: const Icon(Icons.add_a_photo_outlined),
          label: const Text('Add receipt photo'),
        ),
      ],
    ),
    actions: [
      TextButton(
        onPressed: () => Navigator.pop(context),
        child: const Text('Cancel'),
      ),
      FilledButton(
        onPressed: () {
          widget.model.receipts.add(
            Receipt(
              id: 'r${DateTime.now().microsecondsSinceEpoch}',
              yardId: yardId,
              amount: double.tryParse(amount.text) ?? 0,
              date: DateTime.now(),
              notes: notes.text,
            ),
          );
          widget.changed();
          Navigator.pop(context);
        },
        child: const Text('Save'),
      ),
    ],
  );
}
