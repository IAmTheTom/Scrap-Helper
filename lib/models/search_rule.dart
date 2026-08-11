part of '../main.dart';

class SearchRule {
  SearchRule({
    required this.id,
    required this.name,
    required this.keywords,
    required this.excludedWords,
    required this.maxRadius,
    required this.source,
    required this.notify,
    required this.enabled,
  });
  final String id;
  String name, keywords, excludedWords, source;
  double maxRadius;
  bool notify, enabled;
}
