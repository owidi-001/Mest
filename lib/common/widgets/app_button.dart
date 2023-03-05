import 'package:flutter/material.dart';
import 'package:mest/common/theme/theme.dart';

class AppButton extends StatelessWidget {
  final String title;
  final Function() onTap;
  final Color? background;
  final Color? foreground;
  const AppButton(
      {super.key,
      required this.title,
      required this.onTap,
      this.background,
      this.foreground});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      color: background ?? AppTheme.gold,
      child: MaterialButton(
        onPressed: onTap,
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: double.infinity,
        child: Text(
          title,
          style: TextStyle(
              color: foreground ?? AppTheme.light,
              fontWeight: FontWeight.bold,
              fontSize: 18),
        ),
      ),
    );
  }
}
