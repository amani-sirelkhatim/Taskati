import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:seccion6/core/utils/app_colors.dart';
import 'package:seccion6/core/utils/styles.dart';

class customTextForm extends StatefulWidget {
  const customTextForm({
    super.key,
    required this.con,
    required this.name,
    this.maxlines,
  });
  final TextEditingController con;
  final String name;
  final int? maxlines;

  @override
  State<customTextForm> createState() => _customTextFormState();
}

class _customTextFormState extends State<customTextForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${widget.name} :',
          style: getTitleStyle(
              fontWeight: FontWeight.bold, color: AppColor.primarycolor),
        ),
        Gap(10),
        TextFormField(
            maxLines: widget.maxlines,
            controller: widget.con,
            validator: (value) {
              if (value!.isEmpty) {
                return '${widget.name} is required';
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: 'Enter ${widget.name} here',
            )),
      ],
    );
  }
}
