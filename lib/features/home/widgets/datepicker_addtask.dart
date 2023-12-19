import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:seccion6/core/functions/functions.dart';
import 'package:seccion6/core/utils/app_colors.dart';
import 'package:seccion6/core/utils/styles.dart';
import 'package:seccion6/core/widgets/custom_button.dart';
import 'package:seccion6/features/create_task/add_task.dart';

class secondPart extends StatefulWidget {
  const secondPart({super.key});

  @override
  State<secondPart> createState() => _secondPartState();
}

class _secondPartState extends State<secondPart> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateFormat.MMMMEEEEd().format(DateTime.now()),
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                Text(
                  'Today',
                  style: Theme.of(context).textTheme.displayLarge,
                )
              ],
            ),
            Spacer(),
            CustomButton(
              text: '+ Add Task',
              onTap: () {
                pushWithReplacment(context, AddTask());
              },
              style: getSmallStyle(
                  color: AppColor.whitecolor, fontWeight: FontWeight.bold),
            )
          ],
        ),
        Gap(15),
      ],
    );
  }
}
