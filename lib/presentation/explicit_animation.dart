import 'package:flutter/material.dart';

class ExplicitAnimation extends StatefulWidget {
  const ExplicitAnimation({super.key});

  @override
  State<ExplicitAnimation> createState() => _ExplicitAnimationState();
}

class _ExplicitAnimationState extends State<ExplicitAnimation>
    with TickerProviderStateMixin {
  late AnimationController _spinAnimationController;
  late AnimationController _scaleAnimationController;

  late Animation<double> _rotationAnimation;
  late Animation<AlignmentGeometry> _alignmentAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _spinAnimationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _scaleAnimationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
      lowerBound: 0.5,
      upperBound: 1.0,
    );

    _scaleAnimation = CurvedAnimation(
      parent: _scaleAnimationController,
      curve: Curves.easeInOut,

    );

    _alignmentAnimation = Tween<AlignmentGeometry>(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ).animate(_spinAnimationController);

    _rotationAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: _spinAnimationController,
      curve: Curves.linear,
    ));

    _spinAnimationController.repeat(reverse: true);
    _scaleAnimationController.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Explicit Animation')),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RotationTransition(
              turns: _rotationAnimation,
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(100),
                    bottomRight: Radius.circular(100),
                  ),
                  color: Colors.pink,
                ),
              ),
            ),
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
            ScaleTransition(
              scale: _scaleAnimation,
              child: ElevatedButton(
                onPressed: () {
                  // Optional: bounce on tap
                  _scaleAnimationController.forward(from: 0.9);
                },
                child: Text('Press Me'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _spinAnimationController.dispose();
    _scaleAnimationController.dispose();
    super.dispose();
  }
}
