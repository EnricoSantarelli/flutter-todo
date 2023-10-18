import 'package:flutter/material.dart';
import 'package:todo_flutter/app/views/animation/expand_logo_animation.dart';
import 'package:todo_flutter/app/views/widgets/button_widget.dart';

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
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ExpandLogoAnimation(),
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
          ),
        ),
      ),
    );
  }
}
