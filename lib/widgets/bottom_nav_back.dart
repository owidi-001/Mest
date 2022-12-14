import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mest/presentation/create/create.dart';
import 'package:mest/presentation/history/history_info.dart';
import 'package:mest/presentation/home/home.dart';
import 'package:mest/presentation/menu/menu_plan.dart';
import 'package:mest/theme/theme.dart';

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
      body: body(),
      
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppTheme.primary,
        showUnselectedLabels: true,
        unselectedItemColor: AppTheme.secondary,
        enableFeedback: true,
        currentIndex: _selectedIndex,
        onTap: _updateIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.circle_grid_hex), label: "home"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.table_badge_more_fill), label: "menu"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.time_solid), label: "history"),
        ],
      ),
    );
  }
}
