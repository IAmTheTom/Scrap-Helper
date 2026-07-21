import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:scrap_helper/data/database/app_database.dart';
import 'package:scrap_helper/data/repositories/report_repository.dart';

void main() {
  setUpAll(sqfliteFfiInit);

  test('returns empty lifetime report for new database', () async {
    final db = await AppDatabase.openAtPath(
      inMemoryDatabasePath,
      factory: databaseFactoryFfi,
    );
    final report = await ReportRepository(db).loadPeriod(label: 'Lifetime');

    expect(report.grossCents, 0);
    expect(report.netCents, 0);
    expect(report.loadCount, 0);

    await db.close();
  });
}
