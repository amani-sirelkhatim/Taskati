import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:seccion6/core/utils/app_colors.dart';
import 'package:seccion6/core/utils/styles.dart';

class taskContainer extends StatefulWidget {
  const taskContainer({super.key});

  @override
  State<taskContainer> createState() => _taskContainerState();
}

class _taskContainerState extends State<taskContainer> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.separated(
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColor.primarycolor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Flutter Task -1',
                          style: getTitleStyle(
                              color: AppColor.whitecolor, fontSize: 18),
                        ),
                        const Gap(10),
                        Row(
                          children: [
                            Icon(
                              Icons.watch_later_outlined,
                              color: AppColor.whitecolor,
                            ),
                            const Gap(10),
                            Text(
                              '02:25 am 04:29',
                              style: getSmallStyle(color: AppColor.whitecolor),
                            )
                          ],
                        ),
                        const Gap(10),
                        Text(
                          'I will do this task',
                          style: getBodyStyle(color: AppColor.whitecolor),
                        ),
                      ],
                    ),
                    Spacer(),
                    Container(
                      width: .5,
                      height: 50,
                      color: AppColor.whitecolor.withOpacity(0.5),
                    ),
                    Gap(10),
                    RotatedBox(
                        quarterTurns: 3,
                        child: Text(
                          'TODO',
                          style: getBodyStyle(color: AppColor.whitecolor),
                        ))
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => Gap(10),
            itemCount: 2));
  }
}
