import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:seccion6/core/functions/functions.dart';
import 'package:seccion6/core/utils/app_colors.dart';
import 'package:seccion6/core/utils/styles.dart';
import 'package:seccion6/core/widgets/custom_button.dart';

import 'package:seccion6/features/create_task/widgets/custom_textform.dart';
import 'package:seccion6/features/create_task/widgets/date_textform.dart';
import 'package:seccion6/features/home/home_view.dart';
import 'package:seccion6/features/create_task/widgets/time_textform.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  var titlecon = TextEditingController();
  var notecon = TextEditingController();
  int colorindex = 0;
  @override
  Widget build(BuildContext context) {
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
              'Add Task',
              style: getTitleStyle(color: AppColor.primarycolor),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(0),
                  customTextForm(con: titlecon, name: 'Title'),
                  const Gap(10),
                  customTextForm(
                    con: notecon,
                    name: 'Note',
                    maxlines: 4,
                  ),
                  const Gap(10),
                  dateTextForm(),
                  const Gap(10),
                  timeTextform(),
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
                        text: 'Create task',
                        onTap: () {
                          pushWithReplacment(context, const homeView());
                        },
                        width: 120,
                      )
                    ],
                  )
                ],
              ),
            ),
          )),
    );
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
