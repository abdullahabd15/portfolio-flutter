import 'package:flutter/material.dart';

class DrawerNav extends StatelessWidget {
  final List<Widget> navigationMenus;

  const DrawerNav({super.key, required this.navigationMenus});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).primaryColor,
      child: ListView(
        children: navigationMenus,
      ),
    );
  }
}
