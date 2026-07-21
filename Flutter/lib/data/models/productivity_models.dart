final class DashboardSummary {
  const DashboardSummary({
    required this.activeOpportunities,
    required this.storedItemCount,
    required this.storedValueCents,
    required this.draftLoadItemCount,
    required this.finalizedLoadCount,
    required this.lifetimeActualCents,
    required this.lifetimeCostCents,
    required this.monthActualCents,
    required this.monthCostCents,
    required this.topRecommendation,
  });

  final int activeOpportunities;
  final int storedItemCount;
  final int storedValueCents;
  final int draftLoadItemCount;
  final int finalizedLoadCount;
  final int lifetimeActualCents;
  final int lifetimeCostCents;
  final int monthActualCents;
  final int monthCostCents;
  final String? topRecommendation;

  int get lifetimeNetCents => lifetimeActualCents - lifetimeCostCents;
  int get monthNetCents => monthActualCents - monthCostCents;
}

final class PeriodReport {
  const PeriodReport({
    required this.label,
    required this.grossCents,
    required this.costCents,
    required this.processingMinutes,
    required this.pickupMilesMilli,
    required this.loadCount,
    required this.receiptCount,
    required this.estimatedLikelyCents,
  });

  final String label;
  final int grossCents;
  final int costCents;
  final int processingMinutes;
  final int pickupMilesMilli;
  final int loadCount;
  final int receiptCount;
  final int estimatedLikelyCents;

  int get netCents => grossCents - costCents;
  int get netPerHourCents =>
      processingMinutes == 0 ? 0 : (netCents * 60) ~/ processingMinutes;
  int get netPerMileCents =>
      pickupMilesMilli == 0 ? 0 : (netCents * 1000) ~/ pickupMilesMilli;
  int get averageLoadCents => loadCount == 0 ? 0 : netCents ~/ loadCount;
  int get estimateErrorBasisPoints {
    if (estimatedLikelyCents == 0) return 0;
    return ((grossCents - estimatedLikelyCents).abs() * 10000) ~/
        estimatedLikelyCents;
  }
}

final class SearchResult {
  const SearchResult({
    required this.kind,
    required this.title,
    required this.subtitle,
    required this.referenceId,
  });

  final String kind;
  final String title;
  final String subtitle;
  final int referenceId;
}

final class AppPreferences {
  const AppPreferences({
    required this.weightDisplaySystem,
    required this.themeMode,
    required this.travelCostCentsPerMile,
    required this.defaultRecoveryLevel,
    required this.currencyCode,
  });

  final String weightDisplaySystem;
  final String themeMode;
  final int travelCostCentsPerMile;
  final String defaultRecoveryLevel;
  final String currencyCode;
}
