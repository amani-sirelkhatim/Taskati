import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:seccion6/core/functions/functions.dart';
import 'package:seccion6/core/storage/task_model.dart';
import 'package:seccion6/core/utils/app_colors.dart';
import 'package:seccion6/core/utils/styles.dart';
import 'package:seccion6/core/widgets/custom_button.dart';

import 'package:seccion6/features/create_task/widgets/custom_textform.dart';

import 'package:seccion6/features/home/home_view.dart';

class updateTask extends StatefulWidget {
  const updateTask({super.key, required this.id});
  final String id;
  @override
  State<updateTask> createState() => _updateTaskState();
}

class _updateTaskState extends State<updateTask> {
  var formkey = GlobalKey<FormState>();
  var titlecon = TextEditingController();
  var notecon = TextEditingController();
  String date = DateFormat.yMd().format(DateTime.now());
  String startTime = DateFormat('hh:mm a').format(DateTime.now());
  String endTime = DateFormat('hh:mm a')
      .format(DateTime.now().add(const Duration(minutes: 15)));
  int colorindex = 0;

  late Box<task> box;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var taskid = widget.id;
    var specifictask = Hive.box<task>('task').get(taskid);
    List<dynamic> tasklist = [];
    if (specifictask != null) {
      tasklist.add(specifictask.title);
      tasklist.add(specifictask.note);
      tasklist.add(specifictask.date);
      tasklist.add(specifictask.starttime);
      tasklist.add(specifictask.endtime);
    }

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              pushWithReplacment(context, homeView());
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: AppColor.primarycolor,
            )),
        title: Text(
          'Update Task',
          style: getTitleStyle(color: AppColor.primarycolor),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(0),
                  Text(
                    'Title :',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  Gap(10),
                  TextFormField(
                      style: Theme.of(context).textTheme.displaySmall,
                      controller: titlecon,
                      decoration: InputDecoration(
                          hintText: tasklist[0],
                          hintStyle: Theme.of(context).textTheme.displaySmall)),
                  const Gap(10),
                  Text(
                    'Note :',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  Gap(10),
                  TextFormField(
                      style: Theme.of(context).textTheme.displaySmall,
                      maxLines: 4,
                      controller: notecon,
                      decoration: InputDecoration(
                          hintText: tasklist[1],
                          hintStyle: Theme.of(context).textTheme.displaySmall)),
                  const Gap(10),
                  Text(
                    'Date: ',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  Gap(10),
                  TextFormField(
                    readOnly: true,
                    decoration: InputDecoration(
                        hintText: tasklist[2],
                        hintStyle: Theme.of(context).textTheme.displaySmall,
                        suffixIcon: IconButton(
                            onPressed: () {
                              showDateDialog();
                            },
                            icon: Icon(
                              Icons.calendar_month,
                              color: AppColor.primarycolor,
                            ))),
                  ),
                  const Gap(10),
                  Row(
                    children: [
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Start Time :',
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                          Gap(10),
                          TextFormField(
                            readOnly: true,
                            decoration: InputDecoration(
                                hintText: tasklist[3],
                                hintStyle:
                                    Theme.of(context).textTheme.displaySmall,
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
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                          Gap(10),
                          TextFormField(
                            readOnly: true,
                            decoration: InputDecoration(
                                hintText: tasklist[4],
                                hintStyle:
                                    Theme.of(context).textTheme.displaySmall,
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
                  ),
                  const Gap(30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              colorindex = 0;
                            });
                          },
                          child: colorwidget(
                              isChecked: ((colorindex == 0) ? true : false),
                              color: AppColor.primarycolor)),
                      Gap(5),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              colorindex = 1;
                            });
                          },
                          child: colorwidget(
                              isChecked: ((colorindex == 1) ? true : false),
                              color: AppColor.redcolor)),
                      Gap(5),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              colorindex = 2;
                            });
                          },
                          child: colorwidget(
                              isChecked: ((colorindex == 2) ? true : false),
                              color: AppColor.orangecolor)),
                      Spacer(),
                      CustomButton(
                        text: 'Update task',
                        onTap: () async {
                          if (formkey.currentState!.validate()) {
                            String id = titlecon.text +
                                DateTime.now().toIso8601String();
                            await box.put(
                                id,
                                task(
                                    id: id,
                                    title: titlecon.text,
                                    note: notecon.text,
                                    date: date,
                                    starttime: startTime,
                                    endtime: endTime,
                                    colorchosen: colorindex,
                                    iscompleted: false));
                            pushWithReplacment(context, homeView());
                          }
                        },
                        width: 120,
                      )
                    ],
                  )
                ],
              ),
            )),
      ),
    ));
  }

  void showDateDialog() async {
    DateTime? datePicked = await showDatePicker(
      context: context,
      firstDate: DateTime(2023),
      initialDate: DateTime.now(),
      lastDate: DateTime(2050),
    );
    if (datePicked != null) {
      setState(() {
        date = DateFormat.yMd().format(datePicked);
      });
    }
  }

  void shawStartTimeDialog() async {
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

  void shawEndTimeDialog() async {
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

class colorwidget extends StatelessWidget {
  const colorwidget({
    super.key,
    required this.color,
    required this.isChecked,
  });
  final bool isChecked;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: CircleAvatar(
        radius: 15,
        backgroundColor: color,
        child: (isChecked)
            ? Icon(
                Icons.check,
                color: AppColor.whitecolor,
              )
            : SizedBox(),
      ),
    );
  }
}
