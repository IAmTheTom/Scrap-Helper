part of '../main.dart';

enum RouteStopType { home, pickup, yard }

class RouteStop {
  const RouteStop({
    required this.label,
    required this.address,
    required this.type,
    this.itemId,
    this.notes = '',
  });

  final String label;
  final String address;
  final RouteStopType type;
  final String? itemId;
  final String notes;
}

class RoutePlan {
  const RoutePlan({
    required this.stops,
    required this.mapsUrl,
    required this.summary,
    required this.message,
  });

  final List<RouteStop> stops;
  final String? mapsUrl;
  final String summary;
  final String message;

  bool get canHandOff => mapsUrl != null;
}
