import 'dart:io';
import 'dart:typed_data';

import 'package:image/image.dart' as img;

import 'model_manifest.dart';

final class PreparedImageTensor {
  const PreparedImageTensor({
    required this.width,
    required this.height,
    required this.dataType,
    this.uint8Values,
    this.float32Values,
  });

  final int width;
  final int height;
  final String dataType;
  final Uint8List? uint8Values;
  final Float32List? float32Values;

  int get valueCount => uint8Values?.length ?? float32Values?.length ?? 0;
}

final class ImageTensorPreprocessor {
  const ImageTensorPreprocessor();

  Future<PreparedImageTensor> prepareFile({
    required String imagePath,
    required ModelInputSpec input,
  }) async {
    final bytes = await File(imagePath).readAsBytes();
    return prepareBytes(bytes: bytes, input: input);
  }

  PreparedImageTensor prepareBytes({
    required List<int> bytes,
    required ModelInputSpec input,
  }) {
    final decoded = img.decodeImage(Uint8List.fromList(bytes));
    if (decoded == null) {
      throw const FormatException('Image could not be decoded.');
    }

    final oriented = img.bakeOrientation(decoded);
    final resized = img.copyResize(
      oriented,
      width: input.width,
      height: input.height,
      interpolation: img.Interpolation.linear,
    );

    if (input.dataType == 'uint8') {
      final values = Uint8List(input.width * input.height * input.channels);
      var offset = 0;

      for (var y = 0; y < input.height; y++) {
        for (var x = 0; x < input.width; x++) {
          final pixel = resized.getPixel(x, y);
          values[offset++] = pixel.r.toInt();
          values[offset++] = pixel.g.toInt();
          values[offset++] = pixel.b.toInt();
        }
      }

      return PreparedImageTensor(
        width: input.width,
        height: input.height,
        dataType: input.dataType,
        uint8Values: values,
      );
    }

    if (input.dataType == 'float32') {
      final values = Float32List(input.width * input.height * input.channels);
      var offset = 0;

      for (var y = 0; y < input.height; y++) {
        for (var x = 0; x < input.width; x++) {
          final pixel = resized.getPixel(x, y);
          values[offset++] = _normalize(
            pixel.r.toDouble(),
            input.normalization,
          );
          values[offset++] = _normalize(
            pixel.g.toDouble(),
            input.normalization,
          );
          values[offset++] = _normalize(
            pixel.b.toDouble(),
            input.normalization,
          );
        }
      }

      return PreparedImageTensor(
        width: input.width,
        height: input.height,
        dataType: input.dataType,
        float32Values: values,
      );
    }

    throw FormatException('Unsupported input type: ${input.dataType}');
  }

  double _normalize(double value, String normalization) {
    return switch (normalization) {
      'zero_to_one' => value / 255,
      'minus_one_to_one' => (value / 127.5) - 1,
      'none' => value,
      _ => throw FormatException('Unsupported normalization: $normalization'),
    };
  }
}
