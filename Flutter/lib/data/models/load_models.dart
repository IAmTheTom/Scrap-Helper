import '../../domain/enums/app_enums.dart';

final class LoadRecord {
  const LoadRecord({
    required this.id,
    required this.scrapyardId,
    required this.date,
    required this.status,
    this.notes,
  });

  final int id;
  final int scrapyardId;
  final String date;
  final LoadStatus status;
  final String? notes;

  factory LoadRecord.fromMap(Map<String, Object?> map) {
    return LoadRecord(
      id: map['id'] as int,
      scrapyardId: map['scrapyard_id'] as int,
      date: map['date'] as String,
      status: LoadStatus.values.firstWhere(
        (item) => item.dbValue == map['status'],
      ),
      notes: map['notes'] as String?,
    );
  }
}

final class LoadObjectItem {
  const LoadObjectItem({
    required this.id,
    required this.loadId,
    required this.objectTemplateId,
    required this.quantity,
    required this.recoveryLevel,
    required this.objectName,
  });

  final int id;
  final int loadId;
  final int objectTemplateId;
  final int quantity;
  final RecoveryLevel recoveryLevel;
  final String objectName;

  factory LoadObjectItem.fromMap(Map<String, Object?> map) {
    return LoadObjectItem(
      id: map['id'] as int,
      loadId: map['load_id'] as int,
      objectTemplateId: map['object_template_id'] as int,
      quantity: map['quantity'] as int,
      recoveryLevel: RecoveryLevel.values.firstWhere(
        (item) => item.dbValue == map['recovery_level'],
      ),
      objectName: map['object_name'] as String,
    );
  }
}
