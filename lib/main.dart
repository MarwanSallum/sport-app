import 'package:flutter/material.dart';
import 'package:sport_app/core/config/app.dart';
import 'package:get/get.dart';
import 'package:sport_app/core/locale/app_translations.dart';
import 'package:sport_app/core/store/app_store.dart';
import 'package:sport_app/core/themes/mode/dark.dart';
import 'package:sport_app/core/themes/mode/light.dart';
import 'package:sport_app/core/themes/theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await App.init();
  runApp(const SportApp());
}

class SportApp extends StatelessWidget {
  const SportApp({Key? key}) : super(key: key);

  AppTranslations get appTranslations => Get.find<AppTranslations>();
  AppStore get appStore => Get.find<AppStore>();
  LightTheme get lightTheme =>
      Get.find<CoreTheme>(tag: 'light') as LightTheme;
  DarkTheme get darkTheme =>
      Get.find<CoreTheme>(tag: 'dark') as DarkTheme;

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // initialRoute: ,
      // initialBinding: ,
      translations: appTranslations,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      themeMode: appStore.getThemeMode(),
      theme: lightTheme.buildTheme(context),
      darkTheme: darkTheme.buildTheme(context),
      locale: appStore.getLanguage(),
      // getPages: [],
    );
  }
}

