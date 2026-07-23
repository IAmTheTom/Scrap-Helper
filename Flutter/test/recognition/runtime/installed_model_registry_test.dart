import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:scrap_helper/recognition/runtime/installed_model_registry.dart';

void main() {
  test('finds newest valid installed model pack', () async {
    final support = await Directory.systemTemp.createTemp('scrap_registry_');
    addTearDown(() => support.delete(recursive: true));

    final modelDirectory = Directory(
      '${support.path}/recognition_models/Test_Model/1.0.0',
    );
    await modelDirectory.create(recursive: true);

    final bytes = utf8.encode('fixture model');
    final checksum = sha256.convert(bytes).toString();

    await File('${modelDirectory.path}/model.tflite').writeAsBytes(bytes);
    await File(
      '${modelDirectory.path}/labels.txt',
    ).writeAsString('yellow_brass\nunknown\n');
    await File('${modelDirectory.path}/manifest.json').writeAsString('''
{
  "model_name": "Test Model",
  "model_version": "1.0.0",
  "taxonomy_version": "1.0.0",
  "runtime": "tflite",
  "model_file": "model.tflite",
  "model_sha256": "$checksum",
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

    final record = await const InstalledModelRegistry().findNewestValid(
      supportDirectory: support,
    );

    expect(record, isNotNull);
    expect(record!.validation.manifest!.modelName, 'Test Model');
  });
}
