import 'dart:ui';

import 'package:flutter/material.dart';

class ImplicitAnimationScreen extends StatefulWidget {
  const ImplicitAnimationScreen({super.key});

  @override
  State<ImplicitAnimationScreen> createState() =>
      _ImplicitAnimationScreenState();
}

class _ImplicitAnimationScreenState extends State<ImplicitAnimationScreen> {
  double _width = 200;
  double _height = 200;
  Color _color = Colors.pink;
  double _opacity = 0.2;
  double _radius = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Implicit Animation')),
      body: SafeArea(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                if (_width == 200 && _height == 200) {
                  _width = 300;
                  _height = 300;
                } else {
                  _width = 200;
                  _height = 200;
                }
                setState(() {});
              },
              child: AnimatedContainer(
                width: _width,
                height: _height,
                decoration: BoxDecoration(
                  color: _width == 300 ? Colors.blue : Colors.red,
                  borderRadius: BorderRadius.circular(_width == 200 ? 20 : 20),
                ),
                duration: Duration(milliseconds: 300),
              ),
            ),
            GestureDetector(
              onTap: () {
                if(_opacity == 0.2){
                  _opacity = 0.9;
                }else{
                  _opacity = 0.2;
                }
                setState(() {});
              },
              child: AnimatedOpacity(
                duration: Duration(
                  milliseconds: 300
                ),
                opacity: _opacity,
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ),
            TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: _radius),
              duration: Duration(seconds:3),
              curve: Curves.bounceIn,
              builder: (BuildContext context, double value, Widget? child) {
                return GestureDetector(
                  onTap: () {
                    _radius = value == 4 ? 32 : 4;
                    setState(() {});
                  },
                  child: Card(
                    color: _color,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(value),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text('Press Me'),
                    ),
                  ),
                );
              },

            ),
          ],
        ),
      ),
    );
  }
}
