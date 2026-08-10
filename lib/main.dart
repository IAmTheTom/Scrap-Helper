import 'package:flutter/material.dart';

void main() => runApp(const ScrapprApp());

enum Destination { home, yard, either }

enum CargoDemand { tiny, small, medium, largeUpright, fullCargo }

enum ItemStatus {
  lead,
  claimed,
  pickedUp,
  atHome,
  needsStripping,
  processing,
  readyForYard,
  complete,
  ignored,
}

String destinationLabel(Destination value) => switch (value) {
  Destination.home => 'Home',
  Destination.yard => 'Yard',
  Destination.either => 'Either',
};
String cargoLabel(CargoDemand value) => switch (value) {
  CargoDemand.tiny => 'Tiny',
  CargoDemand.small => 'Small',
  CargoDemand.medium => 'Medium',
  CargoDemand.largeUpright => 'Large upright',
  CargoDemand.fullCargo => 'Full cargo',
};
String statusLabel(ItemStatus value) => switch (value) {
  ItemStatus.lead => 'New lead',
  ItemStatus.claimed => 'On run',
  ItemStatus.pickedUp => 'Picked up',
  ItemStatus.atHome => 'At home',
  ItemStatus.needsStripping => 'Needs stripping',
  ItemStatus.processing => 'Processing',
  ItemStatus.readyForYard => 'Ready for yard',
  ItemStatus.complete => 'Sold / Complete',
  ItemStatus.ignored => 'Ignored',
};

class PhotoAttachment {
  PhotoAttachment({
    required this.id,
    required this.ownerId,
    required this.kind,
    required this.createdAt,
  });
  final String id, ownerId, kind;
  final DateTime createdAt;
}

class CameraService {
  const CameraService();
  void pending(BuildContext context, String kind) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('$kind photo: camera integration pending.')),
      );
}

class Vehicle {
  Vehicle({
    required this.id,
    required this.name,
    required this.type,
    required this.mpg,
    required this.cargoLength,
    required this.cargoWidth,
    required this.cargoHeight,
    required this.payloadLimit,
    required this.fullCargo,
    required this.largeUpright,
    required this.medium,
    required this.notes,
  });
  final String id;
  String name, type, notes;
  double mpg, cargoLength, cargoWidth, cargoHeight, payloadLimit;
  int fullCargo, largeUpright, medium;
}

class Yard {
  Yard({
    required this.id,
    required this.name,
    required this.address,
    required this.cityStateZip,
    required this.phone,
    required this.hours,
    required this.notes,
    required this.preferred,
  });
  final String id;
  String name, address, cityStateZip, phone, hours, notes;
  bool preferred;
}

class YardPrice {
  YardPrice({
    required this.id,
    required this.yardId,
    required this.material,
    required this.price,
    required this.unit,
    required this.updatedAt,
    required this.notes,
  });
  final String id;
  String yardId, material, unit, notes;
  double price;
  DateTime updatedAt;
}

class SearchRule {
  SearchRule({
    required this.id,
    required this.name,
    required this.keywords,
    required this.excludedWords,
    required this.maxRadius,
    required this.source,
    required this.notify,
    required this.enabled,
  });
  final String id;
  String name, keywords, excludedWords, source;
  double maxRadius;
  bool notify, enabled;
}

class ObjectTemplate {
  ObjectTemplate({
    required this.id,
    required this.name,
    required this.aliases,
    required this.category,
    required this.cargoDemand,
    required this.destination,
    required this.lowValue,
    required this.likelyValue,
    required this.highValue,
    required this.stripMinutes,
    required this.stripDifficulty,
    required this.safetyNotes,
    required this.toolsNeeded,
    required this.recoverableMaterials,
    required this.partOutNotes,
    required this.notes,
  });
  final String id;
  String name,
      aliases,
      category,
      safetyNotes,
      toolsNeeded,
      recoverableMaterials,
      partOutNotes,
      notes;
  CargoDemand cargoDemand;
  Destination destination;
  double lowValue, likelyValue, highValue;
  int stripMinutes, stripDifficulty;
}

class ScrapItem {
  ScrapItem({
    required this.id,
    required this.title,
    required this.templateId,
    required this.pickupAddress,
    required this.locationName,
    required this.miles,
    required this.timeWindow,
    required this.destination,
    required this.status,
    required this.notes,
    required this.source,
    this.duplicateWarning = false,
  });
  final String id;
  String title,
      templateId,
      pickupAddress,
      locationName,
      timeWindow,
      notes,
      source;
  double miles;
  Destination destination;
  ItemStatus status;
  bool duplicateWarning;
}

