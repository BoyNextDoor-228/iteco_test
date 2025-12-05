import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../navigation/app_router.dart';

class AppDrawer extends StatelessWidget {
  /// Creates a [Drawer], designed for Iteco test application.
  const AppDrawer({super.key});

  /// Items to be displayed in [Drawer]'s navigation list;
  List<DrawerNavigationItemInfo> _drawerNavigationItems() => [
    const DrawerNavigationItemInfo(
      itemName: 'Главная страница',
      itemImage: Icon(Icons.home),
      itemRoute: HomeRootRoute(),
    ),
    const DrawerNavigationItemInfo(
      itemName: 'Онбординг',
      itemImage: Icon(Icons.info),
      itemRoute: OnboardingRoute(),
    ),
    const DrawerNavigationItemInfo(
      itemName: 'Список продуктов',
      itemImage: Icon(Icons.fastfood),
      itemRoute: ProductRootRoute(),
    ),
  ];

  @override
  Widget build(BuildContext context) => Drawer(
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: _drawerNavigationItems().length,
              itemBuilder: (context, index) => DrawerNavigationItem(
                info: _drawerNavigationItems()[index],
                isSelected: context.router.current.parent?.name ==
                    _drawerNavigationItems()[index].itemRoute.routeName,
              ),
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text('Выход'),
            leading: const Icon(Icons.close),
            onTap: _closeApplication,
          ),
        ],
      ),
    );


  Future<void> _closeApplication() async =>
      SystemChannels.platform.invokeMethod('SystemNavigator.pop');
}

class DrawerNavigationItemInfo {
  /// Information of a [Drawer] navigation item.
  ///
  /// [itemName] is a text which will be displayed in drawer item.
  /// [itemImage] is an image, which will be displayed in drawer item.
  /// If [Null], default image will be applied.
  /// [itemRoute] is a navigation route, which user will be directed to.
  const DrawerNavigationItemInfo({
    required this.itemName,
    required this.itemImage,
    required this.itemRoute,
  });

  final String itemName;
  final Widget? itemImage;
  final PageRouteInfo itemRoute;
}

class DrawerNavigationItem extends StatelessWidget {
  /// Creates an item to be displayed in [Drawer] navigation.
  ///
  /// [info] is a full information about current drawer item.
  /// [isSelected] determines, if current drawer item is the selected one among
  /// other items.
  const DrawerNavigationItem({
    required this.info,
    required this.isSelected,
    super.key,
  });

  final DrawerNavigationItemInfo info;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final router = context.router;

    return ListTile(
      selected: isSelected,
      title: Text(info.itemName),
      leading: info.itemImage,
      onTap: () async {
        router.popUntilRoot();
        await router.replace(info.itemRoute);
      },
    );
  }
}
