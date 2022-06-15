import 'package:get/get.dart';
import 'package:sport_app/core/locale/app_translations.dart';
import 'package:sport_app/core/store/app_store.dart';
import 'package:sport_app/core/themes/mode/dark.dart';
import 'package:sport_app/core/themes/mode/light.dart';
import 'package:sport_app/core/themes/theme.dart';

class App{
  static init() async{
    await Get.putAsync<AppStore>(() => AppStore().init(), permanent: true);
    await Get.putAsync<AppTranslations>(() => AppTranslations().init(), permanent: true);

    await Get.putAsync<CoreTheme>(() => LightTheme().init(), tag: 'light');
    await Get.putAsync<CoreTheme>(() => DarkTheme().init(), tag: 'dark');

  }
}