import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'modules/navigate.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('workout table smoke tests:', () {
    testWidgets('1. workout table smoketest', (tester) async {
      await startApp(tester);
      await navigateToTrainingPlanList(tester);
      // check component
    });
    testWidgets('2. description', (tester) async {});
    // check buttons (-) 1 each entry

    //check button (+)

    //check text fields (3 each entry)
  });
}
