import 'package:lifting_progress_tracker/core/models/app_user.dart';
import 'package:lifting_progress_tracker/core/services/user_service.dart';
import 'package:mocktail/mocktail.dart';

import '../given.dart';

class UserMockService extends Mock implements UserService {
  @override
  late final Future<AppUser> user$ = Future.value(Given().getAppUser());
}
