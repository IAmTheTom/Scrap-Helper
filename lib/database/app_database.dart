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
  int get schemaVersion => 1;
}
