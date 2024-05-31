import 'package:flutter/material.dart';
import 'package:dynamic_color/dynamic_color.dart';

import 'package:get/get.dart';
import 'app/bindings/root_binding.dart';
import 'app/routes/app_pages.dart';
import 'generated/locales.g.dart';

Future<void> main() async {
  runApp(
    DynamicColorBuilder(builder: (lightDynamic, darkDynamic) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "PHR",
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        initialBinding: RootBinding(),
        // TODO : Use theme setting data
        themeMode: ThemeMode.light,
        theme: ThemeData(
          colorScheme: lightDynamic,
          useMaterial3: true,
        ),
        darkTheme: ThemeData(
          colorScheme: darkDynamic,
          useMaterial3: true,
        ),
        // TODO : Use locale setting data
        locale: const Locale('th_TH'),
        fallbackLocale: const Locale('en_US'),
        translationsKeys: AppTranslation.translations,
      );
    }),
  );
}