class RunPlan {
  RunPlan({
    required this.id,
    required this.name,
    required this.vehicleId,
    required this.itemIds,
  });
  final String id;
  String name, vehicleId;
  final List<String> itemIds;
}

class Receipt {
  Receipt({
    required this.id,
    required this.yardId,
    required this.amount,
    required this.date,
    required this.notes,
  });
  final String id;
  String yardId, notes;
  double amount;
  DateTime date;
}

class ScrapprModel {
  ScrapprModel.seeded() {
    vehicles.addAll([
      Vehicle(
        id: 'compass',
        name: '2018 Jeep Compass',
        type: 'Compact SUV',
        mpg: 24,
        cargoLength: 68,
        cargoWidth: 41,
        cargoHeight: 29,
        payloadLimit: 925,
        fullCargo: 1,
        largeUpright: 2,
        medium: 6,
        notes: 'Best for dishwasher-sized and smaller loads.',
      ),
      Vehicle(
        id: 'ranger',
        name: 'Ford Ranger',
        type: 'Pickup truck',
        mpg: 19,
        cargoLength: 72,
        cargoWidth: 44,
        cargoHeight: 20,
        payloadLimit: 1600,
        fullCargo: 2,
        largeUpright: 4,
        medium: 10,
        notes: 'Temporary truck profile.',
      ),
    ]);
    yards.add(
      Yard(
        id: 'eh',
        name: 'EH Recycling',
        address: '8401 NE 117th Ave',
        cityStateZip: 'Vancouver, WA 98662',
        phone: '(360) 555-0142',
        hours: 'Monâ€“Fri 8â€“4:30',
        notes: 'Primary yard; call before hauling appliances.',
        preferred: true,
      ),
    );
    yardPrices.addAll([
      YardPrice(
        id: 'p1',
        yardId: 'eh',
        material: 'Shred steel',
        price: 0.08,
        unit: r'$/lb',
        updatedAt: DateTime.now().subtract(const Duration(days: 3)),
        notes: 'Sample price; verify before trip.',
      ),
      YardPrice(
        id: 'p2',
        yardId: 'eh',
        material: 'Bare bright copper',
        price: 3.25,
        unit: r'$/lb',
        updatedAt: DateTime.now().subtract(const Duration(days: 3)),
        notes: 'Sample in-memory price.',
      ),
    ]);
    templates.addAll([
      ObjectTemplate(
        id: 'dishwasher',
        name: 'Dishwasher',
        aliases: 'dish washer, built-in dishwasher',
        category: 'Appliance',
        cargoDemand: CargoDemand.fullCargo,
        destination: Destination.home,
        lowValue: 8,
        likelyValue: 15,
        highValue: 22,
        stripMinutes: 25,
        stripDifficulty: 2,
        safetyNotes: 'Drain water; watch sharp sheet metal.',
        toolsNeeded: 'Gloves, drill, cutters',
        recoverableMaterials: 'Motor, wire, board, steel shell',
        partOutNotes: 'Check racks and control board.',
        notes: 'Bring home when processing capacity is available.',
      ),
      ObjectTemplate(
        id: 'cabinet',
        name: 'File Cabinet',
        aliases: 'filing cabinet',
        category: 'Steel',
        cargoDemand: CargoDemand.largeUpright,
        destination: Destination.yard,
        lowValue: 3,
        likelyValue: 6,
        highValue: 9,
        stripMinutes: 0,
        stripDifficulty: 1,
        safetyNotes: 'Secure drawers and load.',
        toolsNeeded: 'Straps, gloves',
        recoverableMaterials: 'Shred steel',
        partOutNotes: 'Check vintage resale value.',
        notes: 'Usually straight to yard.',
      ),
      ObjectTemplate(
        id: 'alternator',
        name: 'Alternator',
        aliases: 'generator',
        category: 'Auto',
        cargoDemand: CargoDemand.tiny,
        destination: Destination.home,
        lowValue: 3,
        likelyValue: 7,
        highValue: 12,
        stripMinutes: 20,
        stripDifficulty: 3,
        safetyNotes: 'Wear eye protection when opening.',
        toolsNeeded: 'Sockets, impact, eye protection',
        recoverableMaterials: 'Copper, aluminum, steel',
        partOutNotes: 'Test saleable units first.',
        notes: 'High value density.',
      ),
      ObjectTemplate(
        id: 'microwave',
        name: 'Microwave',
        aliases: 'microwave oven',
        category: 'Small appliance',
        cargoDemand: CargoDemand.medium,
        destination: Destination.home,
        lowValue: 6,
        likelyValue: 12,
        highValue: 20,
        stripMinutes: 20,
        stripDifficulty: 4,
        safetyNotes:
            'Capacitor can retain lethal charge. Do not open without training.',
        toolsNeeded: 'Safety driver set, gloves',
        recoverableMaterials: 'Transformer, cord, motor, steel',
        partOutNotes: 'Inspect tray and control board.',
        notes: 'Safety-first processing item.',
      ),
    ]);
    items.addAll([
      ScrapItem(
        id: 'l1',
        title: 'Free dishwasher',
        templateId: 'dishwasher',
        pickupAddress: '1200 Main St',
        locationName: 'Battle Ground',
        miles: 15,
        timeWindow: 'Today 4â€“6 PM',
        destination: Destination.home,
        status: ItemStatus.lead,
        notes: 'Seller can help load.',
        source: 'Marketplace placeholder',
      ),
      ScrapItem(
        id: 'l2',
        title: 'Heavy file cabinet',
        templateId: 'cabinet',
        pickupAddress: '400 NE 78th St',
        locationName: 'Vancouver',
        miles: 6,
        timeWindow: 'After 5 PM',
        destination: Destination.yard,
        status: ItemStatus.lead,
        notes: 'Second-floor pickup.',
        source: 'Saved search placeholder',
        duplicateWarning: true,
      ),
      ScrapItem(
        id: 'l3',
        title: 'Alternator',
        templateId: 'alternator',
        pickupAddress: 'Mill Plain Blvd',
        locationName: 'Vancouver',
        miles: 3,
        timeWindow: 'Anytime',
        destination: Destination.home,
        status: ItemStatus.claimed,
        notes: 'Porch pickup.',
        source: 'Manual',
      ),
      ScrapItem(
        id: 'l4',
        title: 'Microwave in garage',
        templateId: 'microwave',
        pickupAddress: 'Orchards area',
        locationName: 'Orchards',
        miles: 5,
        timeWindow: 'Picked up',
        destination: Destination.home,
        status: ItemStatus.needsStripping,
        notes: 'Keep closed until safe processing.',
        source: 'Manual',
      ),
    ]);
    run = RunPlan(
      id: 'today',
      name: "Today's Run",
      vehicleId: 'compass',
      itemIds: ['l3'],
    );
    receipts.add(
      Receipt(
        id: 'r1',
        yardId: 'eh',
        amount: 42,
        date: DateTime.now().subtract(const Duration(days: 2)),
        notes: 'Mixed steel and wire.',
      ),
    );
    searchRules.add(
      SearchRule(
        id: 'sr1',
        name: 'Free appliances',
        keywords: 'free dishwasher, washer, dryer',
        excludedWords: 'wanted, repair service',
        maxRadius: 25,
        source: 'Marketplace placeholder',
        notify: true,
        enabled: true,
      ),
    );
  }

