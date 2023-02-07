import 'package:flutter/material.dart';
import 'package:mest/theme/theme.dart';

InputDecoration buildInputDecoration(String hintText, IconData icon) {
  return InputDecoration(
      prefixIcon: Icon(icon),
      iconColor: AppTheme.gold,
      contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
      hintText: hintText,
      label: Text(hintText),
      labelStyle: const TextStyle(color: AppTheme.light),
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: AppTheme.light),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder:
          OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          fillColor: AppTheme.gold
          );
}
