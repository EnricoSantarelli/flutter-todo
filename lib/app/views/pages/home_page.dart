import 'package:flutter/material.dart';
import 'package:todo_flutter/app/views/animation/expand_logo_animation.dart';
import 'package:todo_flutter/app/views/animation/opacity_title_animation.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
            gradient: RadialGradient(
          colors: [
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.background,
          ],
          stops: const [0.01, 1],
          center: Alignment.center,
        )),
        child: const Scaffold(
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ExpandLogoAnimation(),
                OpacityTitleAnimation(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
