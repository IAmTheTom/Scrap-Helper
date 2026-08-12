part of '../main.dart';

class ScrapItem {
  ScrapItem({
    required this.id,
    required this.title,
    required this.templateId,
    required this.pickupAddress,
    required this.locationName,
    required this.miles,
    required this.timeWindow,
    required this.destination,
    required this.status,
    required this.notes,
    required this.source,
    this.sourceId,
    this.ruleMatch = 'Manual item',
    this.duplicateWarning = false,
  });
  final String id;
  String? sourceId;
  String title,
      templateId,
      pickupAddress,
      locationName,
      timeWindow,
      notes,
      source;
  String ruleMatch;
  double miles;
  Destination destination;
  ItemStatus status;
  bool duplicateWarning;
}