  final vehicles = <Vehicle>[], yards = <Yard>[];
  final yardPrices = <YardPrice>[];
  final templates = <ObjectTemplate>[];
  final items = <ScrapItem>[];
  final receipts = <Receipt>[];
  final searchRules = <SearchRule>[];
  final photos = <PhotoAttachment>[];
  late RunPlan run;
  DateTime? lastRefresh;
  Vehicle get vehicle => vehicles.firstWhere((v) => v.id == run.vehicleId);
  ObjectTemplate template(String id) => templates.firstWhere((t) => t.id == id);
  List<ScrapItem> get runItems =>
      run.itemIds.map((id) => items.firstWhere((i) => i.id == id)).toList();
  List<ScrapItem> get leads =>
      items.where((i) => i.status == ItemStatus.lead).toList();
  List<ScrapItem> get processingItems => items
      .where(
        (i) => const [
          ItemStatus.atHome,
          ItemStatus.needsStripping,
          ItemStatus.processing,
          ItemStatus.readyForYard,
          ItemStatus.complete,
        ].contains(i.status),
      )
      .toList();
  double get runValue => runItems.fold(
    0.0,
    (sum, item) => sum + template(item.templateId).likelyValue,
  );
  double get runMiles =>
      runItems.fold(0.0, (sum, item) => sum + item.miles * 2);
  double get fuelCost => runMiles / vehicle.mpg * 4.25;
  int get runMinutes =>
      runItems.fold(
        0,
        (sum, item) => sum + template(item.templateId).stripMinutes,
      ) +
      (runMiles * 2).round();
  bool get fitsVehicle {
    int full = 0, large = 0, medium = 0;
    for (final item in runItems) {
      switch (template(item.templateId).cargoDemand) {
        case CargoDemand.fullCargo:
          full++;
        case CargoDemand.largeUpright:
          large++;
        case CargoDemand.medium:
          medium++;
        default:
          break;
      }
    }
    return full <= vehicle.fullCargo &&
        large <= vehicle.largeUpright &&
        medium <= vehicle.medium;
  }

