import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:lifting_progress_tracker/core/models/app_user.model.dart';
import 'package:lifting_progress_tracker/core/services/user.service.dart';
import 'package:lifting_progress_tracker/firebase/constants/collection_names.dart';
import 'package:lifting_progress_tracker/firebase/services/firebase_service.dart';
import 'package:lifting_progress_tracker/firebase/services/firestore_service.dart';
import 'package:lifting_progress_tracker/training_plan/default_training_plan.data.dart';
import 'package:mocktail/mocktail.dart';

import '../../../test_utils/given.dart';
import '../../../test_utils/helpers/data.dart';
import '../../../test_utils/mocks/firebase_mock.service.dart';
import '../../../test_utils/mocks/firestore_mock.service.dart';

void main() {
  group("UserService Unit Tests", () {
    final Given given = Given();

    late MockFirebaseService mockFirebaseService;
    late MockFirestoreService mockFirestoreService;

    late UserService userService;

    setUp(() {
      connectToMockDatabase();

      mockFirebaseService = Get.find<FirebaseService>() as MockFirebaseService;
      mockFirestoreService =
          Get.find<FirestoreService>() as MockFirestoreService;

      userService = UserService();
    });

    tearDown(() {
      Get.delete<FirebaseService>();
      Get.delete<FirestoreService>();
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
        () => mockFirestoreService.exists(
          CollectionNames.planEntries,
          testUser.uid,
        ),
      ).thenAnswer((_) async => false);

      when(
        () => mockFirestoreService.set(
          CollectionNames.planEntries,
          testUser.uid,
          defaultTrainingPlan,
        ),
      ).thenAnswer((_) async {
        return;
      });

      await userService.initUserCollections();

      verify(
        () => mockFirestoreService.exists(
          CollectionNames.planEntries,
          testUser.uid,
        ),
      );

      verify(
        () => mockFirestoreService.set(
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
          () => mockFirestoreService.exists(
            CollectionNames.planEntries,
            testUser.uid,
          ),
        ).thenAnswer((_) async => true);

        await userService.initUserCollections();

        verify(
          () => mockFirestoreService.exists(
            CollectionNames.planEntries,
            testUser.uid,
          ),
        );

        verifyNever(
          () => mockFirestoreService.set(
            any(),
            any(),
            any(),
          ),
        );
      },
    );
  });
}
