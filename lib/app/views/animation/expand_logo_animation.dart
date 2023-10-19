import 'package:flutter/material.dart';

class ExpandLogoAnimation extends StatefulWidget {
  const ExpandLogoAnimation({super.key});

  @override
  State<ExpandLogoAnimation> createState() => _ExpandLogoAnimationState();
}

class _ExpandLogoAnimationState extends State<ExpandLogoAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2), );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    late final Animation<double> animation =
        CurvedAnimation(parent: _controller, curve: Curves.bounceOut);

    return ScaleTransition(
      scale: animation,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/todo_logo.png',
          ),
        ],
      ),
    );
  }
}
