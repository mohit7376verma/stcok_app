import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_app/app/routes/app_pages.dart';
import 'package:stock_app/app/widgets/common_app_bar.dart';
import 'package:stock_app/app/widgets/widgets.dart';

import '../../../../generated/assets.dart';
import '../../../theme/app_colors.dart';
import '../../../widgets/common_text.dart';
import '../../../widgets/image.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: ""),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              clipBehavior: Clip.none,
              children: [
                Container(height: 70, decoration: const BoxDecoration(color: primaryClr)),
                Positioned(
                  top: 10,
                  child: Obx(() => profileImageView()),
                ),
              ],
            ),
            const SizedBox(height: 68),
            Obx(() => CommonText.bold(controller.userName.value, size: 22)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.email, size: 16, color: secondaryClr),
                const SizedBox(width: 4),
                Obx(() => CommonText.semiBold(controller.email.value, size: 14, color: secondaryClr))
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.phone, size: 16, color: secondaryClr),
                const SizedBox(width: 4),
                Obx(() => CommonText.semiBold(controller.userPhone.value, size: 14, color: secondaryClr))
              ],
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  items(Assets.imagesIcPencil, "Edit Account", context, () {
                    Get.toNamed(Routes.EDIT_PROFILE);
                  }),
                  items(Assets.imagesIcPencil, "My Cards", context, () => {}),
                  items(Assets.imagesIcPencil, "Add Credits", context, () => {}),
                  items(Assets.imagesIcTrash, "Delete Account", context, () {
                    showSheet(
                        context: context,
                        title: 'Warning',
                        message: 'Are you sure you want to delete this account?',
                        primaryBtnText: 'Confirm',
                        onPrimaryBtnClick: () => Get.back(),
                        secondaryBtnText: 'Cancel',
                        showSecondaryBtn: true,
                        onSecondaryBtnClick: () => Get.back());
                  }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget profileImageView() => Container(
        clipBehavior: Clip.hardEdge,
        height: 120.0,
        width: 120.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: secondaryClr,
          border: Border.all(color: tertiaryClr, width: 4.0, strokeAlign: BorderSide.strokeAlignOutside),
        ),
        child: controller.userProfileImg.value.isNotEmpty
            ? SquareImageFromNetwork(
                imageUrl: controller.userProfileImg.value,
                fit: BoxFit.cover,
              )
            : const SquareImageFromAsset(Assets.imagesAvatar),
      );

  Widget items(String image, String title, BuildContext context, VoidCallback onPressed) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: carDecoration,
      child: Material(
        color: cardClr,
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: onPressed,
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(color: primaryClr, borderRadius: BorderRadius.circular(6)),
                  child: title == "My Cards"
                      ? const Icon(
                          Icons.credit_card,
                          size: 20,
                          color: secondaryClr,
                        )
                      : title == "Add Credits"
                          ? const Icon(
                              Icons.add_card,
                              size: 20,
                              color: secondaryClr,
                            )
                          : SquareSvgImageFromAsset(image, color: Colors.white).paddingAll(6),
                ).marginOnly(right: 16),
                Expanded(child: CommonText.extraBold(title, size: 14)),
                const SquareSvgImageFromAsset(Assets.imagesIcForward, color: tertiaryClr),
              ],
            ),
          ),
        ),
      ),
    ).marginOnly(bottom: 8, top: 8);
  }
}
