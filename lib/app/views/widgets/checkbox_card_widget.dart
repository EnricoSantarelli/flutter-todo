import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/app/controllers/tasks_store.dart';
import 'package:todo_flutter/app/helpers/enums/order_enum.dart';

class CheckboxCardWidget extends StatelessWidget {
  final String title;
  final OrderEnum value;
  const CheckboxCardWidget(
      {super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<TasksStore>(context, listen: false);

    return Observer(builder: (context) {
      return RadioListTile<OrderEnum>(
        activeColor: Theme.of(context).colorScheme.primary,
        title: Text(title, style: Theme.of(context).textTheme.titleSmall!),
        controlAffinity: ListTileControlAffinity.leading,
        dense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        value: value,
        onChanged: (value) {
          store.orderby = value!;
          store.filterTasksList();
        },
        groupValue: store.orderby,
      );
    });
  }
}
