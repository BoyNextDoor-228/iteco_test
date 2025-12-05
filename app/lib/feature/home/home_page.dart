import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import '../../app/widget/drawer.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('hello'),
        ),
        drawer: const AppDrawer(),
        body: const Center(
          child: Text('Here goes home page'),
        ),
      );
}
