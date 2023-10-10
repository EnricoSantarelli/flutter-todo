import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  final double? elevation;
  final String? title;
  final Widget? leading;
  final Color? backgroundColor;
  const AppBarWidget(
      {super.key,
      this.elevation,
      this.title,
      this.leading,
      this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: backgroundColor,
        elevation: elevation,
        leading: leading,
        centerTitle: true,
        title: title != null
            ? Text(
                title!,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
              )
            : const SizedBox.shrink());
  }
}
