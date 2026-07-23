import 'dart:io';

import 'package:flutter/material.dart';

import '../../ai/item_analysis_models.dart';
import '../../ai/item_analysis_service.dart';
import '../../ai/mock_item_analysis_provider.dart';
import '../../recognition/runtime/local_classification_recognition_service.dart';
import '../../services/item_image_service.dart';
import '../recognition/recognition_review_page.dart';

class AiItemAdvisorPage extends StatefulWidget {
  const AiItemAdvisorPage({super.key});

  @override
  State<AiItemAdvisorPage> createState() => _AiItemAdvisorPageState();
}

class _AiItemAdvisorPageState extends State<AiItemAdvisorPage> {
  final _description = TextEditingController();
  final _miles = TextEditingController();
  final _minutes = TextEditingController();
  final _images = ItemImageService();
  final _localRecognition = LocalClassificationRecognitionService();

  bool _working = false;
  String? _imagePath;
  String? _localModelStatus;
  ItemAnalysisResult? _result;

  @override
  void dispose() {
    _description.dispose();
    _miles.dispose();
    _minutes.dispose();
    super.dispose();
  }

  Future<void> _chooseImage() async {
    final path = await _images.chooseFromGallery();
    if (!mounted || path == null) return;

    setState(() {
      _imagePath = path;
      _result = null;
      _localModelStatus = null;
    });
  }

  Future<void> _takePhoto() async {
    final path = await _images.takePhoto();
    if (!mounted || path == null) return;

    setState(() {
      _imagePath = path;
      _result = null;
      _localModelStatus = null;
    });
  }

  Future<void> _removeImage() async {
    final current = _imagePath;

    setState(() {
      _imagePath = null;
      _result = null;
      _localModelStatus = null;
    });

    await _images.deleteLocalImage(current);
  }

  Future<void> _analyze() async {
    final description = _description.text.trim();
    final imagePath = _imagePath;

    if (description.isEmpty && imagePath == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Add a photo or describe the item first.'),
        ),
      );
      return;
    }

    if (_working) return;
    setState(() => _working = true);

    if (imagePath != null) {
      final attempt = await _localRecognition.analyze(imagePath: imagePath);

      if (!mounted) return;

      setState(() => _localModelStatus = attempt.message);

      if (attempt.result != null) {
        setState(() => _working = false);

        await Navigator.push<void>(
          context,
          MaterialPageRoute<void>(
            builder: (_) => RecognitionReviewPage(
              imagePath: imagePath,
              result: attempt.result!,
            ),
          ),
        );
        return;
      }
    }

    final service = ItemAnalysisService(
      provider: const MockItemAnalysisProvider(),
      allowAi: false,
      allowNetwork: false,
      allowImages: false,
    );

    final result = await service.analyze(
      ItemAnalysisRequest(
        description: description,
        imagePath: imagePath,
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
                'Scrap Helper first attempts a locally installed TFLite model. '
                'When no compatible model is installed, it falls back to '
                'deterministic text rules. Nothing is uploaded.',
              ),
            ),
          ),
          const SizedBox(height: 12),
          _ImageInputCard(
            imagePath: _imagePath,
            supportsCamera: _images.supportsCamera,
            onChoose: _chooseImage,
            onCamera: _takePhoto,
            onRemove: _removeImage,
          ),
          if (_localModelStatus case final status?) ...[
            const SizedBox(height: 8),
            Card(
              key: const Key('local_model_attempt_status'),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(status),
              ),
            ),
          ],
          const SizedBox(height: 12),
          TextField(
            key: const Key('ai_item_description'),
            controller: _description,
            maxLines: 3,
            decoration: const InputDecoration(
              labelText: 'Describe the object',
              hintText: 'Optional when a local visual model is installed',
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
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              ActionChip(
                label: const Text('Microwave example'),
                onPressed: () =>
                    _loadExample('Countertop microwave with intact power cord'),
              ),
              ActionChip(
                label: const Text('Brass fitting example'),
                onPressed: () => _loadExample('Yellow metal plumbing fitting'),
              ),
              ActionChip(
                label: const Text('Copper tubing example'),
                onPressed: () =>
                    _loadExample('Copper tubing with visible soldered joints'),
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
                : const Icon(Icons.memory),
            label: const Text('Analyze Offline'),
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

class _ImageInputCard extends StatelessWidget {
  const _ImageInputCard({
    required this.imagePath,
    required this.supportsCamera,
    required this.onChoose,
    required this.onCamera,
    required this.onRemove,
  });

  final String? imagePath;
  final bool supportsCamera;
  final VoidCallback onChoose;
  final VoidCallback onCamera;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    final path = imagePath;

    return Card(
      key: const Key('item_image_input'),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            if (path == null)
              const SizedBox(
                height: 150,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.add_a_photo_outlined, size: 44),
                      SizedBox(height: 8),
                      Text('No item photo selected'),
                    ],
                  ),
                ),
              )
            else
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.file(
                  File(path),
                  key: const Key('item_image_preview'),
                  height: 240,
                  width: double.infinity,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) => const SizedBox(
                    height: 160,
                    child: Center(child: Text('Could not display image')),
                  ),
                ),
              ),
            const SizedBox(height: 8),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 8,
              runSpacing: 8,
              children: [
                OutlinedButton.icon(
                  key: const Key('choose_item_photo'),
                  onPressed: onChoose,
                  icon: const Icon(Icons.photo_library_outlined),
                  label: Text(path == null ? 'Choose Photo' : 'Replace Photo'),
                ),
                if (supportsCamera)
                  OutlinedButton.icon(
                    key: const Key('take_item_photo'),
                    onPressed: onCamera,
                    icon: const Icon(Icons.camera_alt_outlined),
                    label: const Text('Take Photo'),
                  ),
                if (path != null)
                  TextButton.icon(
                    key: const Key('remove_item_photo'),
                    onPressed: onRemove,
                    icon: const Icon(Icons.delete_outline),
                    label: const Text('Remove'),
                  ),
              ],
            ),
          ],
        ),
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
            Text(
              _recommendationLabel(result.recommendation),
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              '${result.estimatedProcessingMinutes} '
              'estimated processing min',
            ),
            const SizedBox(height: 12),
            Text(
              'Likely materials',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            for (final material in result.materials)
              Text(
                '• ${material.name}: '
                '${(material.likelihood * 100).round()}%',
              ),
            const SizedBox(height: 12),
            Text('Hazards', style: Theme.of(context).textTheme.titleMedium),
            for (final hazard in result.hazards) Text('• $hazard'),
            const SizedBox(height: 12),
            const Text(
              'Deterministic estimate — no visual model result was used.',
              style: TextStyle(fontWeight: FontWeight.w700),
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
