import 'package:flutter/material.dart';

class ExplicitAnimation extends StatefulWidget {
  const ExplicitAnimation({super.key});

  @override
  State<ExplicitAnimation> createState() => _ExplicitAnimationState();
}

class _ExplicitAnimationState extends State<ExplicitAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _rotationAnimation;
  late Animation<AlignmentGeometry> _alignmentAnimation;

  double _radius = 4;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _alignmentAnimation = Tween<AlignmentGeometry>(
        begin: Alignment.centerLeft, end: Alignment.centerRight).animate(
        _animationController);
    _rotationAnimation = Tween<double>(begin: 0, end: 9).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.linear),
    );
    _animationController.repeat(reverse: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Explicit Animation')),

      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //   Create a Elevated Button Using Card with animation
            // RotationTransition(
            //   turns: _rotationAnimation,
            //   child: Container(
            //     height: 100,
            //     width: 100,
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.only(
            //         topLeft: Radius.circular(100),
            //         bottomRight: Radius.circular(100),
            //       ),
            //       color: Colors.pink,
            //     ),
            //   ),
            // ),

            AlignTransition(
              alignment: _alignmentAnimation,
              child: RotationTransition(
                turns: _rotationAnimation,
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(100),
                      bottomRight: Radius.circular(100),
                    ),
                    color: Colors.pink,
                  ),
                ),
              ),
            ),
          ],

        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
