import 'package:flutter/material.dart';
import 'package:mest/theme/theme.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppTheme.light,
      child: Column(children: <Widget>[
        const DrawerHeader(
          decoration: BoxDecoration(
              color: AppTheme.red,
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/illustrators/food.png'))),
          child: null,
        ),
        ListTile(
          leading: const Icon(Icons.verified_user),
          title: const Text('Profile'),
          onTap: () => {Navigator.of(context).pop()},
        ),
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text('Settings'),
          onTap: () => {Navigator.of(context).pop()},
        ),
        ListTile(
          leading: const Icon(Icons.border_color),
          title: const Text('Feedback'),
          onTap: () => {Navigator.of(context).pop()},
        ),
        Expanded(
            child: Container(
          alignment: Alignment.bottomLeft,
          // color: AppTheme.blue,
          child: ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Logout'),
            onTap: () => {Navigator.of(context).pop()},
          ),
        )),
      ]),
    );
  }
}

// menu item
