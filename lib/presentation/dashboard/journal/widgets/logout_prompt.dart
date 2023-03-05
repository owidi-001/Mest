import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:mest/routes/routes.dart';
import 'package:mest/theme/font.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: AlertDialog(
      title: const Text('Do you want to exit this application?'),
      content: const Text('We hate to see you leave...'),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          child: Text(
            'No',
            style: AppFont.normal.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        TextButton(
          onPressed: () {
            // SystemChannels.platform.invokeMethod('SystemNavigator.pop');
            context.go(AppRoute.login);
          },
          child: Text(
            'Yes',
            style: AppFont.normal.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    ));
  }
}
