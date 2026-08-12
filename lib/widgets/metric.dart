part of '../main.dart';

class Metric extends StatelessWidget {
  const Metric(this.label, this.value, {super.key, this.detail});
  final String label, value;
  final String? detail;
  @override
  Widget build(BuildContext context) => Card(
    child: Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(label, style: Theme.of(context).textTheme.labelLarge),
          const SizedBox(height: 4),
          Text(value, style: Theme.of(context).textTheme.headlineSmall),
          if (detail != null)
            Flexible(child: Text(detail!, overflow: TextOverflow.ellipsis)),
        ],
      ),
    ),
  );
}

void openAssistant(
  BuildContext context,
  ScrapprModel model, {
  AssistantContextType contextType = AssistantContextType.currentRun,
  String? ownerId,
  String? prompt,
}) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (_) => AssistantScreen(
      model: model,
      service: model.assistantService!,
      initialContextType: contextType,
      initialOwnerId: ownerId,
      initialPrompt: prompt,
    ),
  ),
);
