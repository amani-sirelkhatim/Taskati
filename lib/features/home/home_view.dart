import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:seccion6/core/functions/functions.dart';
import 'package:seccion6/core/storage/task_model.dart';
import 'package:seccion6/core/utils/app_colors.dart';
import 'package:seccion6/core/utils/styles.dart';
import 'package:seccion6/features/create_task/updateTask.dart';

import 'package:seccion6/features/home/widgets/datepicker_addtask.dart';
import 'package:seccion6/features/home/widgets/home_header.dart';
import 'package:seccion6/features/home/widgets/task_container.dart';

class homeView extends StatefulWidget {
  const homeView({super.key});

  @override
  State<homeView> createState() => _homeViewState();
}

class _homeViewState extends State<homeView> {
  String name = '';
  String? image;
  String _selecteddate = DateFormat.yMd().format(DateTime.now());
  String? id;
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const homeHeader(),
              const Gap(15),
              secondPart(),
              const Gap(15),
              DatePicker(
                DateTime.now(),
                initialSelectedDate: DateTime.now(),
                selectionColor: AppColor.primarycolor,
                selectedTextColor: Colors.white,
                dateTextStyle: const TextStyle()
                    .copyWith(color: Theme.of(context).primaryColor),
                dayTextStyle: const TextStyle()
                    .copyWith(color: Theme.of(context).primaryColor),
                monthTextStyle: const TextStyle()
                    .copyWith(color: Theme.of(context).primaryColor),
                onDateChange: (date) {
                  // New date selected
                  setState(() {
                    _selecteddate = DateFormat.yMd().format(date);
                  });
                },
              ),
              const Gap(15),
              //the tasks
              Expanded(
                  child: ValueListenableBuilder<Box<task>>(
                valueListenable: Hive.box<task>('task').listenable(),
                builder: (context, value, child) {
                  List<task> tasks = [];
                  value.values.forEach((element) {
                    if (_selecteddate == element.date) {
                      tasks.add(element);
                    }
                  });
                  // the empty picture
                  if (tasks.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/empty.png',
                          ),
                          Gap(40),
                          Text(
                            'There is no tasks yet!!',
                            style: Theme.of(context).textTheme.displayLarge,
                          )
                        ],
                      ),
                    );
                  }
                  //list of tasks
                  return ListView.separated(
                      itemBuilder: (context, index) {
                        task item = tasks[index];
                        return Dismissible(
                          key: UniqueKey(),
                          background: Container(
                            decoration: BoxDecoration(
                                color: AppColor.greenolor,
                                borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 40),
                              child: Row(
                                children: [
                                  Icon(Icons.check_circle_outlined,
                                      color: AppColor.whitecolor),
                                  Gap(10),
                                  Text(
                                    'Complete',
                                    style: getBodyStyle(
                                        fontSize: 18,
                                        color: AppColor.whitecolor),
                                  )
                                ],
                              ),
                            ),
                          ),
                          secondaryBackground: Container(
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding: const EdgeInsets.only(right: 40),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(Icons.delete,
                                      color: AppColor.whitecolor),
                                  Gap(10),
                                  Text(
                                    'Delete',
                                    style: getBodyStyle(
                                        fontSize: 18,
                                        color: AppColor.whitecolor),
                                  )
                                ],
                              ),
                            ),
                          ),
                          onDismissed: (direction) {
                            if (direction == DismissDirection.startToEnd) {
                              value.put(
                                  item.id,
                                  task(
                                      id: item.id,
                                      title: item.title,
                                      note: item.note,
                                      date: item.date,
                                      starttime: item.starttime,
                                      endtime: item.endtime,
                                      colorchosen: item.colorchosen,
                                      iscompleted: true));
                            } else {
                              value.delete(item.id);
                            }
                          },
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                id = item.id;
                              });
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => updateTask(
                                        id: id!,
                                      )));
                            },
                            child: taskcard(
                              model: item,
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => Gap(10),
                      itemCount: tasks.length);
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}
