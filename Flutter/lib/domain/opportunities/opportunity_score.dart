import '../../data/models/opportunity_models.dart';

abstract final class OpportunityScore {
  static OpportunityDecision evaluate(PickupOpportunity opportunity) {
    final travelCostCents = _estimatedTravelCost(
      opportunity.distanceMilesMilli,
    );
    final estimatedNet =
        opportunity.estimatedLikelyCents -
        opportunity.pickupCostCents -
        travelCostCents;

    var score = 50;

    score += _clamp(estimatedNet ~/ 200, -25, 25);

    if (opportunity.estimatedMinutes > 0) {
      final netPerHour = (estimatedNet * 60) ~/ opportunity.estimatedMinutes;
      score += _clamp((netPerHour - 1500) ~/ 250, -15, 15);
    }

    score -= (opportunity.spaceScore - 1) * 4;
    score -= _clamp(opportunity.distanceMilesMilli ~/ 5000, 0, 12);

    score += switch (opportunity.confidence) {
      'MEASURED' => 8,
      'HIGH' => 5,
      'MEDIUM' => 2,
      _ => -3,
    };

    score = _clamp(score, 0, 100);

    if (estimatedNet <= 0 || score < 30) {
      return OpportunityDecision(
        score: score,
        title: 'Pass',
        explanation:
            'Expected net return is too low after pickup cost, estimated travel, time, and space.',
        estimatedNetCents: estimatedNet,
      );
    }

    if (score < 50) {
      return OpportunityDecision(
        score: score,
        title: 'Bundle only',
        explanation:
            'Consider it only when already nearby or when it fills unused load space.',
        estimatedNetCents: estimatedNet,
      );
    }

    if (score < 70) {
      return OpportunityDecision(
        score: score,
        title: 'Pick up selectively',
        explanation:
            'Potentially worthwhile, but condition, subtype, distance, and available capacity matter.',
        estimatedNetCents: estimatedNet,
      );
    }

    return OpportunityDecision(
      score: score,
      title: 'High priority',
      explanation:
          'Strong estimated net return relative to time, travel, confidence, and space.',
      estimatedNetCents: estimatedNet,
    );
  }

  static int _estimatedTravelCost(int milesMilli) {
    // Simple local planning assumption: $0.30 per mile.
    return (milesMilli * 30) ~/ 1000;
  }

  static int _clamp(int value, int minimum, int maximum) {
    if (value < minimum) return minimum;
    if (value > maximum) return maximum;
    return value;
  }
}
