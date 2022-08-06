import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mest/home.dart';
import 'package:mest/screens/home.dart';
import 'package:mest/screens/new_food.dart';
import 'package:mest/utils/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mest',
      theme: ThemeData(fontFamily: GoogleFonts.lato().fontFamily),
      // initialRoute: '/',
      routes: {
        // "/":(context) => const MyHomePage(),
        CustomRoutes.newFood: (context) => const NewFood(),
      },
      home:  const Home()
    );
  }
}
