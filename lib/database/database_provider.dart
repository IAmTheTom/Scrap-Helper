import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

QueryExecutor openScrapprDatabase() {
  return NativeDatabase.createInBackground(
    File(p.join(_databaseDirectory.path, 'scrappr.sqlite')),
  );
}

late Directory _databaseDirectory;

Future<void> initializeDatabaseProvider() async {
  _databaseDirectory = await getApplicationSupportDirectory();
  await _databaseDirectory.create(recursive: true);
}
