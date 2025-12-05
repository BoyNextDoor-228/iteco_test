// ignore_for_file: do_not_use_environment
import 'app_config.dart';

class Environment {
  Environment._({
    required this.environmentName,
    required this.applicationName,
    required this.appConfig,
  });

  // ignore: avoid-non-null-assertion
  static Environment get instance => _instance!;
  static Environment? _instance;

  final String environmentName;
  final String applicationName;
  final AppConfig appConfig;

  /// Initialization procedure.
  ///
  /// Collecting all required data from environment and initialization of
  /// [Environment] instance.
  ///
  /// Note: make sure this method is called before [instance] getter is used
  /// wherever.
  static void init() {
    _instance ??= Environment._(
      environmentName:
          const String.fromEnvironment('iteco_test_environment_name'),
      applicationName:
          const String.fromEnvironment('iteco_test_application_name'),
      appConfig: AppConfig.fromEnvironment(),
    );
  }
}
