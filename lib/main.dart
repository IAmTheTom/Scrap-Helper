import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:drift/drift.dart' hide Column;
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path_util;
import 'package:path_provider/path_provider.dart';

import 'database/app_database.dart';
import 'database/database_provider.dart';

part 'app/scrappr_app.dart';
part 'app/scrappr_shell.dart';
part 'models/enums.dart';
part 'models/photo_attachment.dart';
part 'models/vehicle.dart';
part 'models/yard.dart';
part 'models/yard_price.dart';
part 'models/search_rule.dart';
part 'models/search_source.dart';
part 'models/notification_settings.dart';
part 'models/home_base_settings.dart';
part 'models/route_plan.dart';
part 'models/object_template.dart';
part 'models/scrap_item.dart';
part 'models/run_plan.dart';
part 'models/receipt.dart';
part 'models/assistant_context.dart';
part 'state/scrappr_model.dart';
part 'services/camera_service.dart';
part 'services/photo_attachment_service.dart';
part 'services/assistant_service.dart';
part 'services/route_service.dart';
part 'services/persistence_service.dart';
part 'features/today/today_screen.dart';
part 'features/inbox/inbox_screen.dart';
part 'features/runs/runs_screen.dart';
part 'features/processing/processing_screen.dart';
part 'features/library/library_screen.dart';
part 'features/reports/reports_screen.dart';
part 'features/settings/settings_screen.dart';
part 'features/assistant/assistant_screen.dart';
part 'widgets/page_shell.dart';
part 'widgets/metric.dart';
part 'widgets/dialogs.dart';
part 'widgets/shared_ui.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDatabaseProvider();
  runApp(const ScrapprApp());
}
