import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mest/theme/theme.dart';
import 'package:mest/widgets/foodCard.dart';
import 'package:mest/widgets/tab_viewer.dart';
import 'package:mest/widgets/tabs.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String day = "Tuesday";
  String month = "April";
  int date = 7;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: AppTheme.whiteColor,
        body: Stack(
          children: <Widget>[
            LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return Container(
                  height: constraints.maxHeight / 2,
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
                    "$day, $month $date",
                    style: const TextStyle(
                        color: AppTheme.lightColor,
                        fontSize: 18,
                        fontWeight: FontWeight.normal),
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            final snackbar = SnackBar(
                content: const Text("Omera this one is yet to be implemented"),
                action: SnackBarAction(
                  label: 'Relaax!',
                  onPressed: () => {},
                ));
            ScaffoldMessenger.of(context).showSnackBar(snackbar);
          },
          tooltip: 'Add new',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
