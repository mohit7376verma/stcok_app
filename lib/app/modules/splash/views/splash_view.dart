import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_app/app/theme/app_colors.dart';
import 'package:stock_app/app/widgets/common_text.dart';

import '../../../routes/app_pages.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 1), () {
      Get.offAndToNamed(Routes.LOGIN);
    });

    return const Scaffold(
      backgroundColor: primaryClr,
      body: Center(
        child: CommonText.bold(
          'Stock App',
          size: 24,
          color: Colors.white,
        ),
      ),
    );
  }
}
