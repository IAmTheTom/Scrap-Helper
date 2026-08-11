part of '../main.dart';

class RunPlan {
  RunPlan({
    required this.id,
    required this.name,
    required this.vehicleId,
    required this.itemIds,
  });
  final String id;
  String name, vehicleId;
  final List<String> itemIds;
}
