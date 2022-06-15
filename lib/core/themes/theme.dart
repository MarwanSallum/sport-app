import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sport_app/core/themes/style/theme_style.dart';

abstract class CoreTheme{
  Map<String,dynamic> themeSettings = {};
  String get fileName;
  ThemeData get themeData;

  set baseThemeData(ThemeData baseThemeData){
    this.baseThemeData = baseThemeData;
  }

  Future<CoreTheme> init() async{
    try{
      String data = await rootBundle.loadString('assets/themes/$fileName.json');
      themeSettings = Map<String,dynamic>.from( jsonDecode(data) );
    }catch(error){
      throw Exception("${error.toString()} Failed to load Theme Settings");
    }
    return this;
  }

  Color getColor({required String filed, required String name, String? shade = 'main'}){
    String value = themeSettings[filed][name][shade] ?? '#ff8d00';
    if(value.startsWith('#')){
      value = value.replaceAll('#', '');
    }
    return Color(int.tryParse("0xff$value") ?? 0xffff8d00);
  }

  Color get primaryColor => getColor(filed: 'colors', name: 'primary');
  Color get primaryLightColor => getColor(filed: 'colors',name: 'primary', shade: 'light');
  Color get primaryDarkColor => getColor(filed: 'colors',name: 'primary', shade: 'dark');

  Color get secondaryColor => getColor(filed: 'colors',name: 'secondary');
  Color get secondaryLightColor => getColor(filed: 'colors',name: 'secondary', shade: 'light');
  Color get secondaryDarkColor => getColor(filed: 'colors',name: 'secondary', shade: 'dark');

  Color get infoColor => getColor(filed: 'colors',name: 'info');
  Color get infoLightColor => getColor(filed: 'colors',name: 'info', shade: 'light');
  Color get infoDarkColor => getColor(filed: 'colors',name: 'info', shade: 'dark');

  Color get successColor => getColor(filed: 'colors',name: 'success');
  Color get successLightColor => getColor(filed: 'colors',name: 'success', shade: 'light');
  Color get successDarkColor => getColor(filed: 'colors',name: 'success', shade: 'dark');

  Color get warningColor => getColor(filed: 'colors',name: 'warning');
  Color get warningLightColor => getColor(filed: 'colors',name: 'warning', shade: 'light');
  Color get warningDarkColor => getColor(filed: 'colors',name: 'warning', shade: 'dark');

  Color get dangerColor => getColor(filed: 'colors',name: 'danger');
  Color get dangerLightColor => getColor(filed: 'colors',name: 'danger', shade: 'light');
  Color get dangerDarkColor => getColor(filed: 'colors',name: 'danger', shade: 'dark');

  Color get textPrimaryColor => getColor(filed: 'text',name: 'primary');

  ThemeData buildTheme(BuildContext context){
    return themeData.copyWith(
      primaryColor: primaryColor,
      appBarTheme: ThemeStyle.appBarTheme(color: primaryColor),
      textTheme: GoogleFonts.cairoTextTheme().apply(bodyColor: textPrimaryColor ),
      elevatedButtonTheme: ThemeStyle.elevatedButtonTheme(primaryColor, secondaryColor),
      inputDecorationTheme: ThemeStyle.inputDecoration(primaryColor),
    );
  }

}