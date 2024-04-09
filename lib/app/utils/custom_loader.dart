import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../theme/app_colors.dart';
import '../widgets/common_text.dart';

class Loader {
  //show error dialog
  static void showErrorDialog({String title = 'Error', String? description = 'Something went wrong'}) {
    Get.dialog(
      Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CommonText.medium(title),
              CommonText.medium(description ?? ''),
              ElevatedButton(
                onPressed: () {
                  if (Get.isDialogOpen!) Get.back();
                },
                child: const CommonText.medium('Okay'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //show loading
  static void showLoading() {
    Get.dialog(
      barrierDismissible: false,
      Dialog(
        child: Container(
          width: 72,
          height: 64,
          decoration: BoxDecoration(color: onPrimaryClr, borderRadius: BorderRadius.circular(16)),
          padding: const EdgeInsets.all(8.0),
          child: const SpinKitThreeBounce(color: primaryClr, size: 20),
        ),
      ).marginAll(MediaQuery.sizeOf(Get.context as BuildContext).width * 0.31),
    );
  }

  //hide loading
  static void hideLoading() {
    if (Get.isDialogOpen!) Get.back();
  }
}
