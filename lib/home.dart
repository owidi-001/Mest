import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mest/screens/all_foods.dart';
import 'package:mest/screens/favourite_foods.dart';
import 'package:mest/screens/home.dart';
import 'package:mest/screens/new_food.dart';
import 'package:mest/theme/theme.dart';
import 'package:mest/widgets/bottom_navigation.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List _screens = [
    const MainPage(),
    const FavouriteFoods(),
    const NewFood(),
    AllFoods()
  ];

  void _updateIndex(int value) {
    if (kDebugMode) {
      print(_currentIndex);
    }
    setState(() {
      _currentIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.whiteColor,
      body: _screens[_currentIndex],
      // body: AllFoods(),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: _updateIndex,
          selectedItemColor: AppTheme.primaryColor,
          unselectedItemColor: AppTheme.secondaryColor,
          showUnselectedLabels: false,
          selectedLabelStyle: const TextStyle(color: AppTheme.primaryColor),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home_filled), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.bookmark_solid), label: "Saved"),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.pencil_ellipsis_rectangle),
                label: "New"),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.list_bullet), label: "All"),
          ]),
    );
  }
}
