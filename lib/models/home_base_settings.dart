part of '../main.dart';

class HomeBaseSettings {
  HomeBaseSettings({
    required this.id,
    required this.label,
    required this.address,
    required this.cityStateZip,
    required this.defaultFuelPrice,
    required this.notes,
  });

  final String id;
  String label;
  String address;
  String cityStateZip;
  double defaultFuelPrice;
  String notes;
}
