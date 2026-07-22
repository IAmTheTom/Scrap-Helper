import 'package:flutter_test/flutter_test.dart';
import 'package:scrap_helper/recognition/runtime/model_manifest.dart';

void main() {
  test('parses and validates TFLite model manifest', () {
    final manifest = LocalModelManifest.parse('''
{
  "model_name": "Scrap Detector",
  "model_version": "0.1.0",
  "taxonomy_version": "1.0.0",
  "runtime": "tflite",
  "model_file": "model.tflite",
  "model_sha256": "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
  "minimum_app_version": "0.9.1",
  "input": {
    "width": 224,
    "height": 224,
    "channels": 3,
    "data_type": "uint8",
    "normalization": "none"
  },
  "output": {
    "kind": "classification",
    "label_file": "labels.txt",
    "maximum_detections": 1
  }
}
''');

    expect(manifest.modelName, 'Scrap Detector');
    expect(manifest.input.width, 224);
    expect(() => manifest.validate(), returnsNormally);
  });

  test('rejects unsupported runtime', () {
    final manifest = LocalModelManifest.parse('''
{
  "model_name": "Bad Model",
  "model_version": "1",
  "taxonomy_version": "1",
  "runtime": "cloud",
  "model_file": "model.tflite",
  "model_sha256": "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
  "minimum_app_version": "0.9.1",
  "input": {
    "width": 224,
    "height": 224,
    "channels": 3,
    "data_type": "uint8",
    "normalization": "none"
  },
  "output": {
    "kind": "classification",
    "label_file": "labels.txt",
    "maximum_detections": 1
  }
}
''');

    expect(() => manifest.validate(), throwsFormatException);
  });
}
