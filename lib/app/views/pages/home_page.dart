import 'package:flutter/material.dart';
import 'package:todo_flutter/app/views/widgets/button_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/todo_logo.png',
              ),
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
    );
  }
}
