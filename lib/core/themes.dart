import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seccion6/core/utils/app_colors.dart';
import 'package:seccion6/core/utils/styles.dart';

final lightTheme = ThemeData(
  //main color
  scaffoldBackgroundColor: Colors.white,
  primaryColorDark: AppColor.whitecolor,
  primaryColor: AppColor.darkscafoldbg,
  fontFamily: GoogleFonts.poppins().fontFamily,
  //date picker color
  datePickerTheme: DatePickerThemeData(
      backgroundColor: Colors.white,
      dayOverlayColor: MaterialStatePropertyAll(AppColor.blakcolor),
      dayForegroundColor: MaterialStatePropertyAll(AppColor.blakcolor),
      headerForegroundColor: AppColor.blakcolor,
      headerBackgroundColor: AppColor.primarycolor,
      yearStyle: getSmallStyle(color: AppColor.blakcolor),
      elevation: 0,
      weekdayStyle: getSmallStyle(color: AppColor.blakcolor),
      cancelButtonStyle:
          ButtonStyle(textStyle: MaterialStatePropertyAll(getSmallStyle())),
      confirmButtonStyle:
          ButtonStyle(textStyle: MaterialStatePropertyAll(getSmallStyle()))),
  //time picker
  timePickerTheme: TimePickerThemeData(
      backgroundColor: AppColor.whitecolor,
      confirmButtonStyle:
          ButtonStyle(textStyle: MaterialStatePropertyAll(getSmallStyle())),
      cancelButtonStyle:
          ButtonStyle(textStyle: MaterialStatePropertyAll(getSmallStyle()))),
  //text color
  textTheme: TextTheme(
      displayLarge: getTitleStyle(),
      displayMedium: getBodyStyle(),
      displaySmall: getSmallStyle(),
      labelLarge: getheadingStyle()),
  //app color
  appBarTheme: AppBarTheme(
      titleTextStyle: getTitleStyle(color: AppColor.primarycolor),
      iconTheme: IconThemeData(color: AppColor.primarycolor),
      backgroundColor: Colors.transparent,
      elevation: 0),
  //input decoration of textfields
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: AppColor.primarycolor),
    ),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: AppColor.primarycolor)),
    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: AppColor.redcolor)),
    focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: AppColor.redcolor)),
  ),
);
final darkTheme = ThemeData(
  fontFamily: GoogleFonts.poppins().fontFamily,
  scaffoldBackgroundColor: AppColor.darkscafoldbg,
  primaryColorDark: AppColor.blakcolor,
  primaryColor: AppColor.lightscafoldbg,
  //date picker color
  datePickerTheme: DatePickerThemeData(
      backgroundColor: Colors.black,
      dayOverlayColor: MaterialStatePropertyAll(AppColor.whitecolor),
      dayForegroundColor: MaterialStatePropertyAll(AppColor.whitecolor),
      headerForegroundColor: AppColor.whitecolor,
      headerBackgroundColor: AppColor.primarycolor,
      yearStyle: getBodyStyle(color: AppColor.whitecolor),
      elevation: 0,
      weekdayStyle: getBodyStyle(color: AppColor.whitecolor)),
  //time picker
  timePickerTheme: TimePickerThemeData(
      backgroundColor: AppColor.blakcolor,
      confirmButtonStyle:
          ButtonStyle(textStyle: MaterialStatePropertyAll(getSmallStyle())),
      cancelButtonStyle:
          ButtonStyle(textStyle: MaterialStatePropertyAll(getSmallStyle()))),
  //text color
  textTheme: TextTheme(
      displayLarge: getTitleStyle(color: AppColor.whitecolor),
      displayMedium: getBodyStyle(color: AppColor.whitecolor),
      displaySmall: getSmallStyle(color: AppColor.whitecolor),
      labelLarge: getheadingStyle(color: AppColor.whitecolor)),
  //app bar color
  appBarTheme: AppBarTheme(
      titleTextStyle: getTitleStyle(color: AppColor.primarycolor),
      iconTheme: IconThemeData(color: AppColor.primarycolor),
      backgroundColor: Colors.transparent,
      elevation: 0),
  //input decoration theme for textfields
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: AppColor.primarycolor),
    ),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: AppColor.primarycolor)),
    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: AppColor.redcolor)),
    focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: AppColor.redcolor)),
  ),
);
