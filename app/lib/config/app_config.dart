// ignore_for_file: do_not_use_environment
import 'package:flutter/foundation.dart';

@immutable
final class AppConfig {
  /// Configuration for application.
  const AppConfig({
    required this.serverUrl,
    required this.productPaginationSize,
  });

  /// Creates instance using data from the environment.
  factory AppConfig.fromEnvironment() => const AppConfig(
        serverUrl: String.fromEnvironment('iteco_test_server_url'),
        productPaginationSize:
            int.fromEnvironment('iteco_test_products_pagination_size'),
      );

  /// API server url.
  final String serverUrl;

  /// Size of portion of products for pagination;
  final int productPaginationSize;

  /// Creates an instance of [AppConfig] with modified parameters.
  AppConfig copyWith({
    String? serverUrl,
    int? productPaginationSize,
  }) =>
      AppConfig(
        serverUrl: serverUrl ?? this.serverUrl,
        productPaginationSize:
            productPaginationSize ?? this.productPaginationSize,
      );
}
