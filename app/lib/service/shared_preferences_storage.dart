import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesAppDataStorage implements AbstractAppDataStorage {
  /// [SharedPreferences] implementation of [AbstractAppDataStorage].
  SharedPreferencesAppDataStorage({
    required this.sharedPreferences,
  });

  final SharedPreferences sharedPreferences;

  @override
  Future<bool?> getIsFirstLaunch(String key) async {
    try {
      if (!sharedPreferences.containsKey(key)) {
        return true;
      }
      // If storage doesn't have this key, it's obvious application has been
      // launched for the first time.
      return sharedPreferences.getBool(key) ?? true;
    } on Exception catch (exception) {
      log("Exception while getting 'isFirstLaunch' key from SharedPreferences:\n"
          '$exception');

      return true;
    }
  }

  @override
  Future<void> setIsFirstLaunch(String key, bool value) async {
    try {
      await sharedPreferences.setBool(key, false);
    } on Exception catch (exception) {
      log("Exception while setting 'isFirstLaunch' key in SharedPreferences:\n"
          '$exception');
    }
  }
}

abstract class AbstractAppDataStorage {
  Future<bool?> getIsFirstLaunch(String key);

  Future<void> setIsFirstLaunch(String key, bool value);
}
