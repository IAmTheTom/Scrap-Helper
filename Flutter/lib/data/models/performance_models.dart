final class LoadCostRecord {
  const LoadCostRecord({
    required this.loadId,
    required this.pickupMilesMilli,
    required this.fuelCostCents,
    required this.purchaseCostCents,
    required this.disposalCostCents,
    required this.tireRemovalCostCents,
    required this.otherCostCents,
    this.notes,
  });

  final int loadId;
  final int pickupMilesMilli;
  final int fuelCostCents;
  final int purchaseCostCents;
  final int disposalCostCents;
  final int tireRemovalCostCents;
  final int otherCostCents;
  final String? notes;

  int get totalCostCents =>
      fuelCostCents +
      purchaseCostCents +
      disposalCostCents +
      tireRemovalCostCents +
      otherCostCents;
}

final class LoadItemOutcomeDraft {
  const LoadItemOutcomeDraft({
    required this.loadObjectItemId,
    required this.completedQuantity,
    required this.processingMinutes,
    required this.estimatedLikelyCents,
    required this.allocatedActualPayoutCents,
    required this.directCostCents,
    this.notes,
  });

  final int loadObjectItemId;
  final int completedQuantity;
  final int processingMinutes;
  final int estimatedLikelyCents;
  final int allocatedActualPayoutCents;
  final int directCostCents;
  final String? notes;
}

final class FinalizedLoadItem {
  const FinalizedLoadItem({
    required this.id,
    required this.objectTemplateId,
    required this.objectName,
    required this.quantity,
    required this.recoveryLevel,
  });

  final int id;
  final int objectTemplateId;
  final String objectName;
  final int quantity;
  final String recoveryLevel;

  factory FinalizedLoadItem.fromMap(Map<String, Object?> map) {
    return FinalizedLoadItem(
      id: map['id'] as int,
      objectTemplateId: map['object_template_id'] as int,
      objectName: map['object_name'] as String,
      quantity: map['quantity'] as int,
      recoveryLevel: map['recovery_level'] as String,
    );
  }
}

final class ObjectPerformance {
  const ObjectPerformance({
    required this.objectTemplateId,
    required this.objectName,
    required this.sampleCount,
    required this.totalQuantity,
    required this.totalMinutes,
    required this.totalEstimatedCents,
    required this.totalActualCents,
    required this.totalDirectCostCents,
  });

  final int objectTemplateId;
  final String objectName;
  final int sampleCount;
  final int totalQuantity;
  final int totalMinutes;
  final int totalEstimatedCents;
  final int totalActualCents;
  final int totalDirectCostCents;

  int get totalNetCents => totalActualCents - totalDirectCostCents;

  int get averageNetPerItemCents =>
      totalQuantity == 0 ? 0 : totalNetCents ~/ totalQuantity;

  int get averageActualPerItemCents =>
      totalQuantity == 0 ? 0 : totalActualCents ~/ totalQuantity;

  int get averageMinutesPerItem =>
      totalQuantity == 0 ? 0 : totalMinutes ~/ totalQuantity;

  int get netPerHourCents =>
      totalMinutes == 0 ? 0 : (totalNetCents * 60) ~/ totalMinutes;

  int get estimateErrorBasisPoints {
    if (totalEstimatedCents == 0) return 0;
    final difference = (totalActualCents - totalEstimatedCents).abs();
    return (difference * 10000) ~/ totalEstimatedCents;
  }

  factory ObjectPerformance.fromMap(Map<String, Object?> map) {
    return ObjectPerformance(
      objectTemplateId: map['object_template_id'] as int,
      objectName: map['object_name'] as String,
      sampleCount: (map['sample_count'] as int?) ?? 0,
      totalQuantity: (map['total_quantity'] as int?) ?? 0,
      totalMinutes: (map['total_minutes'] as int?) ?? 0,
      totalEstimatedCents: (map['total_estimated_cents'] as int?) ?? 0,
      totalActualCents: (map['total_actual_cents'] as int?) ?? 0,
      totalDirectCostCents: (map['total_direct_cost_cents'] as int?) ?? 0,
    );
  }
}
