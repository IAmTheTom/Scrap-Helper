part of '../main.dart';

class AssistantService {
  AssistantService(this.database, {this._routeService = const RouteService()});

  final AppDatabase database;
  final RouteService _routeService;

  Future<AssistantContext> getOrCreateContext(
    AssistantContextType type, {
    String? ownerId,
  }) async {
    final normalizedOwner = ownerId?.trim().isEmpty ?? true
        ? null
        : ownerId!.trim();
    final rows =
        await (database.select(database.assistantContexts)
              ..where(
                (row) =>
                    row.currentScreen.equals(type.storageValue) &
                    (normalizedOwner == null
                        ? _ownerColumn(type, row).isNull()
                        : _ownerColumn(type, row).equals(normalizedOwner)),
              )
              ..limit(1))
            .get();
    if (rows.isNotEmpty) return _contextFromRow(rows.first);

    final id = await database
        .into(database.assistantContexts)
        .insert(
          AssistantContextsCompanion.insert(
            currentScreen: type.storageValue,
            selectedItemId: Value(
              const [
                    AssistantContextType.inboxItem,
                    AssistantContextType.runItem,
                    AssistantContextType.processingItem,
                    AssistantContextType.vehicle,
                    AssistantContextType.general,
                  ].contains(type)
                  ? normalizedOwner
                  : null,
            ),
            selectedTemplateId: Value(
              type == AssistantContextType.objectTemplate
                  ? normalizedOwner
                  : null,
            ),
            selectedRunId: Value(
              type == AssistantContextType.currentRun ? normalizedOwner : null,
            ),
            selectedYardId: Value(
              type == AssistantContextType.yard ? normalizedOwner : null,
            ),
            selectedReceiptId: Value(
              type == AssistantContextType.receipt ? normalizedOwner : null,
            ),
          ),
        );
    return AssistantContext(id: id, type: type, ownerId: normalizedOwner);
  }

  GeneratedColumn<String> _ownerColumn(
    AssistantContextType type,
    $AssistantContextsTable row,
  ) => switch (type) {
    AssistantContextType.inboxItem ||
    AssistantContextType.runItem ||
    AssistantContextType.processingItem => row.selectedItemId,
    AssistantContextType.vehicle => row.selectedItemId,
    AssistantContextType.objectTemplate => row.selectedTemplateId,
    AssistantContextType.currentRun => row.selectedRunId,
    AssistantContextType.yard => row.selectedYardId,
    AssistantContextType.receipt => row.selectedReceiptId,
    AssistantContextType.general => row.selectedItemId,
  };

  Future<List<AssistantMessage>> loadMessages(AssistantContext context) async {
    final contextId = context.id;
    if (contextId == null) return const [];
    final rows =
        await (database.select(database.assistantMessages)
              ..where((row) => row.contextId.equals(contextId))
              ..orderBy([(row) => OrderingTerm.asc(row.id)]))
            .get();
    return rows
        .map(
          (row) => AssistantMessage(
            id: row.id,
            contextId: contextId,
            role: row.role,
            message: row.message,
            createdAt: row.createdAt,
          ),
        )
        .toList();
  }

  Future<AssistantMessage> storeMessage({
    required AssistantContext context,
    required String role,
    required String message,
  }) async {
    final contextId = context.id;
    if (contextId == null) throw StateError('Context must be persisted first.');
    final createdAt = DateTime.now();
    final id = await database
        .into(database.assistantMessages)
        .insert(
          AssistantMessagesCompanion.insert(
            contextId: Value(contextId),
            role: role,
            message: message,
            createdAt: createdAt,
          ),
        );
    return AssistantMessage(
      id: id,
      contextId: contextId,
      role: role,
      message: message,
      createdAt: createdAt,
    );
  }

  Future<List<AssistantMessage>> send({
    required ScrapprModel model,
    required AssistantContext context,
    required String prompt,
  }) async {
    final user = await storeMessage(
      context: context,
      role: 'user',
      message: prompt.trim(),
    );
    final assistant = await storeMessage(
      context: context,
      role: 'assistant',
      message: respond(model: model, context: context),
    );
    return [user, assistant];
  }

  Future<void> clearHistory(AssistantContext context) async {
    final contextId = context.id;
    if (contextId == null) return;
    await (database.delete(
      database.assistantMessages,
    )..where((row) => row.contextId.equals(contextId))).go();
  }

  Future<void> deleteContext(AssistantContext context) async {
    final contextId = context.id;
    if (contextId == null) return;
    await database.transaction(() async {
      await clearHistory(context);
      await (database.delete(
        database.assistantContexts,
      )..where((row) => row.id.equals(contextId))).go();
    });
  }

  String respond({
    required ScrapprModel model,
    required AssistantContext context,
  }) {
    final summary = _summary(model, context);
    return '$summary\n\nNo connected AI model was used. This response comes '
        "from Scrappr's local rule engine and stored app data.";
  }

