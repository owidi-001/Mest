import 'package:flutter/material.dart';
import 'package:mest/theme/theme.dart';

Widget makeInput({label, obsureText = false,currentValue=""}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: const TextStyle(
            fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
      ),
      const SizedBox(
        height: 5,
      ),
      TextFormField(
        obscureText: obsureText,
        initialValue:currentValue,
        decoration:  const InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppTheme.primaryColor,
            ),
          ),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: AppTheme.primaryColor)),
        ),
      ),
      const SizedBox(
        height: 30,
      )
    ],
  );
}