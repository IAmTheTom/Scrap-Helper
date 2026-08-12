import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:scrap_helper/database/app_database.dart';
import 'package:scrap_helper/main.dart';

void main() {
  test('external links launch valid URLs and report fallback', () async {
    Uri? launched;
    final service = ExternalLinkService(
      launcher: (uri) async {
        launched = uri;
        return true;
      },
    );
    expect(await service.open('https://example.com/listing'), isTrue);
    expect(launched.toString(), 'https://example.com/listing');
    expect(
      await ExternalLinkService(
        launcher: (_) async => false,
      ).open('https://example.com/maps'),
      isFalse,
    );
    expect(await service.open('not a URL'), isFalse);
  });

  test('source listing URL and custom search source persist', () async {
    final database = AppDatabase.forTesting(NativeDatabase.memory());
    final persistence = PersistenceService(database);
    final model = ScrapprModel.seeded();
    model.items.first.sourceUrl = 'https://example.com/user-listing';
    model.searchSources.add(
      SearchSource(
        id: 'user-source',
        name: 'Neighborhood board',
        type: 'Manual',
        enabled: true,
        defaultRadius: 12,
        supportsDirectLink: true,
        supportsManualEntry: true,
        supportsNotifications: false,
        notes: 'Manual/configuration only; integration pending.',
      ),
    );
    await persistence.save(model);
    final loaded = await persistence.load();
    expect(loaded.items.first.sourceUrl, 'https://example.com/user-listing');
    expect(
      loaded.searchSources
          .singleWhere((source) => source.id == 'user-source')
          .name,
      'Neighborhood board',
    );
    await database.close();
  });

  test('seed library and yard picker cover common materials', () {
    final model = ScrapprModel.seeded();
    final names = model.templates.map(
      (template) => template.name.toLowerCase(),
    );
    for (final expected in [
      'bare bright copper',
      'brass',
      'insulated copper wire',
      'circuit boards',
      'electric motors',
      'transformers',
    ]) {
      expect(names, contains(expected));
    }
    final options = yardPriceMaterialOptions(model);
    expect(options.first, 'NEW');
    expect(options.map((value) => value.toLowerCase()), contains('brass'));
  });

  test('capture options support unassigned and record owners', () {
    final options = captureOwnerOptions(ScrapprModel.seeded());
    expect(options.first.$2, PhotoOwnerType.unassignedCapture);
    final types = options.map((option) => option.$2);
    expect(types, contains(PhotoOwnerType.inboxItem));
    expect(types, contains(PhotoOwnerType.runItem));
    expect(types, contains(PhotoOwnerType.receipt));
    expect(types, contains(PhotoOwnerType.objectTemplate));
  });

  test('assistant quick-action configuration preserves prompt and context', () {
    final database = AppDatabase.forTesting(NativeDatabase.memory());
    addTearDown(database.close);
    final model = ScrapprModel.seeded();
    final screen = AssistantScreen(
      model: model,
      service: AssistantService(database),
      initialContextType: AssistantContextType.runItem,
      initialOwnerId: model.runItems.first.id,
      initialPrompt: 'Safety concerns',
    );
    expect(screen.initialContextType, AssistantContextType.runItem);
    expect(screen.initialOwnerId, model.runItems.first.id);
    expect(screen.initialPrompt, 'Safety concerns');
  });

  testWidgets('route optimization and split are disabled and pending', (
    tester,
  ) async {
    final model = ScrapprModel.seeded();
    await tester.pumpWidget(
      MaterialApp(
        home: RunsScreen(model: model, changed: () {}),
      ),
    );
    await tester.scrollUntilVisible(
      find.text('Optimize route (pending)'),
      300,
      scrollable: find.byType(Scrollable).first,
    );
    expect(find.text('Optimize route (pending)'), findsOneWidget);
    expect(find.text('Split run (pending)'), findsOneWidget);
    final buttons = tester.widgetList<FilledButton>(find.byType(FilledButton));
    expect(
      buttons.where((button) => button.onPressed == null).length,
      greaterThanOrEqualTo(2),
    );
  });
}
