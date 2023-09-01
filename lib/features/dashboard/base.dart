import 'package:flutter/material.dart';
import 'package:mest/features/dashboard/widgets/dashboard.dart';
import 'package:mest/features/dashboard/widgets/drawer.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(children: [
        DrawerWidget(),
        BaseScaffold(),
      ]),
    );
  }
}
