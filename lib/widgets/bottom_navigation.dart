import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mest/theme/theme.dart';

class BottomAppNavigation extends StatefulWidget {
  const BottomAppNavigation({Key? key}) : super(key: key);

  @override
  State<BottomAppNavigation> createState() => _BottomAppNavigationState();
}

class _BottomAppNavigationState extends State<BottomAppNavigation> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppTheme.primaryColor,
      unselectedItemColor: AppTheme.secondaryColor,
      showUnselectedLabels: false,
      selectedLabelStyle: const TextStyle(color: AppTheme.primaryColor),
      items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home_filled),
          label: "Home"),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.bookmark_solid),
          label: "Saved"),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.pencil_ellipsis_rectangle),
          label: "New"),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.list_bullet),
          label: "All"),
      ]
      );
  }
}