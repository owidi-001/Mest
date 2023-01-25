import 'package:flutter/material.dart';
import 'package:mest/theme/theme.dart';

class AppButton extends StatelessWidget {
  final String title;
  final Function() onTap;
  const AppButton({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
            foregroundColor: AppTheme.light, backgroundColor: AppTheme.red),
        child: Text(
          title,
          style: const TextStyle(
              color: AppTheme.light, fontWeight: FontWeight.bold),
        ));
  }
}
