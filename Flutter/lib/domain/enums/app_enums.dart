enum WeightDisplaySystem { usCustomary, metric }

enum SourceType {
  manual('MANUAL'),
  website('WEBSITE'),
  receipt('RECEIPT'),
  phone('PHONE'),
  research('RESEARCH'),
  measured('MEASURED'),
  seed('SEED'),
  importData('IMPORT');

  const SourceType(this.dbValue);
  final String dbValue;
}

enum WeightUnit {
  gram('GRAM', 1, 1),
  kilogram('KILOGRAM', 1000, 1),
  ounce('OUNCE', 28349523125, 1000000000),
  pound('POUND', 45359237, 100000),
  shortTon('SHORT_TON', 90718474, 100),
  metricTonne('METRIC_TONNE', 1000000, 1);

  const WeightUnit(this.dbValue, this.gramsNumerator, this.gramsDenominator);
  final String dbValue;
  final int gramsNumerator;
  final int gramsDenominator;
}

enum PriceUnit {
  perGram('PER_GRAM'),
  perKilogram('PER_KILOGRAM'),
  perOunce('PER_OUNCE'),
  perPound('PER_POUND'),
  perShortTon('PER_SHORT_TON'),
  perMetricTonne('PER_METRIC_TONNE'),
  perItem('PER_ITEM');

  const PriceUnit(this.dbValue);
  final String dbValue;
}

enum RecoveryLevel {
  sellWhole('SELL_WHOLE'),
  quick('QUICK'),
  standard('STANDARD'),
  deep('DEEP');

  const RecoveryLevel(this.dbValue);
  final String dbValue;
}

enum ConfidenceLevel {
  low('LOW'),
  medium('MEDIUM'),
  high('HIGH'),
  measured('MEASURED');

  const ConfidenceLevel(this.dbValue);
  final String dbValue;
}

enum YieldKind {
  wholeObject('WHOLE_OBJECT'),
  recoveredComponent('RECOVERED_COMPONENT'),
  remainder('REMAINDER');

  const YieldKind(this.dbValue);
  final String dbValue;
}

enum FeeScope {
  none('NONE'),
  perUnit('PER_UNIT'),
  perItem('PER_ITEM'),
  perLoad('PER_LOAD');

  const FeeScope(this.dbValue);
  final String dbValue;
}

enum LoadStatus {
  draft('DRAFT'),
  finalized('FINALIZED');

  const LoadStatus(this.dbValue);
  final String dbValue;
}

enum ReceiptStatus {
  active('ACTIVE'),
  voided('VOID');

  const ReceiptStatus(this.dbValue);
  final String dbValue;
}
