import 'package:dio/dio.dart';

import '../config/environment.dart';
import '../navigation/app_router.dart';

class AppScope implements IAppScope {
  late final String _appName;
  late final Dio _dio;
  late final AppRouter _router;
  late final int _productPaginationSize;

  @override
  String get appName => _appName;

  @override
  Dio get dio => _dio;

  @override
  Future<void> init() async {
    _appName = Environment.instance.applicationName;
    _dio = Dio(
      BaseOptions(
        baseUrl: Environment.instance.appConfig.serverUrl,
      ),
    );
    _router = AppRouter();
    _productPaginationSize =
        Environment.instance.appConfig.productPaginationSize;
  }

  @override
  AppRouter get router => _router;

  @override
  int get productPaginationSize => _productPaginationSize;
}

/// Scope of dependencies, which may be useful along application worktime.
abstract class IAppScope {
  /// Rest api client.
  Dio get dio;

  /// App Name.
  String get appName;

  /// Class that coordinates navigation for the whole app.
  AppRouter get router;

  /// Size of portion of products for pagination.
  int get productPaginationSize;

  /// Initialization procedure.
  Future<void> init();
}
