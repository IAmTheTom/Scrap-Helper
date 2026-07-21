import 'package:flutter_test/flutter_test.dart';
import 'package:scrap_helper/data/models/opportunity_models.dart';
import 'package:scrap_helper/domain/opportunities/opportunity_score.dart';

void main() {
  test('ranks strong nearby opportunity highly', () {
    const opportunity = PickupOpportunity(
      title: 'Aluminum wheels',
      sourceType: 'MARKETPLACE',
      distanceMilesMilli: 4000,
      pickupCostCents: 0,
      estimatedLowCents: 8000,
      estimatedLikelyCents: 10000,
      estimatedHighCents: 12000,
      estimatedMinutes: 30,
      spaceScore: 2,
      confidence: 'HIGH',
      status: 'SEEN',
    );

    final result = OpportunityScore.evaluate(opportunity);
    expect(result.score, greaterThanOrEqualTo(70));
    expect(result.title, 'High priority');
  });

  test('passes on negative expected net', () {
    const opportunity = PickupOpportunity(
      title: 'Cheap steel item',
      sourceType: 'MARKETPLACE',
      distanceMilesMilli: 30000,
      pickupCostCents: 1500,
      estimatedLowCents: 500,
      estimatedLikelyCents: 800,
      estimatedHighCents: 1000,
      estimatedMinutes: 60,
      spaceScore: 5,
      confidence: 'LOW',
      status: 'SEEN',
    );

    expect(OpportunityScore.evaluate(opportunity).title, 'Pass');
  });
}
