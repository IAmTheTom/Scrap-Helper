part of '../main.dart';

class AssistantService {
  const AssistantService();

  String respond({
    required ScrapprModel model,
    required AssistantContext context,
  }) {
    final fit = model.fitsVehicle
        ? 'fits the selected vehicle'
        : 'should be split for vehicle fit';
    return 'Based on ${context.currentScreen} rule-engine data, the current '
        'run is worth about \$${model.runValue.toStringAsFixed(0)} and $fit. '
        'No AI model is connected. Responses are deterministic/rule-engine '
        'placeholders.';
  }
}
