import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app/widget/drawer.dart';
import '../../../di/app_scope.dart';
import '../../../generated/l10n.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appName = context.read<IAppScope>().appName;

    final textStyle = Theme.of(context).textTheme.headlineSmall;
    final text = S.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(appName)),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const Expanded(
              child: Icon(
                Icons.home,
                size: 200,
              ),
            ),
            Expanded(
              flex: 2,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Text(
                  text.home_screen_info_text,
                  style: textStyle,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
