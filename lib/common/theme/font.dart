import 'package:flutter/painting.dart';
import 'package:mest/common/theme/theme.dart';

class AppFont {
  static const TextStyle title = TextStyle(
      color: Color(0xFF000000),
      fontSize: 28,
      fontWeight: FontWeight.bold,
      fontFamily: "poppins");

  static const TextStyle subtitle = TextStyle(
      color: AppTheme.dark,
      fontSize: 18,
      fontWeight: FontWeight.bold,
      fontFamily: "poppins");

  static const TextStyle normal = TextStyle(
      color: AppTheme.gray,
      fontSize: 16,
      fontWeight: FontWeight.normal,
      fontFamily: "poppins");
}
