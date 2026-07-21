import 'package:flutter/material.dart';

import 'app.dart';
import 'data/database/app_database.dart';
import 'data/seed/operational_seed.dart';
import 'data/seed/starter_seed.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppDatabase.instance;
  await StarterSeed.apply();
  await OperationalSeed.apply();
  runApp(const ScrapHelperApp());
}
