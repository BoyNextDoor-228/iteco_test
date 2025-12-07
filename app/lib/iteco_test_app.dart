import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/theme.dart';
import 'di/app_scope.dart';

class ItecoTestApp extends StatefulWidget {
  const ItecoTestApp({super.key});

  @override
  State<ItecoTestApp> createState() => _ItecoTestAppState();
}

class _ItecoTestAppState extends State<ItecoTestApp> {
  /// Scope with all application dependencies.
  late IAppScope _appScope;

  /// App scope initialization procedure, which will be finished in [Future].
  late Future<void> _appScopeInitialization;

  void _initScope() {
    _appScope = AppScope();
    _appScopeInitialization = _appScope.init();
  }

  @override
  void initState() {
    super.initState();
    _initScope();
  }

  @override
  Widget build(BuildContext context) => FutureBuilder(
        future: _appScopeInitialization,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const MaterialApp(
              home: Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          }

          return Provider<IAppScope>.value(
            value: _appScope,
            child: MaterialApp.router(
              title: _appScope.appName,
              routerConfig: _appScope.router.config(),
              theme: lightTheme,
              darkTheme: darkTheme,
            ),
          );
        },
      );
}
