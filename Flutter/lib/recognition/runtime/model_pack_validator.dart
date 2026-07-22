import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:path/path.dart' as p;

import 'model_manifest.dart';

final class ModelPackValidation {
  const ModelPackValidation({
    required this.isValid,
    required this.message,
    this.manifest,
    this.modelPath,
    this.labelsPath,
  });

  final bool isValid;
  final String message;
  final LocalModelManifest? manifest;
  final String? modelPath;
  final String? labelsPath;
}

final class ModelPackValidator {
  const ModelPackValidator();

  Future<ModelPackValidation> validateDirectory(String directoryPath) async {
    final directory = Directory(directoryPath);
    if (!await directory.exists()) {
      return const ModelPackValidation(
        isValid: false,
        message: 'Model-pack directory does not exist.',
      );
    }

    final manifestFile = File(p.join(directory.path, 'manifest.json'));
    if (!await manifestFile.exists()) {
      return const ModelPackValidation(
        isValid: false,
        message: 'manifest.json is missing.',
      );
    }

    late final LocalModelManifest manifest;
    try {
      manifest = LocalModelManifest.parse(await manifestFile.readAsString());
      manifest.validate();
    } on FormatException catch (error) {
      return ModelPackValidation(isValid: false, message: error.message);
    } catch (error) {
      return ModelPackValidation(
        isValid: false,
        message: 'Could not parse model manifest: $error',
      );
    }

    final modelFile = File(p.join(directory.path, manifest.modelFile));
    if (!await modelFile.exists()) {
      return ModelPackValidation(
        isValid: false,
        message: 'Model file is missing: ${manifest.modelFile}',
      );
    }

    final labelsFile = File(p.join(directory.path, manifest.output.labelFile));
    if (!await labelsFile.exists()) {
      return ModelPackValidation(
        isValid: false,
        message: 'Label file is missing: ${manifest.output.labelFile}',
      );
    }

    final digest = sha256.convert(await modelFile.readAsBytes()).toString();
    if (digest.toLowerCase() != manifest.modelSha256.toLowerCase()) {
      return const ModelPackValidation(
        isValid: false,
        message: 'Model checksum does not match manifest.',
      );
    }

    final labels = const LineSplitter()
        .convert(await labelsFile.readAsString())
        .where((line) => line.trim().isNotEmpty)
        .toList(growable: false);

    if (labels.isEmpty) {
      return const ModelPackValidation(
        isValid: false,
        message: 'Label file contains no labels.',
      );
    }

    return ModelPackValidation(
      isValid: true,
      message: 'Model pack is valid.',
      manifest: manifest,
      modelPath: modelFile.path,
      labelsPath: labelsFile.path,
    );
  }
}
