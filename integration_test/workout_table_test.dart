import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:lifting_progress_tracker/training_plan/widgets/table/add_entry_button.dart';
import 'package:lifting_progress_tracker/training_plan/widgets/table/workout_table.dart';
import 'modules/navigate.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('workout table smoke tests:', () {
    testWidgets('1. workout table smoketest', (WidgetTester tester) async {
      await startApp(tester);
      await navigateToTrainingPlan(tester);
      expect(find.byType(WorkoutTable), findsOneWidget);
    });
    testWidgets('2. add entry button smoketest', (WidgetTester tester) async {
      await startApp(tester);
      await navigateToTrainingPlan(tester);
      expect(find.byType(AddEntryButton), findsOneWidget);
    });
  });
}
