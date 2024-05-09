import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:lifting_progress_tracker/pages/calendar.dart';
import 'package:lifting_progress_tracker/pages/navigation/navigation_container.dart';
import 'package:lifting_progress_tracker/pages/statistics.dart';
import 'package:lifting_progress_tracker/pages/training_plan_list.dart';

import '../test_utils/helpers/data.dart';
import 'modules/navigate.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    connectToMockDatabase();
    setCurrentUser();
  });

  group('navigation smoke tests:', () {
    testWidgets('start application without any errors', (tester) async {
      await startApp(tester);
      expect(find.byType(NavigationContainer), findsOneWidget);
    });

    testWidgets(
        '1. navigate from home to statistics page without occurring any errors',
        (tester) async {
      await startApp(tester);
      await navigateToStatistics(tester);
      expect(find.byType(StatisticsPage), findsOneWidget);
    });

    testWidgets(
        '2. navigate from home to the calendar page without occurring any errors',
        (tester) async {
      await startApp(tester);
      await navigateToCalendar(tester);
      expect(find.byType(CalendarPage), findsOneWidget);
    });

    testWidgets(
        '5. navigate from home to the training plan list page without occurring any errors',
        (tester) async {
      await startApp(tester);
      await navigateToTrainingPlanList(tester);
      expect(find.byType(TrainingPlanListPage), findsOneWidget);
    });
  });
}
