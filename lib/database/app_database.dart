import 'package:drift/drift.dart';

import 'database_provider.dart';
import 'tables.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    Vehicles,
    Yards,
    YardPrices,
    SearchSources,
    SearchRules,
    SearchRuleSources,
    NotificationSettingsTable,
    ObjectTemplates,
    ScrapItems,
    RunPlans,
    RunPlanItems,
    Receipts,
    PhotoAttachments,
    AssistantMessages,
    AssistantContexts,
    HomeBaseSettingsTable,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(openScrapprDatabase());

  AppDatabase.forTesting(super.executor);

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (migrator) => migrator.createAll(),
    onUpgrade: (migrator, from, to) async {
      if (from < 2) {
        await migrator.addColumn(
          assistantMessages,
          assistantMessages.contextId,
        );
      }
    },
    beforeOpen: (details) async {
      await customStatement('PRAGMA foreign_keys = ON');
    },
  );
}
