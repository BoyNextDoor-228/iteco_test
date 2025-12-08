import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../config/environment.dart';
import '../navigation/app_router.dart';
import '../navigation/route_guard/app_first_launch_guard.dart';
import '../service/shared_preferences_storage.dart';

class AppScope implements IAppScope {
  late final String _appName;
  late final Dio _dio;
  late final AppRouter _router;
  late final int _productPaginationSize;

  /// Storage of dynamic application data;
  late final AbstractAppDataStorage _appDataStorage;

  @override
  String get appName => _appName;

  @override
  Dio get dio => _dio;

  @override
  Future<void> init() async {
    _appDataStorage = SharedPreferencesAppDataStorage(
      sharedPreferences: await SharedPreferences.getInstance(),
    );
    _appName = Environment.instance.applicationName;
    _dio = Dio(
      BaseOptions(
        baseUrl: Environment.instance.appConfig.serverUrl,
      ),
    );

    var isFirstLaunch = await _appDataStorage
        .getIsFirstLaunch(Environment.instance.appConfig.isFirstLaunchKey);
    if (isFirstLaunch == null || isFirstLaunch) {
      await _appDataStorage.setIsFirstLaunch(
        Environment.instance.appConfig.isFirstLaunchKey,
        false,
      );
      isFirstLaunch = true; // If isFirstLaunch was null
    }

    _router = AppRouter(
      appFirstLaunchGuard: AppFirstLaunchGuard(isFirstLaunch: isFirstLaunch),
    );
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
