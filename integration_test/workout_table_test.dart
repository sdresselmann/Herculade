import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:lifting_progress_tracker/components/workout_table.dart';
import 'modules/navigate.dart';
import 'modules/provider.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('workout table smoke tests:', () {
    testWidgets('1. workout table smoketest', (tester) async {
      await startApp(tester);
      await navigateToTrainingPlan(tester);
      expect(find.byType(WorkoutTable), findsOneWidget);
    });
    testWidgets('2. add entry button smoketest', (tester) async {
      await startApp(tester);
      await navigateToTrainingPlan(tester);
      expect(find.byType(AddEntryButton), findsOneWidget);
    });
  });
  group('base functionality tests', () {
    testWidgets(
        'When the add entry button is tapped an entry is added to the table (expected length is equal to current length)',
        (tester) async {
      await startApp(tester);
      await navigateToTrainingPlan(tester);

      await setTableProviderData(tester);

      int currentLength = await getTableEntryCount(tester);
      print(currentLength);
      final int expectedLength = currentLength + 1;

      await tester.tap(find.byType(AddEntryButton));
      await tester.pumpAndSettle();
      currentLength = await getTableEntryCount(tester);
      print(currentLength);
      print(expectedLength);
      expect(currentLength == expectedLength, true);
    });
  });
}
