import 'dart:async';

import 'package:flutter/material.dart';

class BlinkingIconAnimation extends StatefulWidget {
  final Function()? onPressed;
  final IconData icon;
  final double size;
  const BlinkingIconAnimation(
      {super.key,
      required this.onPressed,
      required this.icon,
      required this.size});

  @override
  State<BlinkingIconAnimation> createState() => _BlinkingIconAnimationState();
}

class _BlinkingIconAnimationState extends State<BlinkingIconAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));
    _controller.repeat(reverse: true);
    _timer = Timer(const Duration(milliseconds: 1800), () {
      setState(() {
        _controller.stop();
        _timer?.cancel();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _controller,
      child: IconButton(
        onPressed: widget.onPressed,
        icon: Icon(widget.icon),
        iconSize: widget.size,
      ),
    );
  }
}
