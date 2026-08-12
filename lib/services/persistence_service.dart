part of '../main.dart';

class PersistenceService {
  PersistenceService(this.database);

  final AppDatabase database;
  Future<void> _saveQueue = Future.value();

  Future<ScrapprModel> loadOrSeed() async {
    final existingVehicles = await database.select(database.vehicles).get();
    if (existingVehicles.isEmpty) {
      final seeded = ScrapprModel.seeded();
      await save(seeded);
      return seeded;
    }
    return load();
  }

  Future<ScrapprModel> load() async {
    final model = ScrapprModel.empty();

    for (final row in await database.select(database.vehicles).get()) {
      model.vehicles.add(
        Vehicle(
          id: row.id,
          name: row.name,
          type: row.type,
          mpg: row.mpg,
          cargoLength: row.cargoLength,
          cargoWidth: row.cargoWidth,
          cargoHeight: row.cargoHeight,
          payloadLimit: row.payloadLimit,
          fullCargo: row.fullCargo,
          largeUpright: row.largeUpright,
          medium: row.medium,
          notes: row.notes,
        ),
      );
    }
    for (final row in await database.select(database.yards).get()) {
      model.yards.add(
        Yard(
          id: row.id,
          name: row.name,
          address: row.address,
          cityStateZip: row.cityStateZip,
          phone: row.phone,
          hours: row.hours,
          notes: row.notes,
          preferred: row.preferred,
        ),
      );
    }
    for (final row in await database.select(database.yardPrices).get()) {
      model.yardPrices.add(
        YardPrice(
          id: row.id,
          yardId: row.yardId,
          material: row.material,
          price: row.price,
          unit: row.unit,
          updatedAt: row.updatedAt,
          notes: row.notes,
        ),
      );
    }
    for (final row in await database.select(database.searchSources).get()) {
      model.searchSources.add(
        SearchSource(
          id: row.id,
          name: row.name,
          type: row.type,
          enabled: row.enabled,
          defaultRadius: row.defaultRadius,
          supportsDirectLink: row.supportsDirectLink,
          supportsManualEntry: row.supportsManualEntry,
          supportsNotifications: row.supportsNotifications,
          notes: row.notes,
        ),
      );
    }
    final sourceLinks = await database.select(database.searchRuleSources).get();
    for (final row in await database.select(database.searchRules).get()) {
      model.searchRules.add(
        SearchRule(
          id: row.id,
          name: row.name,
          keywords: row.keywords,
          excludedWords: row.excludedWords,
          maxRadius: row.maxRadius,
          sourceIds: sourceLinks
              .where((link) => link.ruleId == row.id)
              .map((link) => link.sourceId)
              .toList(),
          notify: row.notify,
          enabled: row.enabled,
        ),
      );
    }
    for (final row in await database.select(database.objectTemplates).get()) {
      model.templates.add(
        ObjectTemplate(
          id: row.id,
          name: row.name,
          aliases: row.aliases,
          category: row.category,
          cargoDemand: CargoDemand.values.byName(row.cargoDemand),
          destination: Destination.values.byName(row.destination),
          lowValue: row.lowValue,
          likelyValue: row.likelyValue,
          highValue: row.highValue,
          stripMinutes: row.stripMinutes,
          stripDifficulty: row.stripDifficulty,
          safetyNotes: row.safetyNotes,
          toolsNeeded: row.toolsNeeded,
          recoverableMaterials: row.recoverableMaterials,
          partOutNotes: row.partOutNotes,
          notes: row.notes,
        ),
      );
    }
    for (final row in await database.select(database.scrapItems).get()) {
      model.items.add(
        ScrapItem(
          id: row.id,
          title: row.title,
          templateId: row.templateId,
          pickupAddress: row.pickupAddress,
          locationName: row.locationName,
          miles: row.miles,
          timeWindow: row.timeWindow,
          destination: Destination.values.byName(row.destination),
          status: ItemStatus.values.byName(row.status),
          notes: row.notes,
          source: row.source,
          sourceId: row.sourceId,
          ruleMatch: row.ruleMatch,
          duplicateWarning: row.duplicateWarning,
        ),
      );
    }
    for (final row in await database.select(database.receipts).get()) {
      model.receipts.add(
        Receipt(
          id: row.id,
          yardId: row.yardId,
          amount: row.amount,
          date: row.date,
          notes: row.notes,
        ),
      );
    }
    for (final row in await database.select(database.photoAttachments).get()) {
      model.photos.add(
        PhotoAttachment(
          id: row.id,
          ownerId: row.ownerId,
          ownerType: row.ownerType,
          localPath: row.localPath,
          caption: row.caption,
          createdAt: row.createdAt,
          hash: row.hash,
          ocrText: row.ocrText,
        ),
      );
    }

    final notificationRows = await database
        .select(database.notificationSettingsTable)
        .get();
    if (notificationRows.isNotEmpty) {
      final row = notificationRows.first;
      final settings = model.notificationSettings;
      settings.notificationsEnabled = row.notificationsEnabled;
      settings.notifyNewMatches = row.notifyNewMatches;
      settings.notifyHighValueOnly = row.notifyHighValueOnly;
      settings.minimumValueThreshold = row.minimumValueThreshold;
      settings.quietHoursEnabled = row.quietHoursEnabled;
      settings.quietStart = row.quietStart;
      settings.quietEnd = row.quietEnd;
      settings.notifyDuplicates = row.notifyDuplicates;
      settings.notifyWorthwhileRoute = row.notifyWorthwhileRoute;
    }

    final homeRows = await database
        .select(database.homeBaseSettingsTable)
        .get();
    if (homeRows.isNotEmpty) {
      final row = homeRows.first;
      model.homeBase.label = row.label;
      model.homeBase.address = row.address;
      model.homeBase.cityStateZip = row.cityStateZip;
      model.homeBase.defaultFuelPrice = row.defaultFuelPrice;
      model.homeBase.notes = row.notes;
    }

    final runRows = await database.select(database.runPlans).get();
    final activeRun = runRows.firstWhere(
      (row) => row.active,
      orElse: () => runRows.first,
    );
    final runItems = await database.select(database.runPlanItems).get()
      ..sort((a, b) => a.stopOrder.compareTo(b.stopOrder));
    model.run = RunPlan(
      id: activeRun.id,
      name: activeRun.name,
      vehicleId: activeRun.vehicleId,
      itemIds: runItems
          .where((row) => row.runPlanId == activeRun.id)
          .map((row) => row.itemId)
          .toList(),
    );
    return model;
  }

