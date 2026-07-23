import 'package:flutter_test/flutter_test.dart';
import 'package:scrap_helper/recognition/runtime/classification_output_adapter.dart';

void main() {
  test('ranks real numeric model output', () {
    final scores = const ClassificationOutputAdapter().flattenAndRank(
      rawOutput: [
        [0.05, 0.81, 0.62],
      ],
      labels: ['unknown_scrap', 'yellow_brass', 'copper_tubing_clean'],
      minimumConfidence: 0.3,
    );

    expect(scores.map((score) => score.label), [
      'yellow_brass',
      'copper_tubing_clean',
    ]);
  });
}
