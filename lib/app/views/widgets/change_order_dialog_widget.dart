import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/app/controllers/tasks_store.dart';
import 'package:todo_flutter/app/helpers/enums/order_enum.dart';
import 'package:todo_flutter/app/helpers/enums/status_enum.dart';
import 'package:todo_flutter/app/views/widgets/checkbox_card_widget.dart';

class ChangeOrderDialogWidget extends StatelessWidget {
  const ChangeOrderDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<TasksStore>(context, listen: false);

    return AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Order by ",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            ),
            const SizedBox(height: 16),
            const CheckboxCardWidget(
              title: "Status",
              value: OrderEnum.status,
            ),
            const CheckboxCardWidget(
              title: "Difficulty",
              value: OrderEnum.difficulty,
            ),
            const CheckboxCardWidget(
              title: "Creation time",
              value: OrderEnum.creationTime,
            ),
            const SizedBox(height: 8),
            Text("Filter by ",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Theme.of(context).colorScheme.primary)),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Observer(builder: (context) {
                return DropdownButtonHideUnderline(
                  child: DropdownButton(
                      hint: Text(
                        "Status",
                        style: Theme.of(context).textTheme.titleSmall!,
                      ),
                      value: store.filterByStatus,
                      items: StatusEnum.values.map((StatusEnum status) {
                        return DropdownMenuItem(
                            value: status,
                            child: Text(status.name,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onBackground)));
                      }).toList(),
                      onChanged: ((value) {
                        store.filterByStatus = value!;
                        store.filterTasksList();
                      })),
                );
              }),
            ),
            Observer(builder: (context) {
              return Stack(
                children: [
                  RangeSlider(
                    activeColor: Theme.of(context).colorScheme.primary,
                    values: store.filterByDifficulty,
                    onChanged: (value) {
                      store.filterByDifficulty = value;
                      store.filterTasksList();
                    },
                    max: 5,
                    min: 1,
                    labels: RangeLabels(
                      store.filterByDifficulty.start.round().toString(),
                      store.filterByDifficulty.end.round().toString(),
                    ),
                    divisions: 4,
                  ),
                  Center(
                      child: Padding(
                    padding: const EdgeInsets.only(top: 28.0),
                    child: Text("Difficulty",
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: Theme.of(context).colorScheme.onBackground)),
                  ))
                ],
              );
            })
          ],
        ));
  }
}
