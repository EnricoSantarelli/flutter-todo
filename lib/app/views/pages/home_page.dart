import 'package:flutter/material.dart';

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
              ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/dashboard'),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Text(
                          'Start',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(Icons.arrow_forward_rounded,
                                color:
                                    Theme.of(context).colorScheme.background),
                          ],
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
