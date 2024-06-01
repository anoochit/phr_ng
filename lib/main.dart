import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phr/app/controllers/app_controller.dart';
import 'app/controllers/database_service.dart';
import 'app/routes/app_pages.dart';
import 'generated/locales.g.dart';

Future<void> main() async {
  // init widget binding
  WidgetsFlutterBinding.ensureInitialized();
  // init app controller
  AppController appController = Get.put(AppController(), permanent: true);
  // init database
  final db = await initDatabase();
  // inject datbase instance
  appController.db = db;
  // load data
  await appController.loadData();
  // run app
  runApp(MyApp(controller: appController));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key, required this.controller});

  final AppController controller;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final themeMode = widget.controller.getThemeValue();
    final localeMode = Locale(widget.controller.getLocaleValue());

    log('load material app');
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "PHR",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      //  Use theme setting data
      themeMode: themeMode,
      theme: ThemeData(
        brightness: Brightness.light,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      // Use locale setting data
      locale: localeMode,
      fallbackLocale: const Locale('en_US'),
      translationsKeys: AppTranslation.translations,
    );
  }
}
