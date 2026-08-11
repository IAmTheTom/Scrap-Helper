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
    this.duplicateWarning = false,
  });
  final String id;
  String title,
      templateId,
      pickupAddress,
      locationName,
      timeWindow,
      notes,
      source;
  double miles;
  Destination destination;
  ItemStatus status;
  bool duplicateWarning;
}
