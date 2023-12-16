import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:seccion6/core/utils/app_colors.dart';
import 'package:seccion6/core/utils/styles.dart';

class dateTextForm extends StatefulWidget {
  const dateTextForm({super.key});

  @override
  State<dateTextForm> createState() => _dateTextFormState();
}

class _dateTextFormState extends State<dateTextForm> {
  String date = DateFormat.yMd().format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Date :',
          style: getTitleStyle(
              fontWeight: FontWeight.bold, color: AppColor.primarycolor),
        ),
        Gap(10),
        TextFormField(
          readOnly: true,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Date is required';
            }
            return null;
          },
          decoration: InputDecoration(
              hintText: date,
              suffixIcon: IconButton(
                  onPressed: () {
                    showDateDialog();
                  },
                  icon: Icon(
                    Icons.calendar_month,
                    color: AppColor.primarycolor,
                  ))),
        ),
      ],
    );
  }

  showDateDialog() async {
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
}
