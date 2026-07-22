import 'package:flutter_test/flutter_test.dart';
import 'package:scrap_helper/recognition/scrap_taxonomy.dart';
import 'package:scrap_helper/recognition/yard_category_mapper.dart';

void main() {
  const mapper = YardCategoryMapper();
  const definitions = [
    YardCategoryDefinition(
      yardId: 1,
      neutralGrade: NeutralScrapGrade.numberOneCopper,
      displayName: '#1 Copper',
      categoryId: 10,
    ),
    YardCategoryDefinition(
      yardId: 1,
      neutralGrade: NeutralScrapGrade.numberTwoCopper,
      displayName: '#2 Copper',
      categoryId: 11,
    ),
  ];

  test('maps neutral grade to yard-specific name', () {
    final result = mapper.map(
      yardId: 1,
      grade: NeutralScrapGrade.numberOneCopper,
      definitions: definitions,
    );
    expect(result, isNotNull);
    expect(result!.displayName, '#1 Copper');
    expect(result.isExact, isTrue);
  });

  test('uses fallback mapping for soldered copper tubing', () {
    final result = mapper.map(
      yardId: 1,
      grade: NeutralScrapGrade.copperTubingSoldered,
      definitions: definitions,
    );
    expect(result, isNotNull);
    expect(result!.displayName, '#2 Copper');
    expect(result.isExact, isFalse);
  });
}
