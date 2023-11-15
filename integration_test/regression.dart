import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'app_test.dart' as apptest;
import 'workout_table_test.dart' as tabletest;

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('', () {
    apptest.main();
    tabletest.main();
  });
}
