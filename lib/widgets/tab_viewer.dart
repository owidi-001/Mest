import 'package:flutter/material.dart';
import 'package:mest/widgets/breakfast_view.dart';
import 'package:mest/widgets/lunch_view.dart';
import 'package:mest/widgets/snack_view.dart';
import 'package:mest/widgets/supper_view.dart';

class MenuTabViewer extends StatefulWidget {
  const MenuTabViewer({Key? key}) : super(key: key);

  @override
  State<MenuTabViewer> createState() => _MenuTabViewerState();
}

class _MenuTabViewerState extends State<MenuTabViewer> {
  @override
  Widget build(BuildContext context) {
    return const Flexible(
      child: TabBarView(children: [
        BreakFastView(),
        LunchView(),
        SupperView(),
        SnackView()
      ]),
    );
  }
}
