import 'package:flutter/material.dart';
import 'package:mest/theme/theme.dart';

class MenuTabs extends StatefulWidget {
  const MenuTabs({Key? key}) : super(key: key);

  @override
  State<MenuTabs> createState() => _MenuTabsState();
}

class _MenuTabsState extends State<MenuTabs> {
  @override
  Widget build(BuildContext context) {
    return const TabBar(
      indicatorPadding: EdgeInsets.only(top: 18),
      indicatorWeight: 3,
      indicatorColor: AppTheme.lightColor,
      tabs: <Widget>[
        Text("Tea"),
        Text("Lunch"),
        Text("Supper"),
        Text("Snacks")
      ],
    );
  }
}
