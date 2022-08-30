import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'app_test.dart' as apptest;
import 'workout_table_test.dart' as tabletest;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('run app smoke tests', () {
    apptest.main();
    tabletest.main();
  });
}
