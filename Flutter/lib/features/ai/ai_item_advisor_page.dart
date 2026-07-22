import 'package:flutter/material.dart';

import '../../ai/item_analysis_models.dart';
import '../../ai/item_analysis_service.dart';
import '../../ai/mock_item_analysis_provider.dart';

class AiItemAdvisorPage extends StatefulWidget {
  const AiItemAdvisorPage({super.key});

  @override
  State<AiItemAdvisorPage> createState() => _AiItemAdvisorPageState();
}

class _AiItemAdvisorPageState extends State<AiItemAdvisorPage> {
  final _description = TextEditingController();
  final _miles = TextEditingController();
  final _minutes = TextEditingController();

  bool _enableSimulatedAi = false;
  bool _working = false;
  ItemAnalysisResult? _result;

  @override
  void dispose() {
    _description.dispose();
    _miles.dispose();
    _minutes.dispose();
    super.dispose();
  }

  Future<void> _analyze() async {
    final description = _description.text.trim();
    if (description.isEmpty || _working) {
      if (description.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Describe the item first.')),
        );
      }
      return;
    }

    setState(() => _working = true);

    final service = ItemAnalysisService(
      provider: const MockItemAnalysisProvider(),
      allowAi: _enableSimulatedAi,
      allowNetwork: false,
    );

    final result = await service.analyze(
      ItemAnalysisRequest(
        description: description,
        roundTripMiles: double.tryParse(_miles.text.trim()),
        availableMinutes: int.tryParse(_minutes.text.trim()),
      ),
    );

    if (!mounted) return;
    setState(() {
      _result = result;
      _working = false;
    });
  }

  void _loadExample(String value) {
    _description.text = value;
    setState(() => _result = null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Item Advisor')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            color: Theme.of(context).colorScheme.primaryContainer,
            child: const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Phase 27 foundation: structured item analysis with privacy-first controls. '
                'The app uses deterministic scrap rules unless simulated AI is explicitly enabled.',
              ),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            key: const Key('ai_item_description'),
            controller: _description,
            maxLines: 3,
            decoration: const InputDecoration(
              labelText: 'Describe the object',
              hintText: 'Example: countertop microwave with intact power cord',
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _miles,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  decoration: const InputDecoration(
                    labelText: 'Round-trip miles',
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: TextField(
                  controller: _minutes,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Minutes available',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          SwitchListTile(
            key: const Key('simulated_ai_switch'),
            value: _enableSimulatedAi,
            onChanged: (value) => setState(() => _enableSimulatedAi = value),
            title: const Text('Use simulated AI'),
            subtitle: const Text(
              'Development-only provider. No image or text leaves this device.',
            ),
          ),
          Wrap(
            spacing: 8,
            children: [
              ActionChip(
                label: const Text('Microwave example'),
                onPressed: () =>
                    _loadExample('Countertop microwave with intact power cord'),
              ),
              ActionChip(
                label: const Text('Dryer example'),
                onPressed: () =>
                    _loadExample('Full-size electric clothes dryer'),
              ),
              ActionChip(
                label: const Text('Refrigerator example'),
                onPressed: () =>
                    _loadExample('Older refrigerator with compressor attached'),
              ),
            ],
          ),
          const SizedBox(height: 12),
          FilledButton.icon(
            key: const Key('analyze_item_button'),
            onPressed: _working ? null : _analyze,
            icon: _working
                ? const SizedBox.square(
                    dimension: 18,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Icon(Icons.auto_awesome),
            label: const Text('Analyze Item'),
          ),
          if (_result case final result?) ...[
            const SizedBox(height: 16),
            _AnalysisResultCard(result: result),
          ],
        ],
      ),
    );
  }
}

class _AnalysisResultCard extends StatelessWidget {
  const _AnalysisResultCard({required this.result});

  final ItemAnalysisResult result;

  @override
  Widget build(BuildContext context) {
    final confidence = (result.confidence * 100).round();

    return Card(
      key: const Key('ai_analysis_result'),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              result.objectName,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text('$confidence% confidence • ${result.providerName}'),
            const SizedBox(height: 12),
            _SectionTitle(
              icon: Icons.recommend,
              text: _recommendationLabel(result.recommendation),
            ),
            Text(
              '${result.estimatedProcessingMinutes} estimated processing min',
            ),
            const SizedBox(height: 12),
            const _SectionTitle(
              icon: Icons.recycling,
              text: 'Likely materials',
            ),
            for (final material in result.materials)
              Text(
                '• ${material.name}: ${(material.likelihood * 100).round()}%',
              ),
            const SizedBox(height: 12),
            const _SectionTitle(icon: Icons.warning_amber, text: 'Hazards'),
            for (final hazard in result.hazards) Text('• $hazard'),
            const SizedBox(height: 12),
            const _SectionTitle(icon: Icons.fact_check, text: 'Why'),
            for (final reason in result.reasoning) Text('• $reason'),
            const SizedBox(height: 12),
            Text(
              result.usedAi
                  ? 'AI suggestion — review before acting.'
                  : 'Deterministic estimate — no AI was used.',
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }

  static String _recommendationLabel(ItemActionRecommendation value) {
    return switch (value) {
      ItemActionRecommendation.take => 'Recommendation: Take it',
      ItemActionRecommendation.takeIfNearby => 'Recommendation: Take if nearby',
      ItemActionRecommendation.inspectFirst => 'Recommendation: Inspect first',
      ItemActionRecommendation.skip => 'Recommendation: Skip',
    };
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 20),
        const SizedBox(width: 8),
        Text(text, style: Theme.of(context).textTheme.titleMedium),
      ],
    );
  }
}
