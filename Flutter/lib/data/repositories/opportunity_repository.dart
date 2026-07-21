import 'package:sqflite/sqflite.dart';

import '../database/app_database.dart';
import '../models/opportunity_models.dart';

final class OpportunityRepository {
  OpportunityRepository([this._database]);

  final Database? _database;

  Future<Database> get _db async => _database ?? await AppDatabase.instance;

  Future<List<PickupOpportunity>> getActive() async {
    final db = await _db;
    final rows = await db.query(
      'pickup_opportunities',
      where: "status IN ('SEEN','SCHEDULED')",
      orderBy: 'deadline_at IS NULL, deadline_at, updated_at DESC',
    );
    return rows.map(PickupOpportunity.fromMap).toList();
  }

  Future<int> save(PickupOpportunity opportunity) async {
    final db = await _db;
    final now = DateTime.now().toUtc().toIso8601String();
    final values = <String, Object?>{
      'object_template_id': opportunity.objectTemplateId,
      'title': opportunity.title,
      'source_type': opportunity.sourceType,
      'source_reference': opportunity.sourceReference,
      'location_text': opportunity.locationText,
      'distance_miles_milli': opportunity.distanceMilesMilli,
      'pickup_cost_cents': opportunity.pickupCostCents,
      'estimated_low_cents': opportunity.estimatedLowCents,
      'estimated_likely_cents': opportunity.estimatedLikelyCents,
      'estimated_high_cents': opportunity.estimatedHighCents,
      'estimated_minutes': opportunity.estimatedMinutes,
      'space_score': opportunity.spaceScore,
      'confidence': opportunity.confidence,
      'deadline_at': opportunity.deadlineAt,
      'status': opportunity.status,
      'notes': opportunity.notes,
      'updated_at': now,
    };

    if (opportunity.id == null) {
      values['created_at'] = now;
      return db.insert('pickup_opportunities', values);
    }

    await db.update(
      'pickup_opportunities',
      values,
      where: 'id = ?',
      whereArgs: <Object?>[opportunity.id],
    );
    return opportunity.id!;
  }

  Future<void> setStatus(int id, String status) async {
    final db = await _db;
    await db.update(
      'pickup_opportunities',
      <String, Object?>{
        'status': status,
        'updated_at': DateTime.now().toUtc().toIso8601String(),
      },
      where: 'id = ?',
      whereArgs: <Object?>[id],
    );
  }
}
