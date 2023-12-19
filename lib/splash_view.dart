import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:seccion6/core/storage/local_storage.dart';
import 'package:seccion6/core/utils/app_colors.dart';
import 'package:seccion6/core/utils/styles.dart';

import 'package:seccion6/features/home/home_view.dart';
import 'package:seccion6/features/upload/upload_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  bool? isUpload;
  @override
  void initState() {
    super.initState();
    AppLocalStorage.getCachedData(AppLocalStorage.Is_uplouded).then((value) {
      isUpload = value ?? false;
    });
    Future.delayed(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) =>
              isUpload! ? const homeView() : const UploadView()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/logo.json',
            width: 250,
          ),
          Gap(10),
          Text(
            'Taskati',
            style: Theme.of(context).textTheme.labelLarge,
          ),
          Gap(10),
          Text(
            'it\'s time to get organized',
            style: Theme.of(context).textTheme.displaySmall,
          )
        ],
      )),
    );
  }
}
