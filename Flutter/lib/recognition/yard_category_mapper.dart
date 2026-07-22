import 'scrap_taxonomy.dart';

final class YardCategoryDefinition {
  const YardCategoryDefinition({
    required this.yardId,
    required this.neutralGrade,
    required this.displayName,
    required this.categoryId,
  });
  final int yardId, categoryId;
  final NeutralScrapGrade neutralGrade;
  final String displayName;
}

final class YardCategoryMatch {
  const YardCategoryMatch({
    required this.neutralGrade,
    required this.displayName,
    required this.categoryId,
    required this.isExact,
  });
  final NeutralScrapGrade neutralGrade;
  final String displayName;
  final int categoryId;
  final bool isExact;
}

final class YardCategoryMapper {
  const YardCategoryMapper();

  YardCategoryMatch? map({
    required int yardId,
    required NeutralScrapGrade grade,
    required List<YardCategoryDefinition> definitions,
  }) {
    for (final definition in definitions) {
      if (definition.yardId == yardId && definition.neutralGrade == grade) {
        return YardCategoryMatch(
          neutralGrade: grade,
          displayName: definition.displayName,
          categoryId: definition.categoryId,
          isExact: true,
        );
      }
    }

    final fallback = switch (grade) {
      NeutralScrapGrade.copperTubingClean => NeutralScrapGrade.numberOneCopper,
      NeutralScrapGrade.copperTubingSoldered =>
        NeutralScrapGrade.numberTwoCopper,
      NeutralScrapGrade.yellowBrass ||
      NeutralScrapGrade.redBrass => NeutralScrapGrade.dirtyBrass,
      NeutralScrapGrade.paintedAluminumExtrusion =>
        NeutralScrapGrade.mixedMaterial,
      _ => null,
    };

    if (fallback == null) return null;

    for (final definition in definitions) {
      if (definition.yardId == yardId && definition.neutralGrade == fallback) {
        return YardCategoryMatch(
          neutralGrade: fallback,
          displayName: definition.displayName,
          categoryId: definition.categoryId,
          isExact: false,
        );
      }
    }
    return null;
  }
}
