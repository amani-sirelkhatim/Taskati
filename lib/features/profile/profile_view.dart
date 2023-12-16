import 'dart:io';

import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:gap/gap.dart';

import 'package:seccion6/core/functions/functions.dart';
import 'package:seccion6/core/storage/local_storage.dart';
import 'package:seccion6/core/utils/app_colors.dart';
import 'package:seccion6/core/utils/styles.dart';
import 'package:seccion6/core/widgets/custom_button.dart';

import 'package:seccion6/features/home/home_view.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
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
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              pushWithReplacment(context, homeView());
            },
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: AppColor.primarycolor,
            )),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.light_mode_outlined,
                color: AppColor.primarycolor,
              ))
        ],
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 80,
                  backgroundColor: AppColor.whitecolor,
                  child: CircleAvatar(
                    radius: 70,
                    backgroundImage: (image != null)
                        ? FileImage(File(image!)) as ImageProvider
                        : const AssetImage('assets/user.png'),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return SizedBox(
                              height: 200,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppColor.whitecolor,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    children: [
                                      Gap(10),
                                      CustomButton(
                                        text: 'Upload from Camera',
                                        onTap: () {},
                                        width: double.infinity,
                                      ),
                                      Gap(10),
                                      CustomButton(
                                        text: 'Upload from Gallery',
                                        onTap: () {},
                                        width: double.infinity,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                    },
                    icon: Icon(
                      Icons.camera_enhance_outlined,
                      color: AppColor.primarycolor,
                    ))
              ],
            ),
            const Gap(60),
            const Divider(
              indent: 20,
              endIndent: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: getTitleStyle(color: AppColor.primarycolor),
                ),
                Spacer(),
                IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return SizedBox(
                              height: 200,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppColor.whitecolor,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    children: [
                                      Gap(10),
                                      TextFormField(
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'name is required';
                                            }
                                            return null;
                                          },
                                          decoration: InputDecoration(
                                            hintText: name,
                                          )),
                                      Gap(10),
                                      CustomButton(
                                        text: 'Update your Name',
                                        onTap: () {},
                                        width: double.infinity,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                    },
                    icon: Icon(
                      Icons.edit_rounded,
                      color: AppColor.primarycolor,
                    ))
              ],
            ),
          ],
        ),
      )),
    );
  }
}
