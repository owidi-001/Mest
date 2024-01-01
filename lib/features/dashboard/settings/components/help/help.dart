import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[200],
          elevation: 0,
          title: const Text('Help'),
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: 'Getting Started'),
              Tab(text: 'Buying Books'),
              Tab(text: 'Reading Controls'),
              Tab(text: 'Account Management'),
              Tab(text: 'Troubleshooting'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            GettingStarted(),
            BuyingBooks(),
            ReadingControls(),
            AccountManagement(),
            TroubleShooting()
          ],
        ),
      ),
    );
  }
}

class GettingStarted extends StatelessWidget {
  const GettingStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class BuyingBooks extends StatelessWidget {
  const BuyingBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class ReadingControls extends StatelessWidget {
  const ReadingControls({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class AccountManagement extends StatelessWidget {
  const AccountManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class TroubleShooting extends StatelessWidget {
  const TroubleShooting({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