  String _summary(
    ScrapprModel model,
    AssistantContext context,
  ) => switch (context.type) {
    AssistantContextType.currentRun => _runSummary(model),
    AssistantContextType.inboxItem ||
    AssistantContextType.runItem ||
    AssistantContextType.processingItem => _itemSummary(model, context),
    AssistantContextType.objectTemplate => _templateSummary(model, context),
    AssistantContextType.yard => _yardSummary(model, context),
    AssistantContextType.vehicle => _vehicleSummary(model, context),
    AssistantContextType.receipt => _receiptSummary(model, context),
    AssistantContextType.general =>
      'Scrappr has ${model.items.length} items, ${model.runItems.length} on '
          'the active run, ${model.yards.length} yards, and '
          '${model.photos.length} attached photos.',
  };

  String _runSummary(ScrapprModel model) {
    final routeReady = _routeService.buildActiveRun(model).mapsUrl != null;
    return '${model.run.name} has ${model.runItems.length} item(s), estimated '
        'value \$${model.runValue.toStringAsFixed(2)}, and '
        '${model.fitsVehicle ? 'fits ${model.vehicle.name}' : 'does not fit ${model.vehicle.name}'}. '
        'Destinations: ${model.homeCount} home and ${model.yardCount} yard. '
        'Route handoff is ${routeReady ? 'available' : 'not available'}.';
  }

  String _itemSummary(ScrapprModel model, AssistantContext context) {
    final matches = model.items.where((item) => item.id == context.ownerId);
    if (matches.isEmpty) {
      return 'No matching item is selected for this context.';
    }
    final item = matches.first;
    final ownerType = switch (context.type) {
      AssistantContextType.inboxItem => PhotoOwnerType.inboxItem,
      AssistantContextType.runItem => PhotoOwnerType.runItem,
      AssistantContextType.processingItem => PhotoOwnerType.processingItem,
      _ => PhotoOwnerType.inboxItem,
    };
    return '${item.title} is ${statusLabel(item.status).toLowerCase()}, is '
        'destined for ${destinationLabel(item.destination).toLowerCase()}, and '
        'has ${model.photoCount(item.id, ownerType)} attached photo(s).';
  }

  String _templateSummary(ScrapprModel model, AssistantContext context) {
    final matches = model.templates.where((item) => item.id == context.ownerId);
    if (matches.isEmpty) return 'No matching object template is selected.';
    final template = matches.first;
    return '${template.name} has a likely value of '
        '\$${template.likelyValue.toStringAsFixed(2)}. Safety notes: '
        '${template.safetyNotes}';
  }

  String _yardSummary(ScrapprModel model, AssistantContext context) {
    final matches = model.yards.where((yard) => yard.id == context.ownerId);
    if (matches.isEmpty) {
      return 'There are ${model.yards.length} configured yard(s) and '
          '${model.yardPrices.length} stored price record(s).';
    }
    final yard = matches.first;
    final prices = model.yardPrices
        .where((price) => price.yardId == yard.id)
        .length;
    return '${yard.name} has $prices stored price record(s). Verify prices '
        'and acceptance rules before hauling.';
  }

  String _vehicleSummary(ScrapprModel model, AssistantContext context) {
    final matches = model.vehicles.where((item) => item.id == context.ownerId);
    final vehicle = matches.firstOrNull ?? model.vehicle;
    return '${vehicle.name} is the evaluated vehicle. The active run '
        '${model.fitsVehicle ? 'fits' : 'does not fit'} its configured cargo limits.';
  }

  String _receiptSummary(ScrapprModel model, AssistantContext context) {
    final matches = model.receipts.where((item) => item.id == context.ownerId);
    if (matches.isEmpty) {
      return '${model.receipts.length} receipt(s) total '
          '\$${model.totalPayout.toStringAsFixed(2)}.';
    }
    final receipt = matches.first;
    return 'The selected receipt is \$${receipt.amount.toStringAsFixed(2)}. '
        'All receipts total \$${model.totalPayout.toStringAsFixed(2)}.';
  }

  AssistantContext _contextFromRow(AssistantContextRow row) {
    final type = AssistantContextType.fromStorage(row.currentScreen);
    final ownerId = switch (type) {
      AssistantContextType.inboxItem ||
      AssistantContextType.runItem ||
      AssistantContextType.processingItem => row.selectedItemId,
      AssistantContextType.vehicle => row.selectedItemId,
      AssistantContextType.objectTemplate => row.selectedTemplateId,
      AssistantContextType.currentRun => row.selectedRunId,
      AssistantContextType.yard => row.selectedYardId,
      AssistantContextType.receipt => row.selectedReceiptId,
      AssistantContextType.general => row.selectedItemId,
    };
    return AssistantContext(id: row.id, type: type, ownerId: ownerId);
  }
}
