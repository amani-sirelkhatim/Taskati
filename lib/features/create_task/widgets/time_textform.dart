import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:seccion6/core/utils/app_colors.dart';
import 'package:seccion6/core/utils/styles.dart';

class timeTextform extends StatefulWidget {
  const timeTextform({super.key});

  @override
  State<timeTextform> createState() => _timeTextformState();
}

class _timeTextformState extends State<timeTextform> {
  String startTime = DateFormat('hh:mm a').format(DateTime.now());
  String endTime = DateFormat('hh:mm a')
      .format(DateTime.now().add(const Duration(minutes: 15)));
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Start Time :',
              style: getTitleStyle(
                  fontWeight: FontWeight.bold, color: AppColor.primarycolor),
            ),
            Gap(10),
            TextFormField(
              readOnly: true,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Start time is required';
                }
                return null;
              },
              decoration: InputDecoration(
                  hintText: startTime,
                  suffixIcon: IconButton(
                      onPressed: () {
                        shawStartTimeDialog();
                      },
                      icon: Icon(
                        Icons.watch_later_outlined,
                        color: AppColor.primarycolor,
                      ))),
            ),
          ],
        )),
        Gap(10),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'End Time :',
              style: getTitleStyle(
                  fontWeight: FontWeight.bold, color: AppColor.primarycolor),
            ),
            Gap(10),
            TextFormField(
              readOnly: true,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'End time is required';
                }
                return null;
              },
              decoration: InputDecoration(
                  hintText: endTime,
                  suffixIcon: IconButton(
                      onPressed: () {
                        shawEndTimeDialog();
                      },
                      icon: Icon(
                        Icons.watch_later_outlined,
                        color: AppColor.primarycolor,
                      ))),
            ),
          ],
        ))
      ],
    );
  }

  shawStartTimeDialog() async {
    TimeOfDay? pickedStartTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedStartTime != null) {
      setState(() {
        startTime = pickedStartTime.format(context);
        endTime = pickedStartTime
            .replacing(minute: pickedStartTime.minute + 15)
            .format(context);
      });
    }
  }

  shawEndTimeDialog() async {
    TimeOfDay? pickedStartTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedStartTime != null) {
      setState(() {
        endTime = pickedStartTime.format(context);
      });
    }
  }
}
