import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'app/bindings/root_binding.dart';
import 'app/routes/app_pages.dart';
import 'generated/locales.g.dart';

Future<void> main() async {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "PHR",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      initialBinding: RootBinding(),
      // TODO : Use theme setting data
      themeMode: ThemeMode.light,
      theme: ThemeData(
        brightness: Brightness.light,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      // TODO : Use locale setting data
      locale: Locale('th_TH'),
      translationsKeys: AppTranslation.translations,
    ),
  );
}
