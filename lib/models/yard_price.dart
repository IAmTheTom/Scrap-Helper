part of '../main.dart';

class YardPrice {
  YardPrice({
    required this.id,
    required this.yardId,
    required this.material,
    required this.price,
    required this.unit,
    required this.updatedAt,
    required this.notes,
  });
  final String id;
  String yardId, material, unit, notes;
  double price;
  DateTime updatedAt;
}
