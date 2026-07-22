import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'recognition_models.dart';

final class CorrectionLogService {
  const CorrectionLogService();

  Future<File> append(RecognitionCorrection correction) async {
    final directory = await getApplicationSupportDirectory();
    final file = File(p.join(directory.path, 'recognition_corrections.jsonl'));
    await file.parent.create(recursive: true);

    final record = <String, Object?>{
      'created_at': correction.createdAt.toUtc().toIso8601String(),
      'image_path': correction.imagePath,
      'detection_id': correction.detectionId,
      'original_label': correction.originalLabel,
      'original_confidence': correction.originalConfidence,
      'corrected_label': correction.correctedLabel,
      'corrected_grade': correction.correctedGrade.name,
      'model_version': correction.modelVersion,
      'notes': correction.notes,
    };

    await file.writeAsString(
      '${jsonEncode(record)}\n',
      mode: FileMode.append,
      flush: true,
    );
    return file;
  }
}
