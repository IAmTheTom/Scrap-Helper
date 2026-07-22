import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'model_pack_validator.dart';

final class InstalledModelPack {
  const InstalledModelPack({
    required this.directoryPath,
    required this.validation,
  });

  final String directoryPath;
  final ModelPackValidation validation;
}

final class ModelPackInstaller {
  const ModelPackInstaller({this.validator = const ModelPackValidator()});

  final ModelPackValidator validator;

  Future<InstalledModelPack> installFromDirectory(
    String sourceDirectory,
  ) async {
    final validation = await validator.validateDirectory(sourceDirectory);
    if (!validation.isValid || validation.manifest == null) {
      throw FormatException(validation.message);
    }

    final support = await getApplicationSupportDirectory();
    final destination = Directory(
      p.join(
        support.path,
        'recognition_models',
        validation.manifest!.modelName.replaceAll(
          RegExp(r'[^A-Za-z0-9._-]+'),
          '_',
        ),
        validation.manifest!.modelVersion,
      ),
    );

    if (await destination.exists()) {
      await destination.delete(recursive: true);
    }
    await destination.create(recursive: true);

    final source = Directory(sourceDirectory);
    await for (final entity in source.list(recursive: false)) {
      if (entity is! File) continue;
      await entity.copy(p.join(destination.path, p.basename(entity.path)));
    }

    final installedValidation = await validator.validateDirectory(
      destination.path,
    );
    if (!installedValidation.isValid) {
      await destination.delete(recursive: true);
      throw FormatException(
        'Installed model failed validation: ${installedValidation.message}',
      );
    }

    return InstalledModelPack(
      directoryPath: destination.path,
      validation: installedValidation,
    );
  }
}