  int get homeCount =>
      runItems.where((i) => i.destination == Destination.home).length;
  int get yardCount =>
      runItems.where((i) => i.destination == Destination.yard).length;
  double get totalPayout =>
      receipts.fold(0.0, (sum, receipt) => sum + receipt.amount);
  void refreshSearch() {
    final id = DateTime.now().microsecondsSinceEpoch.toString();
    items.add(
      ScrapItem(
        id: id,
        title: 'Mock refresh result: steel shelving',
        templateId: 'cabinet',
        pickupAddress: 'Address hidden by source',
        locationName: 'Vancouver',
        miles: 4,
        timeWindow: 'Contact seller',
        destination: Destination.yard,
        status: ItemStatus.lead,
        notes: 'Generated locally from enabled search rules.',
        source: 'Search placeholder',
      ),
    );
    lastRefresh = DateTime.now();
  }
}

class ScrapprApp extends StatefulWidget {
  const ScrapprApp({super.key});
  @override
  State<ScrapprApp> createState() => _ScrapprAppState();
}

class _ScrapprAppState extends State<ScrapprApp> {
  final model = ScrapprModel.seeded();
  int tab = 0;
  void changed() => setState(() {});
  void goTo(int index) => setState(() => tab = index);
  @override
  Widget build(BuildContext context) {
    final screens = [
      TodayScreen(model: model, changed: changed, goTo: goTo),
      InboxScreen(model: model, changed: changed),
      RunsScreen(model: model, changed: changed),
      ProcessingScreen(model: model, changed: changed),
      LibraryScreen(model: model, changed: changed),
      ReportsScreen(model: model, changed: changed),
      SettingsScreen(model: model, changed: changed),
    ];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Scrappr',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff356b3b)),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: const Color(0xff72b878),
      ),
      home: Scaffold(
        body: screens[tab],
        bottomNavigationBar: NavigationBar(
          selectedIndex: tab,
          onDestinationSelected: goTo,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.today_outlined),
              label: 'Today',
            ),
            NavigationDestination(
              icon: Icon(Icons.inbox_outlined),
              label: 'Inbox',
            ),
            NavigationDestination(
              icon: Icon(Icons.route_outlined),
              label: 'Runs',
            ),
            NavigationDestination(
              icon: Icon(Icons.construction_outlined),
              label: 'Processing',
            ),
            NavigationDestination(
              icon: Icon(Icons.inventory_2_outlined),
              label: 'Library',
            ),
            NavigationDestination(
              icon: Icon(Icons.bar_chart_outlined),
              label: 'Reports',
            ),
            NavigationDestination(
              icon: Icon(Icons.settings_outlined),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}

class PageShell extends StatelessWidget {
  const PageShell({
    super.key,
    required this.title,
    required this.child,
    this.actions,
    this.fab,
  });
  final String title;
  final Widget child;
  final List<Widget>? actions;
  final Widget? fab;
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text(title), actions: actions),
    floatingActionButton: fab,
    body: SafeArea(child: child),
  );
}

void pending(BuildContext context, String message) => ScaffoldMessenger.of(
  context,
).showSnackBar(SnackBar(content: Text(message)));
Widget sectionTitle(BuildContext context, String text, {Widget? action}) =>
    Padding(
      padding: const EdgeInsets.only(top: 18, bottom: 8),
      child: Row(
        children: [
          Expanded(
            child: Text(text, style: Theme.of(context).textTheme.titleLarge),
          ),
          if (action != null) action,
        ],
      ),
    );
