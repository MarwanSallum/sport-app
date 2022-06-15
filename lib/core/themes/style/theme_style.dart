import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeStyle{
  static AppBarTheme appBarTheme({required Color color}){
    return AppBarTheme(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        titleTextStyle: GoogleFonts.cairo(
            color: color,
            fontWeight: FontWeight.w600,
            fontSize: Get.width * 0.05
        ),
        actionsIconTheme: IconThemeData(
          color: color,
        ),
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: color,
        )
    );
  }
  static InputDecorationTheme inputDecoration(Color color){
    return  InputDecorationTheme(
      isCollapsed: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: color, width: 3),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: Colors.grey),
      ),
      labelStyle: Get.textTheme.titleMedium,
      contentPadding: EdgeInsets.symmetric(
          horizontal: Get.width * 0.05, vertical: Get.height * 0.020),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }

  static ElevatedButtonThemeData elevatedButtonTheme(Color color, Color textColor) {
    return ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(color),
        maximumSize: MaterialStateProperty.all<Size>(
          Size(Get.width * 0.90, Get.height * 0.07),
        ),
        minimumSize: MaterialStateProperty.all<Size>(
          Size(Get.width * 0.90, Get.height * 0.07),
        ),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Get.width * 0.04),
          ),
        ),
        textStyle: MaterialStateProperty.all<TextStyle>(
            TextStyle(color: textColor)
        ),
      ),
    );
  }
}