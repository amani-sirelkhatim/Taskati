import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:seccion6/features/create_task/widgets/datepicker_addtask.dart';
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
              taskContainer(),
            ],
          ),
        ),
      ),
    );
  }
}