Widget metricGrid(BuildContext context, List<Widget> children) =>
    GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: MediaQuery.sizeOf(context).width > 900 ? 4 : 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      childAspectRatio: 1.6,
      children: children,
    );

class Metric extends StatelessWidget {
  const Metric(this.label, this.value, {super.key, this.detail});
  final String label, value;
  final String? detail;
  @override
  Widget build(BuildContext context) => Card(
    child: Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(label, style: Theme.of(context).textTheme.labelLarge),
          const SizedBox(height: 4),
          Text(value, style: Theme.of(context).textTheme.headlineSmall),
          if (detail != null)
            Flexible(child: Text(detail!, overflow: TextOverflow.ellipsis)),
        ],
      ),
    ),
  );
}

void openAssistant(BuildContext context, ScrapprModel model) => Navigator.push(
  context,
  MaterialPageRoute(builder: (_) => AssistantScreen(model: model)),
);

class AssistantScreen extends StatefulWidget {
  const AssistantScreen({super.key, required this.model});
  final ScrapprModel model;
  @override
  State<AssistantScreen> createState() => _AssistantScreenState();
}

class _AssistantScreenState extends State<AssistantScreen> {
  final input = TextEditingController();
  final messages = <String>[
    'Scrappr Assistant is ready. I use local rule-engine data only; no AI model is connected yet.',
  ];
  String contextChip = 'Current Run';
  void send([String? prompt]) {
    final text = prompt ?? input.text.trim();
    if (text.isEmpty) return;
    setState(() {
      messages.add('You: $text');
      messages.add(
        'Assistant: Based on $contextChip rule-engine data, the current run is worth about \$${widget.model.runValue.toStringAsFixed(0)} and ${widget.model.fitsVehicle ? 'fits the selected vehicle' : 'should be split for vehicle fit'}. No connected model was used.',
      );
      input.clear();
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Scrappr Assistant')),
    body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Wrap(
            spacing: 8,
            children:
                [
                      'Current Run',
                      'Selected Item',
                      'Object Library',
                      'Yard Prices',
                    ]
                    .map(
                      (label) => ChoiceChip(
                        label: Text(label),
                        selected: contextChip == label,
                        onSelected: (_) => setState(() => contextChip = label),
                      ),
                    )
                    .toList(),
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: messages.length,
            itemBuilder: (_, i) => Card(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(messages[i]),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: input,
                  onSubmitted: send,
                  decoration: const InputDecoration(
                    labelText: 'Ask about this work',
                  ),
                ),
              ),
              const SizedBox(width: 8),
              IconButton.filled(onPressed: send, icon: const Icon(Icons.send)),
            ],
          ),
        ),
      ],
    ),
  );
}

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
                  '${model.runItems.length} pickups • ${model.runMiles.toStringAsFixed(0)} mi',
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
                '${model.vehicle.name} • \${model.fuelCost.toStringAsFixed(2)} fuel • ${model.runMinutes} min',
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

