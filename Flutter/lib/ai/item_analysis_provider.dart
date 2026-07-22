import 'item_analysis_models.dart';

abstract interface class ItemAnalysisProvider {
  String get name;

  bool get requiresNetwork;

  Future<ItemAnalysisResult> analyze(ItemAnalysisRequest request);
}
