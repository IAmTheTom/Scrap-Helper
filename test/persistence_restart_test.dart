import 'dart:io';

import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:scrap_helper/database/app_database.dart';
import 'package:scrap_helper/main.dart';

void main() {
  test('vehicle, receipt, and template survive a database restart', () async {
    final directory = await Directory.systemTemp.createTemp(
      'scrappr_persistence_',
    );
    final file = File('${directory.path}\\scrappr.sqlite');
    addTearDown(() async {
      if (directory.existsSync()) directory.deleteSync(recursive: true);
    });

    var database = AppDatabase.forTesting(NativeDatabase(file));
    var persistence = PersistenceService(database);
    final model = await persistence.loadOrSeed();
    model.vehicles.first.notes = 'Restart verification note';
    model.receipts.add(
      Receipt(
        id: 'restart-receipt',
        yardId: model.yards.first.id,
        amount: 12.34,
        date: DateTime(2026, 8, 11),
        notes: 'Restart verification receipt',
      ),
    );
    model.templates.add(
      ObjectTemplate(
        id: 'restart-template',
        name: 'Restart verification template',
        aliases: 'restart test',
        category: 'Test',
        cargoDemand: CargoDemand.tiny,
        destination: Destination.home,
        lowValue: 1,
        likelyValue: 2,
        highValue: 3,
        stripMinutes: 1,
        stripDifficulty: 1,
        safetyNotes: 'Test only',
        toolsNeeded: 'None',
        recoverableMaterials: 'Test material',
        partOutNotes: 'Test only',
        notes: 'Restart verification object',
      ),
    );
    await persistence.save(model);
    await database.close();

    database = AppDatabase.forTesting(NativeDatabase(file));
    persistence = PersistenceService(database);
    final reloaded = await persistence.load();

    expect(reloaded.vehicles.first.notes, 'Restart verification note');
    expect(
      reloaded.receipts.any((item) => item.id == 'restart-receipt'),
      isTrue,
    );
    expect(
      reloaded.templates.any((item) => item.id == 'restart-template'),
      isTrue,
    );
    await database.close();
  });
}
