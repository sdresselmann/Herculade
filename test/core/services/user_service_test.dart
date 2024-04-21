import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:lifting_progress_tracker/core/models/app_User.dart';
import 'package:lifting_progress_tracker/core/services/user_service.dart';
import 'package:lifting_progress_tracker/firebase/services/firebase_service.dart';
import 'package:lifting_progress_tracker/firebase/services/firestore_service.dart';
import 'package:mocktail/mocktail.dart';

import '../../../test_utils/given.dart';
import '../../../test_utils/mocks/firebase_mock_service.dart';
import '../../../test_utils/mocks/firestore_mock_service.dart';

void main() {
  group("UserService Unit Tests", () {
    late final Given given;
    late final UserService userService;

    late final MockFirebaseService mockFirebaseService;
    late final MockFirestoreService mockFirestoreService;

    setUp(() {
      mockFirebaseService = MockFirebaseService();
      GetIt.I.registerSingleton<FirebaseService>(mockFirebaseService);

      mockFirestoreService = MockFirestoreService();
      GetIt.I.registerSingleton<FirestoreService>(mockFirestoreService);

      given = Given();
      userService = UserService();
    });

    test("initializeUser() sets the current user", () async {
      final AppUser mockUser = given.getAppUser();

      when(() => mockFirebaseService.signInTestUser()).thenAnswer((_) async {
        return Future<void>.value();
      });

      when(() => mockFirebaseService.getCurrentUser())
          .thenAnswer((_) => mockUser);

      await userService.initializeUser();
    });
  });
}
