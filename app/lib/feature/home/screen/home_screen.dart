import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app/widget/drawer.dart';
import '../../../di/app_scope.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appName = context.read<IAppScope>().appName;

    final textStyle = Theme.of(context).textTheme.headlineSmall;

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
                  'Тут находится домашняя страница, которая была сделана просто так.'
                  '\n\n'
                  'Если ищите страницу со списком продуктов, то, возможно, Вам стоит заглянуть в бургер-меню.'
                  '\n\n'
                  'А ещё можно посмотреть на приложение, если включить на устройстве тёмный режим',
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
