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
  double _radius = 4;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: Duration(seconds: 2));
    _rotationAnimation = Tween<double>(
      begin: 0, end: 2
    ).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));
    _animationController.repeat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Explicit Animation')),

      body: SafeArea(
        child: Column(
          children: [
            // ElevatedButton(
            //   onPressed: () {
            //     _radius = _radius == 4 ? 32 : 4;
            //     setState(() {});
            //   },
            //   style: ElevatedButton.styleFrom(
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(_radius),
            //     ),
            //     backgroundColor: Colors.black54,
            //     foregroundColor: Colors.white,
            //   ),
            //   child: Text('Press here'),
            // ),

            //   Create a Elevated Button Using Card with animation
            RotationTransition(
                turns: _rotationAnimation,
                child: Container(height: 100, width: 100, color: Colors.pink,)),

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
