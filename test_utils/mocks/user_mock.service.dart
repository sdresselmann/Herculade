import 'package:get/get.dart';
import 'package:lifting_progress_tracker/core/models/app_user.model.dart';
import 'package:lifting_progress_tracker/core/services/user.service.dart';
import 'package:mocktail/mocktail.dart';

import '../given.dart';

class UserMockService extends GetxService with Mock implements UserService {
  @override
  late final Future<AppUser> user$ = Future.value(Given().getAppUser());

  @override
  AppUser get user {
    return Given().getAppUser();
  }
}
