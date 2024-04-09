import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:stock_app/app/theme/app_colors.dart';
import 'package:stock_app/app/utils/common.dart';
import 'package:stock_app/app/utils/pref.dart';

import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([Prefs().init()]);

  SystemChrome.setSystemUIOverlayStyle(systemStyle());

  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData.from(colorScheme: darkColorScheme),
      debugShowCheckedModeBanner: false,
    ),
  );
}
