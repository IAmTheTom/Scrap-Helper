import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import 'app.dart';
import 'data/database/app_database.dart';
import 'data/seed/operational_seed.dart';
import 'data/seed/starter_seed.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isWindows || Platform.isLinux) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }

  await AppDatabase.instance;
  await StarterSeed.apply();
  await OperationalSeed.apply();

  runApp(const ScrapHelperApp());
}
