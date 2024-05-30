import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:phr/generated/locales.g.dart';
import 'app/bindings/root_binding.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "PHR",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      initialBinding: RootBinding(),
      themeMode: ThemeMode.light,
      theme: ThemeData(
        brightness: Brightness.light,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      locale: Locale('th_TH'),
      translationsKeys: AppTranslation.translations,
    ),
  );
}
