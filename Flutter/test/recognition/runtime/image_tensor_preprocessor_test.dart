import 'package:flutter_test/flutter_test.dart';
import 'package:image/image.dart' as img;
import 'package:scrap_helper/recognition/runtime/image_tensor_preprocessor.dart';
import 'package:scrap_helper/recognition/runtime/model_manifest.dart';

void main() {
  const preprocessor = ImageTensorPreprocessor();

  test('creates RGB uint8 tensor from real PNG pixels', () {
    final image = img.Image(width: 2, height: 2);
    image.setPixelRgb(0, 0, 255, 0, 0);
    image.setPixelRgb(1, 0, 0, 255, 0);
    image.setPixelRgb(0, 1, 0, 0, 255);
    image.setPixelRgb(1, 1, 255, 255, 255);

    final result = preprocessor.prepareBytes(
      bytes: img.encodePng(image),
      input: const ModelInputSpec(
        width: 2,
        height: 2,
        channels: 3,
        dataType: 'uint8',
        normalization: 'none',
      ),
    );

    expect(result.valueCount, 12);
    expect(result.uint8Values!.take(3), [255, 0, 0]);
  });

  test('normalizes float pixels to zero through one', () {
    final image = img.Image(width: 1, height: 1);
    image.setPixelRgb(0, 0, 255, 128, 0);

    final result = preprocessor.prepareBytes(
      bytes: img.encodePng(image),
      input: const ModelInputSpec(
        width: 1,
        height: 1,
        channels: 3,
        dataType: 'float32',
        normalization: 'zero_to_one',
      ),
    );

    expect(result.float32Values![0], closeTo(1, 0.0001));
    expect(result.float32Values![1], closeTo(128 / 255, 0.0001));
    expect(result.float32Values![2], closeTo(0, 0.0001));
  });
}
