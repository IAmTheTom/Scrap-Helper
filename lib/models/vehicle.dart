part of '../main.dart';

class Vehicle {
  Vehicle({
    required this.id,
    required this.name,
    required this.type,
    required this.mpg,
    required this.cargoLength,
    required this.cargoWidth,
    required this.cargoHeight,
    required this.payloadLimit,
    required this.fullCargo,
    required this.largeUpright,
    required this.medium,
    required this.notes,
  });
  final String id;
  String name, type, notes;
  double mpg, cargoLength, cargoWidth, cargoHeight, payloadLimit;
  int fullCargo, largeUpright, medium;
}
