/// The provider that contains the environment the app is called.
///
/// Also see: [environment].
class EnvironmentProvider {
  /// The environment the app is called. For example: RELEASE, PRODUCTION or TEST.
  ///
  /// In test mode data is not fetched from firebase and has to be mocked instead.
  /// For backend testing use DATATEST which uses a special test database.
  final String environment;
  EnvironmentProvider({required this.environment});
}
