import 'dart:async';

import 'package:flutter/material.dart';

class BlinkingDifficultyAnimation extends StatefulWidget {
  final Function()? onPressed;
  final Color color;

  const BlinkingDifficultyAnimation({
    super.key,
    required this.onPressed,
    required this.color,
  });

  @override
  State<BlinkingDifficultyAnimation> createState() =>
      _BlinkingIconButtonState();
}

class _BlinkingIconButtonState extends State<BlinkingDifficultyAnimation>
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
          icon: Icon(
            Icons.star,
            color: widget.color,
          ),
          constraints: const BoxConstraints(),
          padding: EdgeInsets.zero,
        ));
  }
}
