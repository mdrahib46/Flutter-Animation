import 'package:flutter/material.dart';
import 'package:flutter_animation/presentation/explicit_animation.dart';
import 'package:flutter_animation/presentation/home_page.dart';

class FlutterAnimation extends StatelessWidget {
  const FlutterAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black87,
          foregroundColor: Colors.white,
          titleTextStyle: TextStyle(
            letterSpacing: 0.9,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: ExplicitAnimation(),
    );
  }
}
