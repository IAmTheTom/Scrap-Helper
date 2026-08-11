part of '../main.dart';

class ObjectTemplate {
  ObjectTemplate({
    required this.id,
    required this.name,
    required this.aliases,
    required this.category,
    required this.cargoDemand,
    required this.destination,
    required this.lowValue,
    required this.likelyValue,
    required this.highValue,
    required this.stripMinutes,
    required this.stripDifficulty,
    required this.safetyNotes,
    required this.toolsNeeded,
    required this.recoverableMaterials,
    required this.partOutNotes,
    required this.notes,
  });
  final String id;
  String name,
      aliases,
      category,
      safetyNotes,
      toolsNeeded,
      recoverableMaterials,
      partOutNotes,
      notes;
  CargoDemand cargoDemand;
  Destination destination;
  double lowValue, likelyValue, highValue;
  int stripMinutes, stripDifficulty;
}
