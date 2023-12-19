import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:seccion6/core/storage/task_model.dart';
import 'package:seccion6/core/utils/app_colors.dart';
import 'package:seccion6/core/utils/styles.dart';

class taskcard extends StatelessWidget {
  const taskcard({
    super.key,
    required this.model,
  });

  final task model;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: model.iscompleted
            ? AppColor.greenolor
            : (model.colorchosen == 0
                ? AppColor.primarycolor
                : model.colorchosen == 1
                    ? AppColor.redcolor
                    : AppColor.orangecolor),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.title,
                style: getTitleStyle(color: AppColor.whitecolor, fontSize: 18),
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
                    '${model.starttime}  ${model.endtime}',
                    style: getSmallStyle(color: AppColor.whitecolor),
                  )
                ],
              ),
              const Gap(10),
              Text(
                model.note,
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
                model.iscompleted == true ? 'Done' : 'TODO',
                style: getBodyStyle(color: AppColor.whitecolor),
              ))
        ],
      ),
    );
  }
}