class InboxScreen extends StatelessWidget {
  const InboxScreen({super.key, required this.model, required this.changed});
  final ScrapprModel model;
  final VoidCallback changed;
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
                        tooltip: 'Inbox result photo',
                        onPressed: () => const CameraService().pending(
                          context,
                          'Inbox result',
                        ),
                        icon: const Icon(Icons.add_a_photo_outlined),
                      ),
                    ],
                  ),
                  Text(
                    '${item.source} â€¢ ${item.locationName} â€¢ ${item.miles.toStringAsFixed(1)} mi',
                  ),
                  Text('${item.pickupAddress} â€¢ ${item.timeWindow}'),
                  if (item.duplicateWarning)
                    const Padding(
                      padding: EdgeInsets.only(top: 6),
                      child: Row(
                        children: [
                          Icon(Icons.copy_all, size: 18),
                          SizedBox(width: 6),
                          Text('Possible duplicate â€” comparison pending'),
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
                          if (!model.run.itemIds.contains(item.id))
                            model.run.itemIds.add(item.id);
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
              onPressed: () => pending(context, 'Maps integration pending.'),
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
                tooltip: 'Pickup photo',
                onPressed: () =>
                    const CameraService().pending(context, 'Run item pickup'),
                icon: const Icon(Icons.add_a_photo_outlined),
              ),
              title: Text(item.title),
              subtitle: Text(
                '${item.pickupAddress} â€¢ ${item.timeWindow}\n${destinationLabel(item.destination)} â€¢ ${statusLabel(item.status)}',
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
                            onPressed: () => const CameraService().pending(
                              context,
                              'Processing',
                            ),
                            icon: const Icon(Icons.add_a_photo_outlined),
                            label: const Text('Add photo'),
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
                '${template.category} â€¢ Cargo demand: ${cargoLabel(template.cargoDemand)} â€¢ \$${template.lowValue.toStringAsFixed(0)}â€“\$${template.highValue.toStringAsFixed(0)}',
              ),
              children: [
                ListTile(
                  title: const Text('Aliases'),
                  subtitle: Text(template.aliases),
                ),
                ListTile(
                  title: const Text('Destination & strip work'),
                  subtitle: Text(
                    '${destinationLabel(template.destination)} â€¢ ${template.stripMinutes} min â€¢ difficulty ${template.stripDifficulty}/5',
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
                ButtonBar(
                  children: [
                    TextButton.icon(
                      onPressed: () => const CameraService().pending(
                        context,
                        'Object library reference',
                      ),
                      icon: const Icon(Icons.add_a_photo_outlined),
                      label: const Text('Reference photo'),
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
                      onPressed: () {
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
                  onPressed: () =>
                      const CameraService().pending(context, 'Receipt'),
                  icon: const Icon(Icons.add_a_photo_outlined),
                ),
                title: Text('\$${receipt.amount.toStringAsFixed(2)}'),
                subtitle: Text(
                  '${model.yards.firstWhere((y) => y.id == receipt.yardId).name} â€¢ ${receipt.date.toLocal().toString().split(' ').first}\n${receipt.notes}',
                ),
                isThreeLine: true,
              ),
            ),
          sectionTitle(context, 'Run history'),
          Card(
            child: ListTile(
              title: Text(model.run.name),
              subtitle: Text(
                'In-memory placeholder â€¢ ${model.runItems.length} items â€¢ \$${model.runValue.toStringAsFixed(2)} estimated',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

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
                '${vehicle.type} â€¢ ${vehicle.mpg} MPG â€¢ ${vehicle.cargoLength}Ã—${vehicle.cargoWidth}Ã—${vehicle.cargoHeight} in â€¢ ${vehicle.payloadLimit} lb\nLimits: ${vehicle.fullCargo} full cargo, ${vehicle.largeUpright} upright, ${vehicle.medium} medium â€¢ ${vehicle.notes}',
              ),
              isThreeLine: true,
              trailing: IconButton(
                onPressed: model.vehicles.length == 1
                    ? null
                    : () {
                        model.vehicles.remove(vehicle);
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
              title: Text('${yard.preferred ? 'â˜… ' : ''}${yard.name}'),
              subtitle: Text(
                '${yard.address}, ${yard.cityStateZip}\n${yard.phone} â€¢ ${yard.hours}',
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
                          '\$${price.price.toStringAsFixed(2)} ${price.unit} â€¢ updated ${price.updatedAt.toLocal().toString().split(' ').first}\n${price.notes}',
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
                ButtonBar(
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
                      onPressed: () {
                        model.yards.remove(yard);
                        model.yardPrices.removeWhere(
                          (p) => p.yardId == yard.id,
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
                '${rule.source} â€¢ ${rule.maxRadius} mi â€¢ ${rule.enabled ? 'Enabled' : 'Disabled'} â€¢ notify ${rule.notify ? 'yes' : 'no'}\nKeywords: ${rule.keywords}\nExclude: ${rule.excludedWords}',
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
        const Card(
          child: ListTile(
            leading: Icon(Icons.camera_alt_outlined),
            title: Text('Camera & photos'),
            subtitle: Text(
              'Placeholder service only; no camera plugin is connected.',
            ),
          ),
        ),
        const Card(
          child: ListTile(
            leading: Icon(Icons.auto_awesome),
            title: Text('AI assistant'),
            subtitle: Text(
              'Uses deterministic in-memory rule-engine responses; no model is connected.',
            ),
          ),
        ),
      ],
    ),
  );
}

class Fields extends StatelessWidget {
  const Fields({super.key, required this.controllers});
  final List<(TextEditingController, String)> controllers;
  @override
  Widget build(BuildContext context) => Column(
    children: [
      for (final field in controllers) ...[
        TextField(
          controller: field.$1,
          decoration: InputDecoration(labelText: field.$2),
        ),
        const SizedBox(height: 10),
      ],
    ],
  );
}

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
                (difficulty, 'Strip difficulty (1â€“5)'),
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
