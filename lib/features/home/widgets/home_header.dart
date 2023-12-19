import 'dart:io';

import 'package:flutter/material.dart';
import 'package:seccion6/core/functions/functions.dart';
import 'package:seccion6/core/storage/local_storage.dart';
import 'package:seccion6/core/utils/app_colors.dart';
import 'package:seccion6/core/utils/styles.dart';
import 'package:seccion6/features/profile/profile_view.dart';

class homeHeader extends StatefulWidget {
  const homeHeader({super.key});

  @override
  State<homeHeader> createState() => _homeHeaderState();
}

class _homeHeaderState extends State<homeHeader> {
  String name = '';
  String? image;
  @override
  void initState() {
    super.initState();
    AppLocalStorage.getCachedData(AppLocalStorage.Name_Key).then((value) {
      setState(() {
        name = value;
      });
    });
    AppLocalStorage.getCachedData(AppLocalStorage.Image_Key).then((value) {
      setState(() {
        image = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello $name',
              style: getTitleStyle(color: AppColor.primarycolor, fontSize: 18),
            ),
            Text(
              'Have a nice day',
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ],
        ),
        Spacer(),
        GestureDetector(
          onTap: () {
            pushWithReplacment(context, profile());
          },
          child: CircleAvatar(
              radius: 28,
              backgroundImage: FileImage(File(image!)) as ImageProvider),
        ),
      ],
    );
  }
}
