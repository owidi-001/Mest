import 'package:flutter/material.dart';
import 'package:mest/presentation/dashboard/widgets/dashboard.dart';
import 'package:mest/presentation/dashboard/widgets/drawer.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: const [
        DrawerWidget(),
        BaseScaffold(),
      ]),
    );
  }
}
