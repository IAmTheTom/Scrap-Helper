part of '../main.dart';

class SearchSource {
  SearchSource({
    required this.id,
    required this.name,
    required this.type,
    required this.enabled,
    required this.defaultRadius,
    required this.supportsDirectLink,
    required this.supportsManualEntry,
    required this.supportsNotifications,
    required this.notes,
  });

  final String id;
  final String name;
  final String type;
  bool enabled;
  double defaultRadius;
  final bool supportsDirectLink;
  final bool supportsManualEntry;
  final bool supportsNotifications;
  String notes;
}
