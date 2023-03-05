import 'package:flutter/material.dart';

InputDecoration buildInputDecoration(
  String labelText,
  String hintText,
) {
  return InputDecoration(
    contentPadding: const EdgeInsets.fromLTRB(0, 15, 20, 15),
    // hintText: hintText,
    // hintStyle: const TextStyle(color: Colors.white70),
    label: Text(labelText),
    labelStyle: const TextStyle(color: Colors.blueGrey),
    border: const UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.blueGrey),
    ),
    enabledBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.blueGrey),
    ),
    focusedBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.white70),
    ),
  );
}
