import 'package:flutter/material.dart';

import 'app.dart';
import 'data/database/app_database.dart';
import 'data/seed/starter_seed.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppDatabase.instance;
  await StarterSeed.apply();
  runApp(const ScrapHelperApp());
}
