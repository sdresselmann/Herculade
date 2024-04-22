import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:lifting_progress_tracker/core/models/app_User.dart';
import 'package:lifting_progress_tracker/core/services/user_service.dart';
import 'package:lifting_progress_tracker/firebase/constants/collection_names.dart';
import 'package:lifting_progress_tracker/firebase/services/firebase_service.dart';
import 'package:lifting_progress_tracker/firebase/services/firestore_service.dart';
import 'package:lifting_progress_tracker/training_plan/default_training_plan_data.dart';
import 'package:mocktail/mocktail.dart';

import '../../../test_utils/given.dart';
import '../../../test_utils/mocks/firebase_mock_service.dart';
import '../../../test_utils/mocks/firestore_mock_service.dart';

void main() {
  group("UserService Unit Tests", () {
    final Given given = Given();

    late MockFirebaseService mockFirebaseService;
    late MockFirestoreService mockFirestoreService;

    late UserService userService;

    setUp(() {
      mockFirebaseService = MockFirebaseService();
      GetIt.I.registerSingleton<FirebaseService>(mockFirebaseService);

      mockFirestoreService = MockFirestoreService();
      GetIt.I.registerSingleton<FirestoreService>(mockFirestoreService);

      userService = UserService();
    });

    tearDown(() {
      GetIt.I.unregister<FirebaseService>();
      GetIt.I.unregister<FirestoreService>();
    });

    test("initializeUser() sets the current user.", () async {
      final AppUser testUser = given.getAppUser();

      when(() => mockFirebaseService.signInTestUser()).thenAnswer((_) async {
        return Future<void>.value();
      });
      when(() => mockFirebaseService.getCurrentUser())
          .thenAnswer((_) => testUser);

      await userService.initializeUser();

      verify(() => mockFirebaseService.signInTestUser());
      verify(() => mockFirebaseService.getCurrentUser());

      final AppUser initializedUser = userService.user;
      expect(initializedUser.uid, testUser.uid);
      expect(initializedUser.email, testUser.email);
    });

    test(
        "initUserCollection() calls createDocuments() if document does not exist.",
        () async {
      final AppUser testUser = given.getAppUser();
      userService.user = testUser;

      when(
        () => mockFirestoreService.documentExists(
          CollectionNames.planEntries,
          testUser.uid,
        ),
      ).thenAnswer((_) async => false);

      when(
        () => mockFirestoreService.createDocument(
          CollectionNames.planEntries,
          testUser.uid,
          defaultTrainingPlan,
        ),
      ).thenAnswer((_) async {
        return;
      });

      await userService.initUserCollections();

      verify(
        () => mockFirestoreService.documentExists(
          CollectionNames.planEntries,
          testUser.uid,
        ),
      );

      verify(
        () => mockFirestoreService.createDocument(
          CollectionNames.planEntries,
          testUser.uid,
          defaultTrainingPlan,
        ),
      );
    });

    test(
      "initUserCollection() does not call createDocument() if the document already exists.",
      () async {
        final AppUser testUser = given.getAppUser();
        userService.user = testUser;

        when(
          () => mockFirestoreService.documentExists(
            CollectionNames.planEntries,
            testUser.uid,
          ),
        ).thenAnswer((_) async => true);

        await userService.initUserCollections();

        verify(
          () => mockFirestoreService.documentExists(
            CollectionNames.planEntries,
            testUser.uid,
          ),
        );

        verifyNever(
          () => mockFirestoreService.createDocument(
            any(),
            any(),
            any(),
          ),
        );
      },
    );
  });
}
