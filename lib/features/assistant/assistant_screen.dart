part of '../../main.dart';

class AssistantScreen extends StatefulWidget {
  const AssistantScreen({super.key, required this.model});
  final ScrapprModel model;
  @override
  State<AssistantScreen> createState() => _AssistantScreenState();
}

class _AssistantScreenState extends State<AssistantScreen> {
  static const assistantService = AssistantService();
  final input = TextEditingController();
  final messages = <String>[
    'Scrappr Assistant is ready. No AI model is connected. Responses are '
        'deterministic/rule-engine placeholders.',
  ];
  String contextChip = 'Current Run';
  void send([String? prompt]) {
    final text = prompt ?? input.text.trim();
    if (text.isEmpty) return;
    setState(() {
      messages.add('You: $text');
      final response = assistantService.respond(
        model: widget.model,
        context: AssistantContext(currentScreen: contextChip),
      );
      messages.add('Assistant: $response');
      input.clear();
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Scrappr Assistant')),
    body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Wrap(
            spacing: 8,
            children:
                [
                      'Current Run',
                      'Selected Item',
                      'Object Library',
                      'Yard Prices',
                    ]
                    .map(
                      (label) => ChoiceChip(
                        label: Text(label),
                        selected: contextChip == label,
                        onSelected: (_) => setState(() => contextChip = label),
                      ),
                    )
                    .toList(),
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: messages.length,
            itemBuilder: (_, i) => Card(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(messages[i]),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: input,
                  onSubmitted: send,
                  decoration: const InputDecoration(
                    labelText: 'Ask about this work',
                  ),
                ),
              ),
              const SizedBox(width: 8),
              IconButton.filled(onPressed: send, icon: const Icon(Icons.send)),
            ],
          ),
        ),
      ],
    ),
  );
}
