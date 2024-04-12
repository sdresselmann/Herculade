[![build-app-release](https://github.com/sdresselmann/Lifting-Progress-Tracker/actions/workflows/build.yml/badge.svg)](https://github.com/sdresselmann/Lifting-Progress-Tracker/actions/workflows/build.yml)
[![code-analysis](https://github.com/sdresselmann/Lifting-Progress-Tracker/actions/workflows/code_analysis.yml/badge.svg)](https://github.com/sdresselmann/Lifting-Progress-Tracker/actions/workflows/code_analysis.yml)
[![flutter-tests](https://github.com/sdresselmann/Lifting-Progress-Tracker/actions/workflows/flutter_tests.yml/badge.svg)](https://github.com/sdresselmann/Lifting-Progress-Tracker/actions/workflows/flutter_tests.yml)
[![style: lint](https://img.shields.io/badge/style-lint-4BC0F5.svg)](https://pub.dev/packages/lint)

# Herculade

This app is a fitness planner where users can add and configure their own training plans. These training plans can be selected and saved via a calendar for corresponding training days. It works on Windows, Mac and Linux.

Remake of the "FitHub" project made for the mobile application module:

https://github.com/sdresselmann/FitHub

This project extends already existing functionality and makes it usable for multiple Platforms (Android, IOS, Web).

# Flutter

## Start
```
flutter run -d chrome
```

This builds and runs the app in your webbrowser. For using the app on Android and iOS, refer to the [Build for Release Section](#build-for-release).

## Tests
```
flutter test
```
## Integration Tests
```
flutter test -d linux integration_test/regression.dart
```
## Code analyzing and linting
```
flutter analyze
```
```
dart analyze
```
## Code formating
```
dart format lib
```

## Generate Docs
```
dart doc
```

## Build for release 

### 1. Download all dependencies
```
flutter pub get
```
### 2. Build APK
```
flutter build apk
```
### 3. Build App Bundle
```
flutter build appbundle
```
