part of '../main.dart';

class ScrapprModel {
  ScrapprModel.empty();

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
        hours: 'Mon-Fri 8-4:30',
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
      ObjectTemplate(
        id: 'washer',
        name: 'Washer',
        aliases: 'washing machine, clothes washer',
        category: 'Appliance',
        cargoDemand: CargoDemand.fullCargo,
        destination: Destination.home,
        lowValue: 8,
        likelyValue: 14,
        highValue: 22,
        stripMinutes: 30,
        stripDifficulty: 3,
        safetyNotes: 'Drain water; use safe lifting and secure the drum.',
        toolsNeeded: 'Gloves, drill, sockets, cutters, straps',
        recoverableMaterials: 'Motor, wire, stainless steel, shred steel',
        partOutNotes: 'Sample only; test reusable controls and motor first.',
        notes: 'Conservative local placeholder estimate; verify yard rules.',
      ),
      ObjectTemplate(
        id: 'dryer',
        name: 'Dryer',
        aliases: 'clothes dryer, tumble dryer',
        category: 'Appliance',
        cargoDemand: CargoDemand.fullCargo,
        destination: Destination.home,
        lowValue: 6,
        likelyValue: 12,
        highValue: 20,
        stripMinutes: 25,
        stripDifficulty: 2,
        safetyNotes: 'Disconnect power or gas; check for sharp sheet metal.',
        toolsNeeded: 'Gloves, drill, sockets, cutters',
        recoverableMaterials: 'Motor, wire, steel shell, control board',
        partOutNotes: 'Sample only; inspect timer, motor, and heating parts.',
        notes: 'Conservative local placeholder estimate; verify condition.',
      ),
      ObjectTemplate(
        id: 'stove-oven',
        name: 'Stove/Oven',
        aliases: 'range, kitchen stove, electric oven, gas range',
        category: 'Appliance',
        cargoDemand: CargoDemand.fullCargo,
        destination: Destination.yard,
        lowValue: 7,
        likelyValue: 13,
        highValue: 22,
        stripMinutes: 20,
        stripDifficulty: 3,
        safetyNotes: 'Confirm gas is disconnected; secure door and racks.',
        toolsNeeded: 'Gloves, straps, sockets, drill',
        recoverableMaterials: 'Steel, cast iron, wire, control board',
        partOutNotes: 'Sample only; inspect knobs, racks, and controls.',
        notes: 'Conservative local placeholder estimate; ask yard first.',
      ),
      ObjectTemplate(
        id: 'bbq-grill',
        name: 'BBQ grill',
        aliases: 'barbecue, gas grill, charcoal grill',
        category: 'Outdoor equipment',
        cargoDemand: CargoDemand.largeUpright,
        destination: Destination.yard,
        lowValue: 2,
        likelyValue: 6,
        highValue: 14,
        stripMinutes: 15,
        stripDifficulty: 2,
        safetyNotes: 'Never haul fuel cylinders; remove ash and grease.',
        toolsNeeded: 'Gloves, straps, sockets, magnet',
        recoverableMaterials: 'Steel, stainless steel, cast aluminum, brass',
        partOutNotes: 'Sample only; inspect grates and usable burners.',
        notes: 'Conservative local placeholder; material mix varies widely.',
      ),
      ObjectTemplate(
        id: 'metal-shelving',
        name: 'Metal shelving',
        aliases: 'steel shelves, storage rack, garage shelving',
        category: 'Steel',
        cargoDemand: CargoDemand.largeUpright,
        destination: Destination.yard,
        lowValue: 2,
        likelyValue: 5,
        highValue: 10,
        stripMinutes: 5,
        stripDifficulty: 1,
        safetyNotes: 'Secure loose shelves; watch sharp edges and instability.',
        toolsNeeded: 'Gloves, straps, basic sockets',
        recoverableMaterials: 'Shred steel, prepared steel',
        partOutNotes: 'Sample only; complete shelving may have resale value.',
        notes: 'Conservative local placeholder based on unknown weight.',
      ),
      ObjectTemplate(
        id: 'bicycle',
        name: 'Bicycle',
        aliases: 'bike, mountain bike, road bike',
        category: 'Sporting goods',
        cargoDemand: CargoDemand.medium,
        destination: Destination.home,
        lowValue: 2,
        likelyValue: 8,
        highValue: 20,
        stripMinutes: 20,
        stripDifficulty: 2,
        safetyNotes: 'Confirm ownership; avoid damaged batteries on e-bikes.',
        toolsNeeded: 'Hex keys, wrenches, cutters, gloves',
        recoverableMaterials: 'Steel, aluminum, stainless steel',
        partOutNotes: 'Sample only; evaluate complete-bike and parts resale.',
        notes: 'Conservative local placeholder; excludes e-bike batteries.',
      ),
      ObjectTemplate(
        id: 'starter',
        name: 'Starter',
        aliases: 'starter motor, automotive starter',
        category: 'Auto',
        cargoDemand: CargoDemand.tiny,
        destination: Destination.home,
        lowValue: 2,
        likelyValue: 6,
        highValue: 11,
        stripMinutes: 20,
        stripDifficulty: 3,
        safetyNotes: 'Wear eye protection; clamp the unit before opening.',
        toolsNeeded: 'Sockets, impact, vise, eye protection',
        recoverableMaterials: 'Copper, steel, cast aluminum',
        partOutNotes: 'Sample only; check core or reusable value first.',
        notes: 'Conservative local placeholder estimate.',
      ),
      ObjectTemplate(
        id: 'wire-bundle',
        name: 'Wire bundle',
        aliases: 'insulated wire, cable bundle, extension cords',
        category: 'Wire',
        cargoDemand: CargoDemand.small,
        destination: Destination.yard,
        lowValue: 2,
        likelyValue: 8,
        highValue: 18,
        stripMinutes: 10,
        stripDifficulty: 2,
        safetyNotes: 'Verify de-energized; avoid unknown utility cable.',
        toolsNeeded: 'Gloves, cutters, scale',
        recoverableMaterials: 'Insulated copper wire, power cords',
        partOutNotes: 'Sample only; sort by yard category before stripping.',
        notes: 'Conservative local placeholder; value depends on weight.',
      ),
      ObjectTemplate(
        id: 'printer',
        name: 'Printer',
        aliases: 'laser printer, inkjet printer, office printer',
        category: 'Electronics',
        cargoDemand: CargoDemand.medium,
        destination: Destination.home,
        lowValue: 0,
        likelyValue: 3,
        highValue: 8,
        stripMinutes: 25,
        stripDifficulty: 3,
        safetyNotes:
            'Avoid toner dust and broken glass; lift large units safely.',
        toolsNeeded: 'Gloves, safety glasses, driver set, cutters',
        recoverableMaterials: 'Motors, wire, boards, steel, power cord',
        partOutNotes:
            'Sample only; reusable toner and parts may be worth more.',
        notes: 'Conservative local placeholder; many yards restrict printers.',
      ),
      ObjectTemplate(
        id: 'stereo-audio',
        name: 'Stereo/audio gear',
        aliases: 'receiver, amplifier, stereo, home theater receiver',
        category: 'Electronics',
        cargoDemand: CargoDemand.medium,
        destination: Destination.home,
        lowValue: 2,
        likelyValue: 10,
        highValue: 25,
        stripMinutes: 20,
        stripDifficulty: 3,
        safetyNotes: 'Unplug and allow capacitors to discharge before opening.',
        toolsNeeded: 'Driver set, gloves, cutters, multimeter',
        recoverableMaterials: 'Transformer, aluminum, wire, circuit boards',
        partOutNotes: 'Sample only; test complete gear before dismantling.',
        notes: 'Conservative local placeholder; resale can exceed scrap value.',
      ),
      ObjectTemplate(
        id: 'sewing-machine',
        name: 'Sewing machine',
        aliases: 'electric sewing machine, vintage sewing machine',
        category: 'Small appliance',
        cargoDemand: CargoDemand.medium,
        destination: Destination.home,
        lowValue: 1,
        likelyValue: 6,
        highValue: 15,
        stripMinutes: 20,
        stripDifficulty: 2,
        safetyNotes:
            'Secure needle and moving parts; unplug before inspection.',
        toolsNeeded: 'Driver set, pliers, gloves',
        recoverableMaterials: 'Motor, steel, cast aluminum, power cord',
        partOutNotes: 'Sample only; test and check vintage resale first.',
        notes: 'Conservative local placeholder estimate.',
      ),
      ObjectTemplate(
        id: 'ups-battery-backup',
        name: 'UPS/battery backup',
        aliases: 'uninterruptible power supply, battery backup, UPS',
        category: 'Electronics',
        cargoDemand: CargoDemand.medium,
        destination: Destination.home,
        lowValue: 1,
        likelyValue: 7,
        highValue: 18,
        stripMinutes: 20,
        stripDifficulty: 4,
        safetyNotes: 'Treat batteries as energized; isolate damaged batteries.',
        toolsNeeded: 'Insulated gloves, driver set, eye protection, meter',
        recoverableMaterials: 'Lead battery, transformer, wire, circuit boards',
        partOutNotes: 'Sample only; use an approved battery recycler.',
        notes: 'Conservative local placeholder; never scrap damaged cells.',
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
        timeWindow: 'Today 4-6 PM',
        destination: Destination.home,
        status: ItemStatus.lead,
        notes: 'Seller can help load.',
        source: 'Facebook Marketplace',
        sourceId: 'facebook-marketplace',
        ruleMatch: 'Free appliances: free dishwasher',
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
        source: 'Craigslist',
        sourceId: 'craigslist',
        ruleMatch: 'Free appliances: cabinet alias placeholder',
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
        sourceId: 'manual-entry',
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
        sourceId: 'manual-entry',
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
    searchSources.addAll([
      SearchSource(
        id: 'facebook-marketplace',
        name: 'Facebook Marketplace',
        type: 'Marketplace',
        enabled: true,
        defaultRadius: 25,
        supportsDirectLink: true,
        supportsManualEntry: true,
        supportsNotifications: false,
        notes: 'Manual review placeholder; no marketplace automation.',
      ),
      SearchSource(
        id: 'craigslist',
        name: 'Craigslist',
        type: 'Classifieds',
        enabled: true,
        defaultRadius: 30,
        supportsDirectLink: true,
        supportsManualEntry: true,
        supportsNotifications: false,
        notes: 'Manual link and result entry placeholder.',
      ),
      SearchSource(
        id: 'offerup',
        name: 'OfferUp',
        type: 'Marketplace',
        enabled: false,
        defaultRadius: 20,
        supportsDirectLink: true,
        supportsManualEntry: true,
        supportsNotifications: false,
        notes: 'Manual review placeholder.',
      ),
      SearchSource(
        id: 'freecycle',
        name: 'Freecycle',
        type: 'Community reuse',
        enabled: true,
        defaultRadius: 25,
        supportsDirectLink: true,
        supportsManualEntry: true,
        supportsNotifications: false,
        notes: 'Local group availability varies.',
      ),
      SearchSource(
        id: 'buy-nothing',
        name: 'Buy Nothing',
        type: 'Community group',
        enabled: false,
        defaultRadius: 10,
        supportsDirectLink: false,
        supportsManualEntry: true,
        supportsNotifications: false,
        notes: 'Manual entry only; respect local group rules.',
      ),
      SearchSource(
        id: 'manual-entry',
        name: 'Manual Entry',
        type: 'Local input',
        enabled: true,
        defaultRadius: 25,
        supportsDirectLink: false,
        supportsManualEntry: true,
        supportsNotifications: false,
        notes: 'Items entered directly in Scrappr.',
      ),
      SearchSource(
        id: 'custom-url-rss',
        name: 'Custom URL / RSS Placeholder',
        type: 'Custom feed',
        enabled: false,
        defaultRadius: 25,
        supportsDirectLink: true,
        supportsManualEntry: true,
        supportsNotifications: false,
        notes: 'Placeholder only; no feed automation is connected.',
      ),
    ]);
    searchRules.add(
      SearchRule(
        id: 'sr1',
        name: 'Free appliances',
        keywords: 'free dishwasher, washer, dryer',
        excludedWords: 'wanted, repair service',
        maxRadius: 25,
        sourceIds: ['facebook-marketplace', 'craigslist', 'freecycle'],
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
  final searchSources = <SearchSource>[];
  final photos = <PhotoAttachment>[];
  AssistantService? assistantService;
  final notificationSettings = NotificationSettings(
    notificationsEnabled: false,
    notifyNewMatches: true,
    notifyHighValueOnly: false,
    minimumValueThreshold: 20,
    quietHoursEnabled: false,
    quietStart: '22:00',
    quietEnd: '07:00',
    notifyDuplicates: false,
    notifyWorthwhileRoute: true,
  );
  final homeBase = HomeBaseSettings(
    id: 'home',
    label: 'Home Base',
    address: 'Set your starting address',
    cityStateZip: 'Vancouver, WA',
    defaultFuelPrice: 4.25,
    notes: 'Sample local placeholder. Update before future route planning.',
  );
  late RunPlan run;
  DateTime? lastRefresh;
  Vehicle get vehicle => vehicles.firstWhere((v) => v.id == run.vehicleId);
  ObjectTemplate template(String id) => templates.firstWhere((t) => t.id == id);
  SearchSource source(String id) =>
      searchSources.firstWhere((source) => source.id == id);
  int photoCount(String ownerId, String ownerType) => photos
      .where(
        (photo) => photo.ownerId == ownerId && photo.ownerType == ownerType,
      )
      .length;
  String sourceSummary(SearchRule rule) => rule.sourceIds
      .where((id) => searchSources.any((source) => source.id == id))
      .map((id) => source(id).name)
      .join(', ');
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
  double get fuelCost => runMiles / vehicle.mpg * homeBase.defaultFuelPrice;
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
    final enabledRule = searchRules.where((rule) => rule.enabled).firstOrNull;
    final enabledSourceIds = enabledRule?.sourceIds
        .where((sourceId) => source(sourceId).enabled)
        .toList();
    final selectedSourceId = enabledSourceIds?.firstOrNull ?? 'manual-entry';
    final selectedSource = source(selectedSourceId);
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
        source: selectedSource.name,
        sourceId: selectedSource.id,
        ruleMatch: enabledRule == null
            ? 'No enabled rule; local fallback'
            : '${enabledRule.name}: ${enabledRule.keywords}',
      ),
    );
    lastRefresh = DateTime.now();
  }
}
