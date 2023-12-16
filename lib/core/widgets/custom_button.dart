import 'package:flutter/material.dart';
import 'package:seccion6/core/utils/app_colors.dart';
import 'package:seccion6/core/utils/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.text,
      required this.onTap,
      this.width = 100,
      this.style});
  final String text;
  final Function()? onTap;
  final double width;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 10),
        height: 50,
        width: width,
        decoration: BoxDecoration(
            color: AppColor.primarycolor,
            borderRadius: BorderRadius.circular(15)),
        child: Text(
          text,
          style:
              style == null ? getBodyStyle(color: AppColor.whitecolor) : style,
        ),
      ),
    );
  }
}
