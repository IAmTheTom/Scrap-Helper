import '../../domain/enums/app_enums.dart';

final class ScrapCategory {
  const ScrapCategory({
    this.id,
    required this.name,
    this.description,
    this.isActive = true,
  });

  final int? id;
  final String name;
  final String? description;
  final bool isActive;

  factory ScrapCategory.fromMap(Map<String, Object?> map) {
    return ScrapCategory(
      id: map['id'] as int?,
      name: map['name'] as String,
      description: map['description'] as String?,
      isActive: (map['is_active'] as int? ?? 1) == 1,
    );
  }
}

final class Scrapyard {
  const Scrapyard({
    this.id,
    required this.name,
    this.location,
    this.notes,
    this.isActive = true,
  });

  final int? id;
  final String name;
  final String? location;
  final String? notes;
  final bool isActive;

  factory Scrapyard.fromMap(Map<String, Object?> map) {
    return Scrapyard(
      id: map['id'] as int?,
      name: map['name'] as String,
      location: map['location'] as String?,
      notes: map['notes'] as String?,
      isActive: (map['is_active'] as int? ?? 1) == 1,
    );
  }
}

final class YardPrice {
  const YardPrice({
    this.id,
    required this.scrapyardId,
    required this.categoryId,
    required this.yardCategoryName,
    required this.rateUnits,
    required this.rateUnit,
    required this.effectiveFrom,
  });

  final int? id;
  final int scrapyardId;
  final int categoryId;
  final String yardCategoryName;
  final int rateUnits;
  final PriceUnit rateUnit;
  final String effectiveFrom;

  factory YardPrice.fromMap(Map<String, Object?> map) {
    return YardPrice(
      id: map['id'] as int?,
      scrapyardId: map['scrapyard_id'] as int,
      categoryId: map['category_id'] as int,
      yardCategoryName: map['yard_category_name'] as String,
      rateUnits: map['rate_units'] as int,
      rateUnit: PriceUnit.values.firstWhere(
        (item) => item.dbValue == map['rate_unit'],
      ),
      effectiveFrom: map['effective_from'] as String,
    );
  }
}

final class ObjectTemplate {
  const ObjectTemplate({
    this.id,
    required this.name,
    this.subtype = '',
    this.description,
    required this.wholeWeightLowG,
    required this.wholeWeightTypicalG,
    required this.wholeWeightHighG,
    required this.confidence,
    this.safetyWarnings,
    this.preparationNotes,
  });

  final int? id;
  final String name;
  final String subtype;
  final String? description;
  final int wholeWeightLowG;
  final int wholeWeightTypicalG;
  final int wholeWeightHighG;
  final ConfidenceLevel confidence;
  final String? safetyWarnings;
  final String? preparationNotes;

  factory ObjectTemplate.fromMap(Map<String, Object?> map) {
    return ObjectTemplate(
      id: map['id'] as int?,
      name: map['name'] as String,
      subtype: map['subtype'] as String? ?? '',
      description: map['description'] as String?,
      wholeWeightLowG: map['whole_weight_low_g'] as int,
      wholeWeightTypicalG: map['whole_weight_typical_g'] as int,
      wholeWeightHighG: map['whole_weight_high_g'] as int,
      confidence: ConfidenceLevel.values.firstWhere(
        (item) => item.dbValue == map['weight_confidence'],
      ),
      safetyWarnings: map['safety_warnings'] as String?,
      preparationNotes: map['preparation_notes'] as String?,
    );
  }
}

final class RecoverableComponent {
  const RecoverableComponent({
    this.id,
    required this.objectTemplateId,
    required this.componentName,
    required this.categoryId,
    required this.recoveryLevel,
    required this.lowWeightG,
    required this.typicalWeightG,
    required this.highWeightG,
    required this.confidence,
  });

  final int? id;
  final int objectTemplateId;
  final String componentName;
  final int categoryId;
  final RecoveryLevel recoveryLevel;
  final int lowWeightG;
  final int typicalWeightG;
  final int highWeightG;
  final ConfidenceLevel confidence;

  factory RecoverableComponent.fromMap(Map<String, Object?> map) {
    return RecoverableComponent(
      id: map['id'] as int?,
      objectTemplateId: map['object_template_id'] as int,
      componentName: map['component_name'] as String,
      categoryId: map['category_id'] as int,
      recoveryLevel: RecoveryLevel.values.firstWhere(
        (item) => item.dbValue == map['recovery_level'],
      ),
      lowWeightG: map['low_weight_g'] as int,
      typicalWeightG: map['typical_weight_g'] as int,
      highWeightG: map['high_weight_g'] as int,
      confidence: ConfidenceLevel.values.firstWhere(
        (item) => item.dbValue == map['confidence'],
      ),
    );
  }
}
