final class StorageLocation {
  const StorageLocation({
    this.id,
    required this.name,
    this.description,
    required this.capacityScore,
    this.isActive = true,
  });

  final int? id;
  final String name;
  final String? description;
  final int capacityScore;
  final bool isActive;

  factory StorageLocation.fromMap(Map<String, Object?> map) {
    return StorageLocation(
      id: map['id'] as int?,
      name: map['name'] as String,
      description: map['description'] as String?,
      capacityScore: map['capacity_score'] as int,
      isActive: (map['is_active'] as int) == 1,
    );
  }
}

final class StorageItem {
  const StorageItem({
    this.id,
    required this.storageLocationId,
    this.objectTemplateId,
    required this.label,
    required this.quantity,
    required this.estimatedValueCents,
    required this.estimatedProcessingMinutes,
    required this.priority,
    required this.status,
    required this.acquiredAt,
    this.notes,
  });

  final int? id;
  final int storageLocationId;
  final int? objectTemplateId;
  final String label;
  final int quantity;
  final int estimatedValueCents;
  final int estimatedProcessingMinutes;
  final int priority;
  final String status;
  final String acquiredAt;
  final String? notes;

  factory StorageItem.fromMap(Map<String, Object?> map) {
    return StorageItem(
      id: map['id'] as int?,
      storageLocationId: map['storage_location_id'] as int,
      objectTemplateId: map['object_template_id'] as int?,
      label: map['label'] as String,
      quantity: map['quantity'] as int,
      estimatedValueCents: map['estimated_value_cents'] as int,
      estimatedProcessingMinutes: map['estimated_processing_minutes'] as int,
      priority: map['priority'] as int,
      status: map['status'] as String,
      acquiredAt: map['acquired_at'] as String,
      notes: map['notes'] as String?,
    );
  }
}

final class StorageSummary {
  const StorageSummary({
    required this.location,
    required this.waitingCount,
    required this.estimatedValueCents,
    required this.processingMinutes,
  });

  final StorageLocation location;
  final int waitingCount;
  final int estimatedValueCents;
  final int processingMinutes;
}
