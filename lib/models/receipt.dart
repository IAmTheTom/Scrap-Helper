part of '../main.dart';

class Receipt {
  Receipt({
    required this.id,
    required this.yardId,
    required this.amount,
    required this.date,
    required this.notes,
  });
  final String id;
  String yardId, notes;
  double amount;
  DateTime date;
}
