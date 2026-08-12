part of '../../main.dart';

class AssistantScreen extends StatefulWidget {
  const AssistantScreen({
    super.key,
    required this.model,
    required this.service,
    this.initialContextType = AssistantContextType.currentRun,
    this.initialOwnerId,
    this.initialPrompt,
  });

  final ScrapprModel model;
  final AssistantService service;
  final AssistantContextType initialContextType;
  final String? initialOwnerId, initialPrompt;

  @override
  State<AssistantScreen> createState() => _AssistantScreenState();
}

class _AssistantScreenState extends State<AssistantScreen> {
  final input = TextEditingController();
  late AssistantContextType contextType;
  AssistantContext? assistantContext;
  List<AssistantMessage> messages = const [];
  String? ownerId;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    contextType = widget.initialContextType;
    ownerId =
        widget.initialOwnerId ??
        (contextType == AssistantContextType.currentRun
            ? widget.model.run.id
            : null);
    input.text = widget.initialPrompt ?? '';
    unawaited(_loadContext());
  }

  @override
  void dispose() {
    input.dispose();
    super.dispose();
  }

  Future<void> _loadContext() async {
    setState(() => loading = true);
    final context = await widget.service.getOrCreateContext(
      contextType,
      ownerId: ownerId,
    );
    final loadedMessages = await widget.service.loadMessages(context);
    if (!mounted) return;
    setState(() {
      assistantContext = context;
      messages = loadedMessages;
      loading = false;
    });
  }

  Future<void> _selectType(AssistantContextType type) async {
    contextType = type;
    ownerId = _ownerOptions(type).firstOrNull?.$1;
    await _loadContext();
  }

  Future<void> _selectOwner(String? value) async {
    ownerId = value;
    await _loadContext();
  }

  Future<void> send([String? prompt]) async {
    final text = prompt ?? input.text.trim();
    final context = assistantContext;
    if (text.isEmpty || context == null || loading) return;
    input.clear();
    setState(() => loading = true);
    final stored = await widget.service.send(
      model: widget.model,
      context: context,
      prompt: text,
    );
    if (!mounted) return;
    setState(() {
      messages = [...messages, ...stored];
      loading = false;
    });
  }

  Future<void> _clearHistory() async {
    final context = assistantContext;
    if (context == null) return;
    await widget.service.clearHistory(context);
    if (!mounted) return;
    setState(() => messages = const []);
  }

  List<(String, String)> _ownerOptions(
    AssistantContextType type,
  ) => switch (type) {
    AssistantContextType.currentRun => [
      (widget.model.run.id, widget.model.run.name),
    ],
    AssistantContextType.inboxItem =>
      widget.model.leads.map((item) => (item.id, item.title)).toList(),
    AssistantContextType.runItem =>
      widget.model.runItems.map((item) => (item.id, item.title)).toList(),
    AssistantContextType.processingItem =>
      widget.model.processingItems
          .map((item) => (item.id, item.title))
          .toList(),
    AssistantContextType.objectTemplate =>
      widget.model.templates.map((item) => (item.id, item.name)).toList(),
    AssistantContextType.yard =>
      widget.model.yards.map((item) => (item.id, item.name)).toList(),
    AssistantContextType.vehicle =>
      widget.model.vehicles.map((item) => (item.id, item.name)).toList(),
    AssistantContextType.receipt =>
      widget.model.receipts
          .map(
            (item) => (
              item.id,
              '\$${item.amount.toStringAsFixed(2)} - ${item.date.toLocal()}',
            ),
          )
          .toList(),
    AssistantContextType.general => const [],
  };

  @override
  Widget build(BuildContext context) {
    final owners = _ownerOptions(contextType);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scrappr Assistant'),
        actions: [
          IconButton(
            tooltip: 'Clear history',
            onPressed: messages.isEmpty ? null : _clearHistory,
            icon: const Icon(Icons.delete_outline),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                DropdownButtonFormField<AssistantContextType>(
                  initialValue: contextType,
                  decoration: const InputDecoration(labelText: 'Context'),
                  items: AssistantContextType.values
                      .map(
                        (type) => DropdownMenuItem(
                          value: type,
                          child: Text(type.label),
                        ),
                      )
                      .toList(),
                  onChanged: loading
                      ? null
                      : (value) {
                          if (value != null) unawaited(_selectType(value));
                        },
                ),
                if (owners.isNotEmpty) ...[
                  const SizedBox(height: 8),
                  DropdownButtonFormField<String>(
                    initialValue: owners.any((item) => item.$1 == ownerId)
                        ? ownerId
                        : null,
                    decoration: const InputDecoration(
                      labelText: 'Related item',
                    ),
                    items: owners
                        .map(
                          (item) => DropdownMenuItem(
                            value: item.$1,
                            child: Text(item.$2),
                          ),
                        )
                        .toList(),
                    onChanged: loading
                        ? null
                        : (value) => unawaited(_selectOwner(value)),
                  ),
                ],
              ],
            ),
          ),
          Expanded(
            child: loading && messages.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: messages.length,
                    itemBuilder: (_, index) {
                      final message = messages[index];
                      final label = message.role == 'user'
                          ? 'You'
                          : 'Assistant';
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Text('$label: ${message.message}'),
                        ),
                      );
                    },
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: input,
                    onSubmitted: loading ? null : send,
                    decoration: const InputDecoration(
                      labelText: 'Ask about this work',
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton.filled(
                  onPressed: loading ? null : send,
                  icon: const Icon(Icons.send),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
