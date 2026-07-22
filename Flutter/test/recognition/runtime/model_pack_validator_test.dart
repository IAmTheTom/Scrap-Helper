import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:scrap_helper/recognition/runtime/model_pack_validator.dart';

void main() {
  test('validates a complete local model pack', () async {
    final directory = await Directory.systemTemp.createTemp(
      'scrap_model_pack_',
    );
    addTearDown(() => directory.delete(recursive: true));

    final modelBytes = utf8.encode('fixture model bytes');
    final checksum = sha256.convert(modelBytes).toString();

    await File('${directory.path}/model.tflite').writeAsBytes(modelBytes);
    await File(
      '${directory.path}/labels.txt',
    ).writeAsString('bare_bright_copper\nyellow_brass\n');
    await File('${directory.path}/manifest.json').writeAsString('''
{
  "model_name": "Fixture Detector",
  "model_version": "0.1.0",
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

    final result = await const ModelPackValidator().validateDirectory(
      directory.path,
    );

    expect(result.isValid, isTrue);
    expect(result.manifest!.modelName, 'Fixture Detector');
  });

  test('rejects checksum mismatch', () async {
    final directory = await Directory.systemTemp.createTemp(
      'scrap_bad_model_pack_',
    );
    addTearDown(() => directory.delete(recursive: true));

    await File('${directory.path}/model.tflite').writeAsString('wrong');
    await File('${directory.path}/labels.txt').writeAsString('unknown\n');
    await File('${directory.path}/manifest.json').writeAsString('''
{
  "model_name": "Fixture Detector",
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

    final result = await const ModelPackValidator().validateDirectory(
      directory.path,
    );

    expect(result.isValid, isFalse);
    expect(result.message, contains('checksum'));
  });
}
