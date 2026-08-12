import 'package:drift/drift.dart';

@DataClassName('VehicleRow')
class Vehicles extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get type => text()();
  RealColumn get mpg => real()();
  RealColumn get cargoLength => real()();
  RealColumn get cargoWidth => real()();
  RealColumn get cargoHeight => real()();
  RealColumn get payloadLimit => real()();
  IntColumn get fullCargo => integer()();
  IntColumn get largeUpright => integer()();
  IntColumn get medium => integer()();
  TextColumn get notes => text()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

@DataClassName('YardRow')
class Yards extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get address => text()();
  TextColumn get cityStateZip => text()();
  TextColumn get phone => text()();
  TextColumn get hours => text()();
  TextColumn get notes => text()();
  BoolColumn get preferred => boolean()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

@DataClassName('YardPriceRow')
class YardPrices extends Table {
  TextColumn get id => text()();
  TextColumn get yardId => text().references(Yards, #id)();
  TextColumn get material => text()();
  RealColumn get price => real()();
  TextColumn get unit => text()();
  DateTimeColumn get updatedAt => dateTime()();
  TextColumn get notes => text()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

@DataClassName('SearchSourceRow')
class SearchSources extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get type => text()();
  BoolColumn get enabled => boolean()();
  RealColumn get defaultRadius => real()();
  BoolColumn get supportsDirectLink => boolean()();
  BoolColumn get supportsManualEntry => boolean()();
  BoolColumn get supportsNotifications => boolean()();
  TextColumn get notes => text()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

@DataClassName('SearchRuleRow')
class SearchRules extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get keywords => text()();
  TextColumn get excludedWords => text()();
  RealColumn get maxRadius => real()();
  BoolColumn get notify => boolean()();
  BoolColumn get enabled => boolean()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

@DataClassName('SearchRuleSourceRow')
class SearchRuleSources extends Table {
  TextColumn get ruleId => text().references(SearchRules, #id)();
  TextColumn get sourceId => text().references(SearchSources, #id)();

  @override
  Set<Column<Object>> get primaryKey => {ruleId, sourceId};
}

@DataClassName('NotificationSettingsRow')
class NotificationSettingsTable extends Table {
  IntColumn get id => integer()();
  BoolColumn get notificationsEnabled => boolean()();
  BoolColumn get notifyNewMatches => boolean()();
  BoolColumn get notifyHighValueOnly => boolean()();
  RealColumn get minimumValueThreshold => real()();
  BoolColumn get quietHoursEnabled => boolean()();
  TextColumn get quietStart => text()();
  TextColumn get quietEnd => text()();
  BoolColumn get notifyDuplicates => boolean()();
  BoolColumn get notifyWorthwhileRoute => boolean()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

@DataClassName('ObjectTemplateRow')
class ObjectTemplates extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get aliases => text()();
  TextColumn get category => text()();
  TextColumn get cargoDemand => text()();
  TextColumn get destination => text()();
  RealColumn get lowValue => real()();
  RealColumn get likelyValue => real()();
  RealColumn get highValue => real()();
  IntColumn get stripMinutes => integer()();
  IntColumn get stripDifficulty => integer()();
  TextColumn get safetyNotes => text()();
  TextColumn get toolsNeeded => text()();
  TextColumn get recoverableMaterials => text()();
  TextColumn get partOutNotes => text()();
  TextColumn get notes => text()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

@DataClassName('ScrapItemRow')
class ScrapItems extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  TextColumn get templateId => text().references(ObjectTemplates, #id)();
  TextColumn get pickupAddress => text()();
  TextColumn get locationName => text()();
  RealColumn get miles => real()();
  TextColumn get timeWindow => text()();
  TextColumn get destination => text()();
  TextColumn get status => text()();
  TextColumn get notes => text()();
  TextColumn get source => text()();
  TextColumn get sourceId => text().nullable()();
  TextColumn get ruleMatch => text()();
  BoolColumn get duplicateWarning => boolean()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

@DataClassName('RunPlanRow')
class RunPlans extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get vehicleId => text().references(Vehicles, #id)();
  BoolColumn get active => boolean().withDefault(const Constant(false))();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

@DataClassName('RunPlanItemRow')
class RunPlanItems extends Table {
  TextColumn get runPlanId => text().references(RunPlans, #id)();
  TextColumn get itemId => text().references(ScrapItems, #id)();
  IntColumn get stopOrder => integer()();

  @override
  Set<Column<Object>> get primaryKey => {runPlanId, itemId};
}

@DataClassName('ReceiptRow')
class Receipts extends Table {
  TextColumn get id => text()();
  TextColumn get yardId => text().references(Yards, #id)();
  RealColumn get amount => real()();
  DateTimeColumn get date => dateTime()();
  TextColumn get notes => text()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

@DataClassName('PhotoAttachmentRow')
class PhotoAttachments extends Table {
  TextColumn get id => text()();
  TextColumn get ownerId => text()();
  TextColumn get ownerType => text()();
  TextColumn get localPath => text().nullable()();
  TextColumn get caption => text()();
  DateTimeColumn get createdAt => dateTime()();
  TextColumn get hash => text().nullable()();
  TextColumn get ocrText => text().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

@DataClassName('AssistantMessageRow')
class AssistantMessages extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get contextId => integer().nullable().references(
    AssistantContexts,
    #id,
    onDelete: KeyAction.cascade,
  )();
  TextColumn get role => text()();
  TextColumn get message => text()();
  DateTimeColumn get createdAt => dateTime()();
}

@DataClassName('AssistantContextRow')
class AssistantContexts extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get currentScreen => text()();
  TextColumn get selectedItemId => text().nullable()();
  TextColumn get selectedTemplateId => text().nullable()();
  TextColumn get selectedRunId => text().nullable()();
  TextColumn get selectedYardId => text().nullable()();
  TextColumn get selectedReceiptId => text().nullable()();
}

@DataClassName('HomeBaseSettingsRow')
class HomeBaseSettingsTable extends Table {
  TextColumn get id => text()();
  TextColumn get label => text()();
  TextColumn get address => text()();
  TextColumn get cityStateZip => text()();
  RealColumn get defaultFuelPrice => real()();
  TextColumn get notes => text()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}
