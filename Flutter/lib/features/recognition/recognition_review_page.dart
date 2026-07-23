import 'dart:io';

import 'package:flutter/material.dart';

import '../../recognition/recognition_models.dart';

class RecognitionReviewPage extends StatefulWidget {
  const RecognitionReviewPage({
    super.key,
    required this.imagePath,
    required this.result,
  });

  final String imagePath;
  final RecognitionSessionResult result;

  @override
  State<RecognitionReviewPage> createState() => _RecognitionReviewPageState();
}

class _RecognitionReviewPageState extends State<RecognitionReviewPage> {
  String? _selectedDetectionId;

  @override
  void initState() {
    super.initState();

    if (widget.result.detections.isNotEmpty) {
      _selectedDetectionId = widget.result.detections.first.detectionId;
    }
  }

  RecognitionDetection? get _selectedDetection {
    for (final detection in widget.result.detections) {
      if (detection.detectionId == _selectedDetectionId) {
        return detection;
      }
    }

    return null;
  }

  void _selectDetection(String? detectionId) {
    setState(() {
      _selectedDetectionId = detectionId;
    });
  }

  @override
  Widget build(BuildContext context) {
    final detections = widget.result.detections;

    return Scaffold(
      appBar: AppBar(title: const Text('Review Identification')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          if (!widget.result.quality.isUsable)
            Card(
              color: Theme.of(context).colorScheme.errorContainer,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  widget.result.quality.retakeGuidance ?? 'Retake the photo.',
                ),
              ),
            )
          else ...[
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.file(
                File(widget.imagePath),
                height: 260,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return const SizedBox(
                    height: 160,
                    child: Center(
                      child: Text('Image preview unavailable in this test.'),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 12),

            if (detections.isEmpty)
              const Text('No supported scrap item detected.'),

            if (detections.isNotEmpty)
              RadioGroup<String>(
                groupValue: _selectedDetectionId,
                onChanged: _selectDetection,
                child: Column(
                  children: [
                    for (final detection in detections)
                      RadioListTile<String>(
                        value: detection.detectionId,
                        title: Text(detection.topCandidate?.label ?? 'Unknown'),
                        subtitle: Text(
                          '${((detection.topCandidate?.confidence ?? 0) * 100).round()}% confidence',
                        ),
                      ),
                  ],
                ),
              ),

            if (_selectedDetection case final detection?)
              _DetectionDetails(detection: detection),

            if (widget.result.questions.isNotEmpty)
              _ClarificationCard(question: widget.result.questions.first),

            const SizedBox(height: 12),

            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                FilledButton.icon(
                  onPressed: () {
                    Navigator.pop(context, 'object');
                  },
                  icon: const Icon(Icons.inventory_2),
                  label: const Text('Add to Object Library'),
                ),
                OutlinedButton.icon(
                  onPressed: () {
                    Navigator.pop(context, 'load');
                  },
                  icon: const Icon(Icons.local_shipping),
                  label: const Text('Add to Load'),
                ),
                OutlinedButton.icon(
                  onPressed: () {
                    Navigator.pop(context, 'storage');
                  },
                  icon: const Icon(Icons.warehouse),
                  label: const Text('Add to Storage'),
                ),
                TextButton.icon(
                  onPressed: () {
                    Navigator.pop(context, 'correct');
                  },
                  icon: const Icon(Icons.edit),
                  label: const Text('Correct Result'),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

class _DetectionDetails extends StatelessWidget {
  const _DetectionDetails({required this.detection});

  final RecognitionDetection detection;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Top candidates',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            for (final candidate in detection.candidates.take(3))
              Text(
                '• ${candidate.label}: '
                '${(candidate.confidence * 100).round()}%',
              ),
            if (detection.hazards.isNotEmpty) ...[
              const SizedBox(height: 8),
              Text(
                'Safety flags',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              for (final hazard in detection.hazards) Text('• ${hazard.name}'),
            ],
          ],
        ),
      ),
    );
  }
}

class _ClarificationCard extends StatelessWidget {
  const _ClarificationCard({required this.question});

  final ClarificationQuestion question;

  @override
  Widget build(BuildContext context) {
    return Card(
      key: const Key('adaptive_clarification_card'),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              question.prompt,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (final option in question.options)
                  OutlinedButton(onPressed: () {}, child: Text(option.label)),
                if (question.allowUnknown)
                  TextButton(onPressed: () {}, child: const Text("Can't tell")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
