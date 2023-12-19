import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:seccion6/core/storage/task_model.dart';
import 'package:seccion6/core/themes.dart';

import 'package:seccion6/splash_view.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(taskAdapter());
  await Hive.openBox<task>('task');
  await Hive.openBox('user');
  await Hive.openBox<bool>('mode');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box<bool>>(
        valueListenable: Hive.box<bool>('mode').listenable(),
        builder: (context, value, child) {
          var darkmode = value.get('darkmode', defaultValue: false)!;
          return MaterialApp(
            themeMode: darkmode ? ThemeMode.dark : ThemeMode.light,
            darkTheme: darkTheme,
            theme: lightTheme,
            debugShowCheckedModeBanner: false,
            home: SplashView(),
          );
        });
  }
}
