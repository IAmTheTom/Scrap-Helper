import 'dart:io';

import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:scrap_helper/database/app_database.dart';
import 'package:scrap_helper/main.dart';

void main() {
  test('assistant context and messages persist and can be cleared', () async {
    final directory = await Directory.systemTemp.createTemp(
      'scrappr_assistant_',
    );
    final file = File('${directory.path}/assistant.sqlite');
    addTearDown(() async {
      if (directory.existsSync()) directory.deleteSync(recursive: true);
    });

    var database = AppDatabase.forTesting(NativeDatabase(file));
    final persistence = PersistenceService(database);
    final model = await persistence.loadOrSeed();
    var service = AssistantService(database);
    final context = await service.getOrCreateContext(
      AssistantContextType.currentRun,
      ownerId: model.run.id,
    );
    final reused = await service.getOrCreateContext(
      AssistantContextType.currentRun,
      ownerId: model.run.id,
    );

    expect(context.id, isNotNull);
    expect(reused.id, context.id);

    final sent = await service.send(
      model: model,
      context: context,
      prompt: 'Summarize this run',
    );
    expect(sent.map((message) => message.role), ['user', 'assistant']);
    expect(sent.first.message, 'Summarize this run');
    expect(sent.last.message, contains('No connected AI model was used.'));
    await database.close();

    database = AppDatabase.forTesting(NativeDatabase(file));
    service = AssistantService(database);
    final reloadedContext = await service.getOrCreateContext(
      AssistantContextType.currentRun,
      ownerId: model.run.id,
    );
    final reloadedMessages = await service.loadMessages(reloadedContext);
    expect(reloadedMessages, hasLength(2));
    expect(reloadedMessages.first.role, 'user');
    expect(reloadedMessages.last.role, 'assistant');

    await service.clearHistory(reloadedContext);
    expect(await service.loadMessages(reloadedContext), isEmpty);
    await database.close();
  });

  test(
    'local rule engine summarizes useful active run data without GUI',
    () async {
      final database = AppDatabase.forTesting(NativeDatabase.memory());
      addTearDown(database.close);
      final model = ScrapprModel.seeded();
      final service = AssistantService(database);
      final context = await service.getOrCreateContext(
        AssistantContextType.currentRun,
        ownerId: model.run.id,
      );

      final response = service.respond(model: model, context: context);

      expect(response, contains(model.run.name));
      expect(response, contains('${model.runItems.length} item(s)'));
      expect(response, contains('\$${model.runValue.toStringAsFixed(2)}'));
      expect(response, contains('Destinations:'));
      expect(response, contains('Route handoff is'));
      expect(
        response,
        contains(
          'No connected AI model was used. This response comes from '
          "Scrappr's local rule engine and stored app data.",
        ),
      );
    },
  );

  test('all supported context types can be created without a model', () async {
    final database = AppDatabase.forTesting(NativeDatabase.memory());
    addTearDown(database.close);
    final service = AssistantService(database);

    for (final type in AssistantContextType.values) {
      final context = await service.getOrCreateContext(type, ownerId: 'owner');
      expect(context.type, type);
      expect(context.id, isNotNull);
    }
  });
}
