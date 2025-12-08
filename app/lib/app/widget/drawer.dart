import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../generated/l10n.dart';
import '../../navigation/app_router.dart';

class AppDrawer extends StatelessWidget {
  /// Creates a [Drawer], designed for Iteco test application.
  const AppDrawer({super.key});

  /// Items to be displayed in [Drawer]'s navigation list;
  List<DrawerNavigationItemInfo> _drawerNavigationItems(S text) => [
        DrawerNavigationItemInfo(
          itemName: text.main_page,
          itemImage: const Icon(Icons.home),
          itemRoute: const HomeRootRoute(),
        ),
        DrawerNavigationItemInfo(
          itemName: text.products_list,
          itemImage: const Icon(Icons.fastfood),
          itemRoute: const ProductRootRoute(),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    final text = S.of(context);

    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: _drawerNavigationItems(text).length,
              itemBuilder: (context, index) => DrawerNavigationItem(
                info: _drawerNavigationItems(text)[index],
                isSelected: context.router.current.parent?.name ==
                    _drawerNavigationItems(text)[index].itemRoute.routeName,
              ),
            ),
          ),
          const Divider(),
          ListTile(
            title: Text(text.quit),
            leading: const Icon(Icons.close),
            onTap: _closeApplication,
          ),
        ],
      ),
    );
  }

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

  /// Full information about current [Drawer] item.
  final DrawerNavigationItemInfo info;

  /// If current [Drawer] is the selected one among other items.
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
