import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lifting_progress_tracker/core/models/app_user.dart';
import 'package:lifting_progress_tracker/core/services/user_service.dart';
import 'package:lifting_progress_tracker/core/widgets/error_message.dart';
import 'package:lifting_progress_tracker/pages/home/widgets/welcome_message.dart';
import 'package:logging/logging.dart';

class HomePage extends StatelessWidget {
  final Logger _logger = Logger("StartingPage");

  final UserService _userService = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: _userService.user$,
          builder: (BuildContext context, AsyncSnapshot<AppUser> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }

            if (snapshot.connectionState == ConnectionState.done) {
              return WelcomeMessage(
                username: snapshot.data?.email ?? "",
              );
            }

            if (snapshot.hasError) {
              _logger.warning(
                "The welcome message could not be properly loaded: ${snapshot.error}",
              );
            }

            return ErrorMessage();
          },
        ),
      ),
    );
  }
}
