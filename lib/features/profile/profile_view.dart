import 'dart:io';

import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:gap/gap.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';

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
  late Box<bool> modeBox;
  var formkey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    modeBox = Hive.box('mode');
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
    bool isDark = modeBox.get('darkmode') ?? false;
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
          Row(
            children: [
              Text(
                'Dark Mode',
                style: getTitleStyle(
                  color: AppColor.primarycolor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Switch(
                    value: isDark,
                    onChanged: (val) {
                      setState(() {
                        modeBox.put('darkmode', !isDark);
                      });
                    }),
              ),
            ],
          )
        ],
      ),
      body: SafeArea(
        child: Center(
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
                    radius: 72,
                    backgroundColor: AppColor.whitecolor,
                    child: CircleAvatar(
                      radius: 70,
                      backgroundImage: (image != null)
                          ? FileImage(File(image!)) as ImageProvider
                          : const AssetImage('assets/user.png'),
                    ),
                  ),
                  CircleAvatar(
                    radius: 18,
                    backgroundColor: Theme.of(context).primaryColorDark,
                    child: IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return SizedBox(
                                  height: 250,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColorDark,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Column(
                                        children: [
                                          Gap(10),
                                          CustomButton(
                                            text: 'Upload from Camera',
                                            onTap: () {
                                              UploadFromCamera();
                                            },
                                            width: double.infinity,
                                          ),
                                          Gap(10),
                                          CustomButton(
                                            text: 'Upload from Gallery',
                                            onTap: () {
                                              UploadFromGallery();
                                            },
                                            width: double.infinity,
                                          ),
                                          Gap(10),
                                          CustomButton(
                                              text: 'update',
                                              onTap: () {
                                                Navigator.pop(context);
                                                AppLocalStorage.cacheData(
                                                    AppLocalStorage.Image_Key,
                                                    image!);
                                              })
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              });
                        },
                        icon: Icon(
                          Icons.camera_alt_rounded,
                          size: 20,
                          color: AppColor.primarycolor,
                        )),
                  )
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
                                    color: Theme.of(context).primaryColorDark,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                      children: [
                                        Gap(10),
                                        TextFormField(
                                            onChanged: (value) {
                                              setState(() {
                                                name = value;
                                              });
                                            },
                                            decoration: InputDecoration(
                                                hintText: name,
                                                hintStyle: Theme.of(context)
                                                    .textTheme
                                                    .displayMedium)),
                                        Gap(10),
                                        CustomButton(
                                          text: 'Update your Name',
                                          onTap: () {
                                            Navigator.pop(context);
                                            AppLocalStorage.cacheData(
                                                AppLocalStorage.Name_Key, name);
                                          },
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
      ),
    );
  }

  UploadFromCamera() async {
    var pickedimage = await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedimage != null) {
      setState(() {
        image = pickedimage.path;
      });
    }
  }

  UploadFromGallery() async {
    var pickedimage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedimage != null) {
      setState(() {
        image = pickedimage.path;
      });
    }
  }
}
