import 'dart:convert';

final class ModelInputSpec {
  const ModelInputSpec({
    required this.width,
    required this.height,
    required this.channels,
    required this.dataType,
    required this.normalization,
  });

  final int width;
  final int height;
  final int channels;
  final String dataType;
  final String normalization;

  factory ModelInputSpec.fromJson(Map<String, Object?> json) {
    return ModelInputSpec(
      width: json['width']! as int,
      height: json['height']! as int,
      channels: json['channels']! as int,
      dataType: json['data_type']! as String,
      normalization: json['normalization']! as String,
    );
  }
}

final class ModelOutputSpec {
  const ModelOutputSpec({
    required this.kind,
    required this.labelFile,
    required this.maximumDetections,
  });

  final String kind;
  final String labelFile;
  final int maximumDetections;

  factory ModelOutputSpec.fromJson(Map<String, Object?> json) {
    return ModelOutputSpec(
      kind: json['kind']! as String,
      labelFile: json['label_file']! as String,
      maximumDetections: json['maximum_detections']! as int,
    );
  }
}

final class LocalModelManifest {
  const LocalModelManifest({
    required this.modelName,
    required this.modelVersion,
    required this.taxonomyVersion,
    required this.runtime,
    required this.modelFile,
    required this.modelSha256,
    required this.input,
    required this.output,
    required this.minimumAppVersion,
  });

  final String modelName;
  final String modelVersion;
  final String taxonomyVersion;
  final String runtime;
  final String modelFile;
  final String modelSha256;
  final ModelInputSpec input;
  final ModelOutputSpec output;
  final String minimumAppVersion;

  factory LocalModelManifest.fromJson(Map<String, Object?> json) {
    return LocalModelManifest(
      modelName: json['model_name']! as String,
      modelVersion: json['model_version']! as String,
      taxonomyVersion: json['taxonomy_version']! as String,
      runtime: json['runtime']! as String,
      modelFile: json['model_file']! as String,
      modelSha256: json['model_sha256']! as String,
      input: ModelInputSpec.fromJson(
        (json['input']! as Map).cast<String, Object?>(),
      ),
      output: ModelOutputSpec.fromJson(
        (json['output']! as Map).cast<String, Object?>(),
      ),
      minimumAppVersion: json['minimum_app_version']! as String,
    );
  }

  static LocalModelManifest parse(String source) {
    return LocalModelManifest.fromJson(
      (jsonDecode(source) as Map).cast<String, Object?>(),
    );
  }

  void validate() {
    if (modelName.trim().isEmpty) {
      throw const FormatException('Model name is required.');
    }
    if (runtime != 'tflite') {
      throw FormatException('Unsupported runtime: $runtime');
    }
    if (!modelFile.toLowerCase().endsWith('.tflite')) {
      throw const FormatException('Model file must end with .tflite.');
    }
    if (modelSha256.length != 64) {
      throw const FormatException('Model SHA-256 must contain 64 characters.');
    }
    if (input.width <= 0 || input.height <= 0 || input.channels != 3) {
      throw const FormatException('Model input dimensions are invalid.');
    }
    if (input.dataType != 'uint8' && input.dataType != 'float32') {
      throw FormatException('Unsupported input data type: ${input.dataType}');
    }
    if (output.kind != 'classification' && output.kind != 'object_detection') {
      throw FormatException('Unsupported output kind: ${output.kind}');
    }
  }
}
