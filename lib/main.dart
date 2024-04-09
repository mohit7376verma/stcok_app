import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:stock_app/app/network/utils/polygon_dio_client.dart';
import 'package:stock_app/app/theme/app_colors.dart';
import 'package:stock_app/app/utils/common.dart';
import 'package:stock_app/app/utils/pref.dart';

import 'app/network/utils/api_handler.dart';
import 'app/network/utils/dio_client.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([Prefs().init()]);

  SystemChrome.setSystemUIOverlayStyle(systemStyle());

  Get.put(ApiHandler(errorMapper: (json) {  }), tag: "handler", permanent: true);

  Get.put(DioClient().getClient(), tag: "dio_client", permanent: true);
  Get.put(PolygonDioClient().getPolygonDioClient(), tag: "polygon_dio_client", permanent: true);

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
