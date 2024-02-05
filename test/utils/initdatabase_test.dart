import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart';
import 'package:simplenoteapp/src/utils/initdatabase.util.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  group('Database Test', () {
    setUpAll(() async {
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;
    });

    tearDownAll(() async {
      await deleteDatabase(join(await getDatabasesPath(), 'test.db'));
    });

    test('openDb and initDatabase returns a Database', () async {
      final databasePath = join(await getDatabasesPath(), 'test.db');
      final result = await openDb(databasePath);

      expect(result, isA<Database>());

      await result.close();

      final initResult = await initDatabase();

      expect(initResult, isA<Database>());

      await initResult.close();
    });
  });
}
