part of '../main.dart';

class AssistantContext {
  const AssistantContext({
    required this.currentScreen,
    this.selectedItemId,
    this.selectedTemplateId,
    this.selectedRunId,
    this.selectedYardId,
    this.selectedReceiptId,
  });

  final String currentScreen;
  final String? selectedItemId;
  final String? selectedTemplateId;
  final String? selectedRunId;
  final String? selectedYardId;
  final String? selectedReceiptId;
}
