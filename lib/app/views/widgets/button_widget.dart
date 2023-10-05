import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String path;
  final String title;
  final IconData icon;
  const ButtonWidget(
      {super.key, required this.path, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => Navigator.pushNamed(context, path),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(icon, color: Theme.of(context).colorScheme.background),
                ],
              ),
            ],
          ),
        ));
  }
}