  void scheduleSave(ScrapprModel model) {
    _saveQueue = _saveQueue.then((_) => save(model));
  }

  Future<void> closeWhenSaved() async {
    await _saveQueue;
    await database.close();
  }

  Future<void> save(ScrapprModel model) async {
    await database.transaction(() async {
      await database.delete(database.runPlanItems).go();
      await database.delete(database.searchRuleSources).go();
      await database.delete(database.yardPrices).go();
      await database.delete(database.receipts).go();
      await database.delete(database.photoAttachments).go();
      await database.delete(database.runPlans).go();
      await database.delete(database.scrapItems).go();
      await database.delete(database.searchRules).go();
      await database.delete(database.searchSources).go();
      await database.delete(database.objectTemplates).go();
      await database.delete(database.yards).go();
      await database.delete(database.vehicles).go();
      await database.delete(database.notificationSettingsTable).go();
      await database.delete(database.homeBaseSettingsTable).go();

      for (final value in model.vehicles) {
        await database
            .into(database.vehicles)
            .insert(
              VehicleRow(
                id: value.id,
                name: value.name,
                type: value.type,
                mpg: value.mpg,
                cargoLength: value.cargoLength,
                cargoWidth: value.cargoWidth,
                cargoHeight: value.cargoHeight,
                payloadLimit: value.payloadLimit,
                fullCargo: value.fullCargo,
                largeUpright: value.largeUpright,
                medium: value.medium,
                notes: value.notes,
              ),
            );
      }
      for (final value in model.yards) {
        await database
            .into(database.yards)
            .insert(
              YardRow(
                id: value.id,
                name: value.name,
                address: value.address,
                cityStateZip: value.cityStateZip,
                phone: value.phone,
                hours: value.hours,
                notes: value.notes,
                preferred: value.preferred,
              ),
            );
      }
      for (final value in model.yardPrices) {
        await database
            .into(database.yardPrices)
            .insert(
              YardPriceRow(
                id: value.id,
                yardId: value.yardId,
                material: value.material,
                price: value.price,
                unit: value.unit,
                updatedAt: value.updatedAt,
                notes: value.notes,
              ),
            );
      }
      for (final value in model.searchSources) {
        await database
            .into(database.searchSources)
            .insert(
              SearchSourceRow(
                id: value.id,
                name: value.name,
                type: value.type,
                enabled: value.enabled,
                defaultRadius: value.defaultRadius,
                supportsDirectLink: value.supportsDirectLink,
                supportsManualEntry: value.supportsManualEntry,
                supportsNotifications: value.supportsNotifications,
                notes: value.notes,
              ),
            );
      }
      for (final value in model.searchRules) {
        await database
            .into(database.searchRules)
            .insert(
              SearchRuleRow(
                id: value.id,
                name: value.name,
                keywords: value.keywords,
                excludedWords: value.excludedWords,
                maxRadius: value.maxRadius,
                notify: value.notify,
                enabled: value.enabled,
              ),
            );
        for (final sourceId in value.sourceIds) {
          await database
              .into(database.searchRuleSources)
              .insert(
                SearchRuleSourceRow(ruleId: value.id, sourceId: sourceId),
              );
        }
      }
      for (final value in model.templates) {
        await database
            .into(database.objectTemplates)
            .insert(
              ObjectTemplateRow(
                id: value.id,
                name: value.name,
                aliases: value.aliases,
                category: value.category,
                cargoDemand: value.cargoDemand.name,
                destination: value.destination.name,
                lowValue: value.lowValue,
                likelyValue: value.likelyValue,
                highValue: value.highValue,
                stripMinutes: value.stripMinutes,
                stripDifficulty: value.stripDifficulty,
                safetyNotes: value.safetyNotes,
                toolsNeeded: value.toolsNeeded,
                recoverableMaterials: value.recoverableMaterials,
                partOutNotes: value.partOutNotes,
                notes: value.notes,
              ),
            );
      }
      for (final value in model.items) {
        await database
            .into(database.scrapItems)
            .insert(
              ScrapItemRow(
                id: value.id,
                title: value.title,
                templateId: value.templateId,
                pickupAddress: value.pickupAddress,
                locationName: value.locationName,
                miles: value.miles,
                timeWindow: value.timeWindow,
                destination: value.destination.name,
                status: value.status.name,
                notes: value.notes,
                source: value.source,
                sourceId: value.sourceId,
                ruleMatch: value.ruleMatch,
                duplicateWarning: value.duplicateWarning,
              ),
            );
      }
      await database
          .into(database.runPlans)
          .insert(
            RunPlanRow(
              id: model.run.id,
              name: model.run.name,
              vehicleId: model.run.vehicleId,
              active: true,
            ),
          );
      for (var index = 0; index < model.run.itemIds.length; index++) {
        await database
            .into(database.runPlanItems)
            .insert(
              RunPlanItemRow(
                runPlanId: model.run.id,
                itemId: model.run.itemIds[index],
                stopOrder: index,
              ),
            );
      }
      for (final value in model.receipts) {
        await database
            .into(database.receipts)
            .insert(
              ReceiptRow(
                id: value.id,
                yardId: value.yardId,
                amount: value.amount,
                date: value.date,
                notes: value.notes,
              ),
            );
      }
      for (final value in model.photos) {
        await database
            .into(database.photoAttachments)
            .insert(
              PhotoAttachmentRow(
                id: value.id,
                ownerId: value.ownerId,
                ownerType: value.ownerType,
                localPath: value.localPath,
                caption: value.caption,
                createdAt: value.createdAt,
                hash: value.hash,
                ocrText: value.ocrText,
              ),
            );
      }

      final settings = model.notificationSettings;
      await database
          .into(database.notificationSettingsTable)
          .insert(
            NotificationSettingsRow(
              id: 1,
              notificationsEnabled: settings.notificationsEnabled,
              notifyNewMatches: settings.notifyNewMatches,
              notifyHighValueOnly: settings.notifyHighValueOnly,
              minimumValueThreshold: settings.minimumValueThreshold,
              quietHoursEnabled: settings.quietHoursEnabled,
              quietStart: settings.quietStart,
              quietEnd: settings.quietEnd,
              notifyDuplicates: settings.notifyDuplicates,
              notifyWorthwhileRoute: settings.notifyWorthwhileRoute,
            ),
          );
      final home = model.homeBase;
      await database
          .into(database.homeBaseSettingsTable)
          .insert(
            HomeBaseSettingsRow(
              id: home.id,
              label: home.label,
              address: home.address,
              cityStateZip: home.cityStateZip,
              defaultFuelPrice: home.defaultFuelPrice,
              notes: home.notes,
            ),
          );
    });
  }
}
