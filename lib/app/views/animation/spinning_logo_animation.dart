import 'package:flutter/material.dart';

class SpinningLogoAnimation extends StatefulWidget {
  const SpinningLogoAnimation({super.key});

  @override
  State<SpinningLogoAnimation> createState() => _SpinningLogoAnimationState();
}

class _SpinningLogoAnimationState extends State<SpinningLogoAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this)
          ..repeat(reverse: false);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    late final Animation<double> animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.decelerate,
    );

    return RotationTransition(
      turns: animation,
      child: Image.asset(
        'assets/todo_logo.png',
      ),
    );
  }
}
