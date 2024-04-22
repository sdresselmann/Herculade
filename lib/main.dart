import 'package:flutter/material.dart';
import 'package:lifting_progress_tracker/app.dart';
import 'package:lifting_progress_tracker/app_utils.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupAppUtils();

  runApp(
    const MyApp(),
  );
}
