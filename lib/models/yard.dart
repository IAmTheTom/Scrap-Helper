part of '../main.dart';

class Yard {
  Yard({
    required this.id,
    required this.name,
    required this.address,
    required this.cityStateZip,
    required this.phone,
    required this.hours,
    required this.notes,
    required this.preferred,
  });
  final String id;
  String name, address, cityStateZip, phone, hours, notes;
  bool preferred;
}
