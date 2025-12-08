// ignore_for_file: do_not_use_environment
import 'package:flutter/foundation.dart';

@immutable
final class AppConfig {
  /// Configuration for application.
  const AppConfig({
    required this.serverUrl,
    required this.productPaginationSize,
    required this.isFirstLaunchKey,
  });

  /// Creates instance using data from the environment.
  factory AppConfig.fromEnvironment() => const AppConfig(
        serverUrl: String.fromEnvironment('iteco_test_server_url'),
        productPaginationSize:
            int.fromEnvironment('iteco_test_products_pagination_size'),
        isFirstLaunchKey: String.fromEnvironment('iteco_test_first_launch_key'),
      );

  /// API server url.
  final String serverUrl;

  /// Size of portion of products for pagination;
  final int productPaginationSize;

  /// key for accessing 'isFirstLaunch' value from storage.
  final String isFirstLaunchKey;

  /// Creates an instance of [AppConfig] with modified parameters.
  AppConfig copyWith({
    String? serverUrl,
    int? productPaginationSize,
    String? isFirstLaunchKey,
  }) =>
      AppConfig(
        serverUrl: serverUrl ?? this.serverUrl,
        productPaginationSize:
            productPaginationSize ?? this.productPaginationSize,
        isFirstLaunchKey: isFirstLaunchKey ?? this.isFirstLaunchKey,
      );
}
