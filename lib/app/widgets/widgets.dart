import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../generated/assets.dart';
import '../theme/app_colors.dart';
import 'common_button.dart';
import 'common_text.dart';
import 'image.dart';

Widget pageLoader(BuildContext context) {
  return Center(
    child: Container(
      padding: const EdgeInsets.all(4),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: 12, height: 12, child: CircularProgressIndicator.adaptive(strokeWidth: 1.5,backgroundColor: tertiaryClr,)),
          SizedBox(width: 16),
          CommonText("Loading...", color: secondaryClr)
        ],
      ),
    ).paddingOnly(bottom: MediaQuery.of(context).padding.bottom, top: 4),
  );
}

void showPicker({required VoidCallback? galleryPicker, VoidCallback? cameraPicker}) {
  showModalBottomSheet(
    context: Get.context as BuildContext,
    clipBehavior: Clip.hardEdge,
    useSafeArea: true,
    useRootNavigator: true,
    backgroundColor: primaryClr,
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16))),
    builder: (builder) {
      return Wrap(children: [
        Container(
          color: primaryClr,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(child: const CommonText.extraBold("Choose an Image", size: 16, color: secondaryClr).paddingAll(16)),
              CommonButton(onPressed: galleryPicker, label: "Gallery").paddingSymmetric(horizontal: 16),
              const SizedBox(
                height: 8,
              ),
              CommonButton(onPressed: cameraPicker, label: "Camera").paddingSymmetric(horizontal: 16),
              const SizedBox(
                height: 8,
              ),
              CommonButton.outline(
                onPressed: () => Get.back(),
                label: "CANCEL",
                bgColor: tertiaryClr,
                labelColor: tertiaryClr,
              ).paddingSymmetric(horizontal: 16),
            ],
          ).paddingOnly(left: 32, right: 32, bottom: 24),
        ).paddingOnly(bottom: 16),
      ]);
    },
  );
}

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
      backgroundColor: primaryClr,
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
                  decoration: BoxDecoration(
                      color: tertiaryClr, shape: BoxShape.circle, boxShadow: [BoxShadow(color: onBackgroundClr.withOpacity(0.05), blurRadius: 4)]),
                  child: SquareSvgImageFromAsset(image.isEmpty ? Assets.imagesIcTrash : image, color: secondaryClr),
                ).marginOnly(bottom: 16),
                CommonText.bold(title.toUpperCase(), color: secondaryClr, size: 20).marginOnly(bottom: 4),
                CommonText.regular(message, color: secondaryClr.withOpacity(0.7), size: 16, textAlign: TextAlign.center).paddingAll(8),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: tertiaryClr,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                    minimumSize: Size(MediaQuery.sizeOf(context).width * 0.6, 50),
                  ),
                  onPressed: onPrimaryBtnClick,
                  child: CommonText.bold(primaryBtnText.toUpperCase(), color: secondaryClr, size: 14),
                ).marginOnly(top: 16, bottom: showSecondaryBtn ? 8 : 32),
                showSecondaryBtn
                    ? ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: errorClr,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                          minimumSize: Size(MediaQuery.sizeOf(context).width * 0.6, 50),
                        ),
                        onPressed: onSecondaryBtnClick,
                        child: CommonText.bold(secondaryBtnText.toUpperCase(), color: secondaryClr, size: 14),
                      ).paddingOnly(bottom: 32)
                    : const SizedBox(),
              ],
            ).paddingAll(16),
          ),
        ]);
      });
}

//App Switch
Widget appSwitch({required bool value, ValueChanged<bool>? onChanged}) => Switch(
  value: value,
  onChanged: onChanged,
  inactiveTrackColor: Colors.grey.shade200,
  activeTrackColor: tertiaryClr,
  thumbColor: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
    if (states.contains(MaterialState.selected)) {
      return onPrimaryClr;
    } else {
      return Colors.grey.shade500;
    }
  }),
  trackOutlineColor: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
    if (states.contains(MaterialState.selected)) {
      return secondaryClr;
    } else {
      return Colors.grey.shade500;
    }
  }),
);
