import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  final double? elevation;
  final String? title;
  final Widget? leading;
  final Color? backgroundColor;
  final List<Widget>? actions;
  const AppBarWidget(
      {super.key,
      this.elevation,
      this.title,
      this.leading,
      this.actions,
      this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: backgroundColor,
        elevation: elevation,
        leading: leading,
        centerTitle: true,
        actions: actions,
        title: title != null
            ? Text(
                title!,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              )
            : const SizedBox.shrink());
  }
}
