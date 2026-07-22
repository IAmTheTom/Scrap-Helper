import 'dart:convert';
import 'dart:io';

import 'package:tflite_flutter/tflite_flutter.dart';

import 'image_tensor_preprocessor.dart';
import 'model_manifest.dart';

final class LocalRuntimeStatus {
  const LocalRuntimeStatus({
    required this.isReady,
    required this.message,
    this.inputShape,
    this.outputShapes = const [],
  });

  final bool isReady;
  final String message;
  final List<int>? inputShape;
  final List<List<int>> outputShapes;
}

final class RawModelOutput {
  const RawModelOutput({required this.values, required this.outputShapes});

  final List<Object> values;
  final List<List<int>> outputShapes;
}

final class LocalModelRuntime {
  Interpreter? _interpreter;
  List<String> _labels = const [];

  bool get isLoaded => _interpreter != null;

  List<String> get labels => List.unmodifiable(_labels);

  Future<LocalRuntimeStatus> load({
    required String modelPath,
    required String labelsPath,
    int threads = 2,
  }) async {
    await close();

    try {
      final options = InterpreterOptions()..threads = threads;
      final interpreter = Interpreter.fromFile(
        File(modelPath),
        options: options,
      );
      interpreter.allocateTensors();

      _labels = const LineSplitter()
          .convert(await File(labelsPath).readAsString())
          .where((line) => line.trim().isNotEmpty)
          .toList(growable: false);
      _interpreter = interpreter;

      final inputShape = interpreter.getInputTensor(0).shape;
      final outputShapes = [
        for (
          var index = 0;
          index < interpreter.getOutputTensors().length;
          index++
        )
          interpreter.getOutputTensor(index).shape,
      ];

      return LocalRuntimeStatus(
        isReady: true,
        message: 'Local TFLite runtime loaded.',
        inputShape: inputShape,
        outputShapes: outputShapes,
      );
    } catch (error) {
      await close();
      return LocalRuntimeStatus(
        isReady: false,
        message: 'Could not load local model: $error',
      );
    }
  }

  RawModelOutput runClassification({
    required PreparedImageTensor tensor,
    required LocalModelManifest manifest,
  }) {
    final interpreter = _interpreter;
    if (interpreter == null) {
      throw StateError('No local model is loaded.');
    }
    if (manifest.output.kind != 'classification') {
      throw StateError('runClassification requires a classification model.');
    }

    final input = _toInput(tensor);
    final outputTensor = interpreter.getOutputTensor(0);
    final output = _allocateNested(outputTensor.shape, 0.0);

    interpreter.run(input, output);

    return RawModelOutput(values: [output], outputShapes: [outputTensor.shape]);
  }

  Object _toInput(PreparedImageTensor tensor) {
    if (tensor.dataType == 'uint8') {
      final values = tensor.uint8Values!;
      return [
        [
          for (var y = 0; y < tensor.height; y++)
            [
              for (var x = 0; x < tensor.width; x++)
                [
                  values[(y * tensor.width + x) * 3],
                  values[(y * tensor.width + x) * 3 + 1],
                  values[(y * tensor.width + x) * 3 + 2],
                ],
            ],
        ],
      ];
    }

    final values = tensor.float32Values!;
    return [
      [
        for (var y = 0; y < tensor.height; y++)
          [
            for (var x = 0; x < tensor.width; x++)
              [
                values[(y * tensor.width + x) * 3],
                values[(y * tensor.width + x) * 3 + 1],
                values[(y * tensor.width + x) * 3 + 2],
              ],
          ],
      ],
    ];
  }

  dynamic _allocateNested(List<int> shape, double fill) {
    if (shape.isEmpty) return fill;
    final size = shape.first;
    final remainder = shape.sublist(1);
    return List<dynamic>.generate(
      size,
      (_) => _allocateNested(remainder, fill),
    );
  }

  Future<void> close() async {
    _interpreter?.close();
    _interpreter = null;
    _labels = const [];
  }
}
