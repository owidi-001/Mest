import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mest/services/date.service.dart';
import 'package:mest/theme/theme.dart';
import 'package:mest/widgets/tab_viewer.dart';
import 'package:mest/widgets/tabs.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String day = dateFormat();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Stack(
        children: <Widget>[
          LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return Container(
                height: constraints.maxHeight / 1.8,
                width: MediaQuery.of(context).size.width,
                color: AppTheme.primaryColor,
              );
            },
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const <Widget>[
                    Icon(
                      Icons.menu,
                      size: 32,
                      color: AppTheme.lightColor,
                    ),
                    Icon(
                      CupertinoIcons.bookmark_solid,
                      size: 32,
                      color: AppTheme.lightColor,
                    )
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                const Text(
                  "Pick a dish",
                  style: TextStyle(
                      color: AppTheme.whiteColor,
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 18,
                ),
                Text(
                  day,
                  style: const TextStyle(
                      color: AppTheme.lightColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w100),
                ),
                const SizedBox(
                  height: 32,
                ),
                const MenuTabs(),
                const SizedBox(
                  height: 32,
                ),
                const MenuTabViewer()
              ],
            ),
          )
        ],
      ),
    );
  }
}
