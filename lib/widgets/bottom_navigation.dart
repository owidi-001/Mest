import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mest/presentation/create/create.dart';
import 'package:mest/presentation/history/history_info.dart';
import 'package:mest/presentation/home/home.dart';
import 'package:mest/presentation/menu/menu_plan.dart';
import 'package:mest/theme/theme.dart';
import 'package:mest/widgets/nav_drawer.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;

  Widget body() {
    switch (_selectedIndex) {
      case 0:
        return const HomeScreen();
      case 1:
        return const MenuScreen();
      case 2:
        return const HistoryScreen();
      default:
        return const HomeScreen();
    }
  }

  void _updateIndex(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavDrawer(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppTheme.gold,
        foregroundColor: AppTheme.dark,
        actions: [
          IconButton(
            onPressed: (() {}),
            icon: const Icon(Icons.search, size: 28, color: AppTheme.dark),
          )
        ],
      ),
      backgroundColor: AppTheme.light,
      body: body(),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppTheme.gold,
        showUnselectedLabels: true,
        unselectedItemColor: AppTheme.gray,
        enableFeedback: true,
        currentIndex: _selectedIndex,
        onTap: _updateIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard_rounded), label: "home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.restaurant_menu_rounded), label: "menu"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.time_solid), label: "history"),
        ],
      ),
    );
  }
}
