import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mest/database/helper.dart';
import 'package:mest/models/food.model.dart';
import 'package:mest/theme/theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isReadmore = false;

  // Initialize db items
  // All menu
  List<Map<String, dynamic>> _menus = [];
  Food food = Food.empty();

  bool _isLoading = true;

  void _randomMenu() async {
    final data = await SQLHelper.getMenu();

    setState(() {
      _menus = data;
      _isLoading = false;

      // Set random menu
      if (_menus.isNotEmpty) {
        Random random = Random();
        food = Food.fromMap(
            _menus[random.nextInt(_menus.length)]); // Create food from map
      } else {
        food = Food.empty();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _randomMenu(); // loads menu when app starts
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/home_bg.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.5,
                decoration: const BoxDecoration(
                  color: AppTheme.gold,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 36.0, left: 8.0, right: 8.0, bottom: 0),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: _menus.isNotEmpty
                            ? Image.memory(
                                const Base64Decoder().convert(food.image))
                            : Image.asset(food.image),
                      ),
                      Positioned(
                        bottom: 12,
                        right: 10,
                        child: ElevatedButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text('Is yet to be implemented!'),
                            ));
                          },
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 12),
                            textStyle: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                            shape: const StadiumBorder(),
                            backgroundColor: AppTheme.gray,
                          ),
                          child: const Text("Pick this"),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: const BoxDecoration(
                color: AppTheme.light,
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        // Capitalize,
                        food.name.substring(0, 1).toUpperCase() +
                            food.name.substring(1),
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.gold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      buildDescription(food.description),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            // toggle the bool variable true or false
                            isReadmore = !isReadmore;
                          });
                        },
                        child: Text(
                          (isReadmore ? 'Read Less' : 'Read More'),
                          style: const TextStyle(color: AppTheme.gold),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.small(
        onPressed: () => {
          setState(() {
            _randomMenu();
          })
        },
        backgroundColor: AppTheme.gold,
        foregroundColor: AppTheme.light,
        child: const Icon(CupertinoIcons.shuffle_thick),
      ),
    );
  }

  Widget buildDescription(String text) {
    // if read more is false then show only 3 lines from text
    // else show full text
    final lines = isReadmore ? null : 8;
    return Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 14,
        color: AppTheme.gray,
      ),
      maxLines: lines,
      // overflow properties is used to show 3 dot in text widget
      // so that user can understand there are few more line to read.
      overflow: isReadmore ? TextOverflow.visible : TextOverflow.fade,
    );
  }
}
