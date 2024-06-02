import 'package:firebase_auth/firebase_auth.dart';

class AppUser {
  final String uid;
  final String email;

  AppUser(this.uid, this.email);

  AppUser.fromUser(User user)
      : uid = user.uid,
        email = user.email ?? "";
}
