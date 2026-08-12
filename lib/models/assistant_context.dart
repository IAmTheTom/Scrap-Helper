part of '../main.dart';

enum AssistantContextType {
  general('general', 'General'),
  currentRun('current_run', 'Current run'),
  inboxItem('inbox_item', 'Inbox item'),
  runItem('run_item', 'Run item'),
  processingItem('processing_item', 'Processing item'),
  objectTemplate('object_template', 'Object template'),
  yard('yard', 'Yard'),
  vehicle('vehicle', 'Vehicle'),
  receipt('receipt', 'Receipt');

  const AssistantContextType(this.storageValue, this.label);
  final String storageValue;
  final String label;

  static AssistantContextType fromStorage(String value) => values.firstWhere(
    (type) => type.storageValue == value,
    orElse: () => AssistantContextType.general,
  );
}

class AssistantContext {
  const AssistantContext({this.id, required this.type, this.ownerId});

  final int? id;
  final AssistantContextType type;
  final String? ownerId;
}

class AssistantMessage {
  const AssistantMessage({
    required this.id,
    required this.contextId,
    required this.role,
    required this.message,
    required this.createdAt,
  });

  final int id;
  final int contextId;
  final String role;
  final String message;
  final DateTime createdAt;
}
