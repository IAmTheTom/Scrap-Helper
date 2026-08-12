import 'dart:io';

import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:scrap_helper/database/app_database.dart';
import 'package:scrap_helper/main.dart';

void main() {
  test('user-created workflow survives restart and remains usable', () async {
    final directory = await Directory.systemTemp.createTemp('scrappr_smoke_');
    final databaseFile = File('${directory.path}/smoke.sqlite');
    final sourcePhoto = File('${directory.path}/source.jpg');
    await sourcePhoto.writeAsBytes([1, 2, 3]);
    addTearDown(() async {
      if (directory.existsSync()) directory.deleteSync(recursive: true);
    });

    var database = AppDatabase.forTesting(NativeDatabase(databaseFile));
    var persistence = PersistenceService(database);
    final model = ScrapprModel.empty();
    model.homeBase
      ..label = 'User Home'
      ..address = '10 Home St'
      ..cityStateZip = 'Vancouver, WA';
    model.vehicles.add(_vehicle());
    model.yards.add(_yard());
    model.yardPrices.add(
      YardPrice(
        id: 'user-price',
        yardId: 'user-yard',
        material: 'Steel',
        price: 0.10,
        unit: r'$/lb',
        updatedAt: DateTime(2026, 8, 11),
        notes: 'User price',
      ),
    );
    model.templates.add(_template());
    model.items.add(_item());
    model.run = RunPlan(
      id: 'user-run',
      name: 'User Run',
      vehicleId: 'user-vehicle',
      itemIds: ['user-item'],
    );
    model.receipts.add(
      Receipt(
        id: 'user-receipt',
        yardId: 'user-yard',
        amount: 31.50,
        date: DateTime(2026, 8, 11),
        notes: 'User receipt',
      ),
    );

    final picker = _FakePicker(sourcePhoto.path);
    final photoService = PhotoAttachmentService(
      picker: picker,
      storageDirectoryProvider: () async =>
          Directory('${directory.path}/photos'),
      cameraSupported: false,
    );
    for (final owner in const [
      ('user-item', PhotoOwnerType.runItem),
      ('user-template', PhotoOwnerType.objectTemplate),
      ('user-receipt', PhotoOwnerType.receipt),
    ]) {
      final (_, attachment) = await photoService.attach(
        ownerId: owner.$1,
        ownerType: owner.$2,
        action: PhotoAttachmentAction.gallery,
      );
      model.photos.add(attachment!);
    }

    final route = const RouteService().buildActiveRun(model);
    expect(route.canHandOff, isTrue);
    expect(route.mapsUrl, contains('google.com/maps'));

    final assistant = AssistantService(database);
    for (final owner in const [
      (AssistantContextType.currentRun, 'user-run'),
      (AssistantContextType.runItem, 'user-item'),
      (AssistantContextType.objectTemplate, 'user-template'),
      (AssistantContextType.yard, 'user-yard'),
      (AssistantContextType.receipt, 'user-receipt'),
    ]) {
      final context = await assistant.getOrCreateContext(
        owner.$1,
        ownerId: owner.$2,
      );
      await assistant.send(model: model, context: context, prompt: 'Summary');
    }
    final itemContext = await assistant.getOrCreateContext(
      AssistantContextType.runItem,
      ownerId: 'user-item',
    );
    expect(
      assistant.respond(model: model, context: itemContext),
      contains('1 attached photo(s)'),
    );

    model.items.single.status = ItemStatus.pickedUp;
    model.items.single.status = ItemStatus.processing;
    model.items.single.status = ItemStatus.readyForYard;
    await persistence.save(model);
    await database.close();

    database = AppDatabase.forTesting(NativeDatabase(databaseFile));
    persistence = PersistenceService(database);
    final reloaded = await persistence.load();
    expect(reloaded.run.itemIds, ['user-item']);
    expect(reloaded.items.single.status, ItemStatus.readyForYard);
    expect(reloaded.yardPrices.single.yardId, 'user-yard');
    expect(reloaded.receipts.single.yardId, 'user-yard');
    expect(reloaded.photos, hasLength(3));
    final reloadedAssistant = AssistantService(database);
    final reloadedContext = await reloadedAssistant.getOrCreateContext(
      AssistantContextType.receipt,
      ownerId: 'user-receipt',
    );
    expect(await reloadedAssistant.loadMessages(reloadedContext), hasLength(2));
    await database.close();
  });

  test(
    'dependent photo cleanup removes metadata and controlled files',
    () async {
      final directory = await Directory.systemTemp.createTemp(
        'scrappr_cleanup_',
      );
      final file = File('${directory.path}/owned.jpg');
      await file.writeAsBytes([1]);
      addTearDown(() async {
        if (directory.existsSync()) directory.deleteSync(recursive: true);
      });
      final attachments = [
        PhotoAttachment(
          id: 'photo',
          ownerId: 'deleted-item',
          ownerType: PhotoOwnerType.runItem,
          localPath: file.path,
          caption: '',
          createdAt: DateTime(2026, 8, 11),
        ),
      ];
      final service = PhotoAttachmentService(
        storageDirectoryProvider: () async => directory,
      );

      await service.deleteForOwner(
        attachments,
        ownerId: 'deleted-item',
        ownerTypes: const [PhotoOwnerType.runItem],
      );

      expect(attachments, isEmpty);
      expect(file.existsSync(), isFalse);
    },
  );
}

class _FakePicker implements PhotoSourcePicker {
  const _FakePicker(this.path);
  final String path;
  @override
  Future<String?> capturePhoto() async => path;
  @override
  Future<String?> choosePhoto() async => path;
}

Vehicle _vehicle() => Vehicle(
  id: 'user-vehicle',
  name: 'User Truck',
  type: 'Truck',
  mpg: 20,
  cargoLength: 72,
  cargoWidth: 48,
  cargoHeight: 24,
  payloadLimit: 1200,
  fullCargo: 2,
  largeUpright: 4,
  medium: 8,
  notes: '',
);

Yard _yard() => Yard(
  id: 'user-yard',
  name: 'User Yard',
  address: '90 Yard Rd',
  cityStateZip: 'Vancouver, WA',
  phone: '',
  hours: '',
  notes: '',
  preferred: true,
);

ObjectTemplate _template() => ObjectTemplate(
  id: 'user-template',
  name: 'User Appliance',
  aliases: '',
  category: 'Appliance',
  cargoDemand: CargoDemand.medium,
  destination: Destination.yard,
  lowValue: 10,
  likelyValue: 20,
  highValue: 30,
  stripMinutes: 10,
  stripDifficulty: 2,
  safetyNotes: 'Wear gloves.',
  toolsNeeded: 'Gloves',
  recoverableMaterials: 'Steel',
  partOutNotes: '',
  notes: '',
);

ScrapItem _item() => ScrapItem(
  id: 'user-item',
  title: 'User Item',
  templateId: 'user-template',
  pickupAddress: '20 Pickup Ave',
  locationName: 'Vancouver',
  miles: 5,
  timeWindow: 'Today',
  destination: Destination.yard,
  status: ItemStatus.claimed,
  notes: '',
  source: 'Manual',
);
