import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../generated/assets.dart';
import '../theme/app_colors.dart';
import 'common_text.dart';
import 'image.dart';

Widget pageLoader(BuildContext context) {
  return Center(
    child: Container(
      padding: const EdgeInsets.all(4),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: 12, height: 12, child: CircularProgressIndicator.adaptive(strokeWidth: 1.5)),
          SizedBox(width: 16),
          CommonText("Loading...", color: onBackgroundClr)
        ],
      ),
    ).paddingOnly(bottom: MediaQuery.of(context).padding.bottom, top: 4),
  );
}


/*
void showSheet({
  required BuildContext context,
  required String title,
  required String message,
  required String primaryBtnText,
  bool showSecondaryBtn = false,
  bool enableDrag = true,
  bool isDismiss = true,
  String secondaryBtnText = "No",
  String image = "",
  required VoidCallback? onPrimaryBtnClick,
  VoidCallback? onSecondaryBtnClick,
}) {
  showModalBottomSheet(
      context: context,
      clipBehavior: Clip.hardEdge,
      useSafeArea: true,
      useRootNavigator: true,
      enableDrag: enableDrag,
      isDismissible: isDismiss,
      backgroundColor: surfaceClr,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16))),
      builder: (builder) {
        return Wrap(children: [
          SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  alignment: Alignment.center,
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(color: secondaryClr, shape: BoxShape.circle, boxShadow: [BoxShadow(color: onBackgroundClr.withOpacity(0.05), blurRadius: 4)]),
                  child: SquareSvgImageFromAsset(image.isEmpty ? Assets.images.icAppLogo : image, color: surfaceClr),
                ).marginOnly(bottom: 16),
                CommonText.bold(title.toUpperCase(), color: onBackgroundClr, size: 20).marginOnly(bottom: 4),
                CommonText.regular(message, color: onBackgroundClr.withOpacity(0.7), size: 16, textAlign: TextAlign.center).paddingAll(8),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: secondaryClr,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                    minimumSize: Size(MediaQuery.sizeOf(context).width * 0.6, 50),
                  ),
                  onPressed: onPrimaryBtnClick,
                  child: CommonText.bold(primaryBtnText.toUpperCase(), color: surfaceClr, size: 14),
                ).marginOnly(top: 16, bottom: showSecondaryBtn ? 8 : 32),
                showSecondaryBtn
                    ? ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: errorClr,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                    minimumSize: Size(MediaQuery.sizeOf(context).width * 0.6, 50),
                  ),
                  onPressed: onSecondaryBtnClick,
                  child: CommonText.bold(secondaryBtnText.toUpperCase(), color: surfaceClr, size: 14),
                ).paddingOnly(bottom: 32)
                    : const SizedBox(),
              ],
            ).paddingAll(24),
          ),
        ]);
      });
}*/
