import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:lifting_progress_tracker/test/navigate.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('workout table smoke tests', () {
    testWidgets('description', (tester) async {
      await startApp(tester);
    });
    testWidgets('description', (tester) async {});
  });
}
