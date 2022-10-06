import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tip_calculator/config.dart';
import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Easy Tip Calculator',
      theme: _buildTheme(Brightness.light),
      // ThemeData(
      //     primarySwatch: Colors.blue,
      //     scaffoldBackgroundColor: Colors.white,
      //     textTheme:
      // ),
      home: const MyHomePage(title: 'Easy Tip Calculator'),
    );
  }

  ThemeData _buildTheme(brightness) {
    var baseTheme = ThemeData(
      brightness: brightness,
      primarySwatch: Colors.blue,
      scaffoldBackgroundColor: themeColor1,
    );

    return baseTheme.copyWith(
      textTheme: GoogleFonts.latoTextTheme(baseTheme.textTheme),
    );
  }
}
