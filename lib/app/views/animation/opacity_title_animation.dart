import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todo_flutter/app/views/widgets/button_widget.dart';

class OpacityTitleAnimation extends StatefulWidget {
  const OpacityTitleAnimation({super.key});

  @override
  State<OpacityTitleAnimation> createState() => _OpacityTitleAnimationState();
}

class _OpacityTitleAnimationState extends State<OpacityTitleAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    Timer(const Duration(seconds: 2), () {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    late final Animation<double> animation =
        CurvedAnimation(parent: _controller, curve: Curves.linear);

    return FadeTransition(
      opacity: animation,
      child: Column(
        children: [
          Text(
            'To-Do List',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Text(
            'Task organization tool',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(
            height: 64,
          ),
          ButtonWidget(
              onPressed: () => Navigator.pushNamed(context, '/dashboard'),
              title: 'Start',
              icon: Icons.arrow_forward_rounded)
        ],
      ),
    );
  }
}
