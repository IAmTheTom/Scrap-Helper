final class PickupOpportunity {
  const PickupOpportunity({
    this.id,
    this.objectTemplateId,
    required this.title,
    required this.sourceType,
    this.sourceReference,
    this.locationText,
    required this.distanceMilesMilli,
    required this.pickupCostCents,
    required this.estimatedLowCents,
    required this.estimatedLikelyCents,
    required this.estimatedHighCents,
    required this.estimatedMinutes,
    required this.spaceScore,
    required this.confidence,
    this.deadlineAt,
    required this.status,
    this.notes,
  });

  final int? id;
  final int? objectTemplateId;
  final String title;
  final String sourceType;
  final String? sourceReference;
  final String? locationText;
  final int distanceMilesMilli;
  final int pickupCostCents;
  final int estimatedLowCents;
  final int estimatedLikelyCents;
  final int estimatedHighCents;
  final int estimatedMinutes;
  final int spaceScore;
  final String confidence;
  final String? deadlineAt;
  final String status;
  final String? notes;

  factory PickupOpportunity.fromMap(Map<String, Object?> map) {
    return PickupOpportunity(
      id: map['id'] as int?,
      objectTemplateId: map['object_template_id'] as int?,
      title: map['title'] as String,
      sourceType: map['source_type'] as String,
      sourceReference: map['source_reference'] as String?,
      locationText: map['location_text'] as String?,
      distanceMilesMilli: map['distance_miles_milli'] as int,
      pickupCostCents: map['pickup_cost_cents'] as int,
      estimatedLowCents: map['estimated_low_cents'] as int,
      estimatedLikelyCents: map['estimated_likely_cents'] as int,
      estimatedHighCents: map['estimated_high_cents'] as int,
      estimatedMinutes: map['estimated_minutes'] as int,
      spaceScore: map['space_score'] as int,
      confidence: map['confidence'] as String,
      deadlineAt: map['deadline_at'] as String?,
      status: map['status'] as String,
      notes: map['notes'] as String?,
    );
  }
}

final class OpportunityDecision {
  const OpportunityDecision({
    required this.score,
    required this.title,
    required this.explanation,
    required this.estimatedNetCents,
  });

  final int score;
  final String title;
  final String explanation;
  final int estimatedNetCents;
}
