import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'model_pack_validator.dart';

final class InstalledModelRecord {
  const InstalledModelRecord({
    required this.directoryPath,
    required this.validation,
  });

  final String directoryPath;
  final ModelPackValidation validation;
}

final class InstalledModelRegistry {
  const InstalledModelRegistry({this.validator = const ModelPackValidator()});

  final ModelPackValidator validator;

  Future<InstalledModelRecord?> findNewestValid({
    Directory? supportDirectory,
  }) async {
    final support = supportDirectory ?? await getApplicationSupportDirectory();
    final root = Directory(p.join(support.path, 'recognition_models'));

    if (!await root.exists()) return null;

    final candidates = <Directory>[];

    await for (final modelDirectory in root.list()) {
      if (modelDirectory is! Directory) continue;

      await for (final versionDirectory in modelDirectory.list()) {
        if (versionDirectory is Directory) {
          candidates.add(versionDirectory);
        }
      }
    }

    candidates.sort((a, b) {
      final aModified = a.statSync().modified;
      final bModified = b.statSync().modified;
      return bModified.compareTo(aModified);
    });

    for (final directory in candidates) {
      final validation = await validator.validateDirectory(directory.path);

      if (validation.isValid && validation.manifest != null) {
        return InstalledModelRecord(
          directoryPath: directory.path,
          validation: validation,
        );
      }
    }

    return null;
  }
}
