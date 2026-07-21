final class FinalizedLoadSummary {
  const FinalizedLoadSummary({
    required this.loadId,
    required this.scrapyardId,
    required this.date,
    required this.itemCount,
    required this.estimatedLowCents,
    required this.estimatedLikelyCents,
    required this.estimatedHighCents,
    required this.actualPaidCents,
    required this.receiptCount,
  });

  final int loadId;
  final int scrapyardId;
  final String date;
  final int itemCount;
  final int estimatedLowCents;
  final int estimatedLikelyCents;
  final int estimatedHighCents;
  final int actualPaidCents;
  final int receiptCount;

  factory FinalizedLoadSummary.fromMap(Map<String, Object?> map) {
    return FinalizedLoadSummary(
      loadId: map['load_id'] as int,
      scrapyardId: map['scrapyard_id'] as int,
      date: map['date'] as String,
      itemCount: (map['item_count'] as int?) ?? 0,
      estimatedLowCents: (map['payout_low_cents'] as int?) ?? 0,
      estimatedLikelyCents: (map['payout_likely_cents'] as int?) ?? 0,
      estimatedHighCents: (map['payout_high_cents'] as int?) ?? 0,
      actualPaidCents: (map['actual_paid_cents'] as int?) ?? 0,
      receiptCount: (map['receipt_count'] as int?) ?? 0,
    );
  }
}

final class ReceiptLineDraft {
  const ReceiptLineDraft({
    required this.categoryId,
    required this.yardCategoryName,
    required this.weightG,
    required this.sourceWeightValue,
    required this.sourceWeightUnit,
    required this.rateUnits,
    required this.rateUnit,
    required this.linePayoutCents,
    this.lineAdjustmentCents = 0,
    this.notes,
  });

  final int categoryId;
  final String yardCategoryName;
  final int weightG;
  final String sourceWeightValue;
  final String sourceWeightUnit;
  final int rateUnits;
  final String rateUnit;
  final int linePayoutCents;
  final int lineAdjustmentCents;
  final String? notes;
}
