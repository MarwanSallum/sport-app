import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:sport_app/core/enums/store_key.dart';

class AppStore {
  late SharedPreferences _sharedPreferences;

  Future<AppStore> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }

  //// Token Store  //////////////////////////////////////////////
  removeToken() {
    _sharedPreferences.remove(StoreKey.accessToken.name);
  }

  getToken() {
    return _sharedPreferences.getString(StoreKey.accessToken.name);
  }

  saveToken(String value) {
    _sharedPreferences.setString(StoreKey.accessToken.name, value);
  }

  //// Theme Mode Store //////////////////////////////////////////
  isSavedDarkMode(){
    return _sharedPreferences.getBool(StoreKey.darkMode.name) ?? false;
  }

  saveThemeMode(bool isDarkMode) async{
    await _sharedPreferences.setBool(StoreKey.darkMode.name, isDarkMode);
  }

  ThemeMode getThemeMode(){
    return isSavedDarkMode() ? ThemeMode.dark : ThemeMode.light;
  }

  void changeThemeMode(){
    Get.changeThemeMode(
        isSavedDarkMode()
            ? ThemeMode.light
            : ThemeMode.dark
    );
    saveThemeMode(! isSavedDarkMode());
  }

  //// Language Store ///////////////////////////////////////////
  isEnglishLanguage(){
    return _sharedPreferences.getBool(StoreKey.english.name) ?? false;
  }

  saveLanguage(bool isEnglish) async{
    await _sharedPreferences.setBool(StoreKey.english.name, isEnglish);
  }

  Locale getLanguage(){
    return isEnglishLanguage() ?  const Locale('en') :  const Locale('ar');
  }

  void changeLanguage(){
    Get.updateLocale(isEnglishLanguage() ? const Locale('ar') : const Locale('en'));
    saveLanguage(! isEnglishLanguage());
    Get.reload();
  }

}