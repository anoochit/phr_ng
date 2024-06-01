import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'app/controllers/app_controller.dart';
import 'app/routes/app_pages.dart';
import 'generated/locales.g.dart';

Future<void> main() async {
  AppController appController = Get.put(AppController());

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "PHR",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      // initialBinding: RootBinding(),
      // TODO : Use theme setting data
      themeMode: ThemeMode.light,
      theme: ThemeData(
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
      ),
      // TODO : Use locale setting data
      locale: const Locale('th_TH'),
      fallbackLocale: const Locale('en_US'),
      translationsKeys: AppTranslation.translations,
    ),
  );
}
