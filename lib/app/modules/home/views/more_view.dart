import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_app/app/routes/app_pages.dart';

import '../../../../generated/assets.dart';
import '../../../theme/app_colors.dart';
import '../../../utils/constants.dart';
import '../../../widgets/common_app_bar.dart';
import '../../../widgets/common_text.dart';
import '../../../widgets/image.dart';
import '../../../widgets/widgets.dart';
import '../controllers/dash_controller.dart';

class MoreView extends GetView<DashController> {
  const MoreView({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> mList = [profile, aboutUs, contactUs, tutorial, setting, myStock, logout];
    return Scaffold(
      appBar: const CommonAppBar(
        title: "More",
        hasBackIcon: false,
        titleCentered: false,
      ),
      backgroundColor: primaryClr,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(bottom: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: mList.length,
                    itemBuilder: (context, index) {
                      return _singleItem(context, mList[index], () {
                        if (controller.scaffoldKey.currentState?.isDrawerOpen == true) controller.scaffoldKey.currentState?.closeDrawer();
                        startNavigation(mList[index], context);
                      });
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _singleItem(BuildContext context, String item, VoidCallback? onTap) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(2),
          decoration: carDecoration,
          child: Material(
            color: cardClr,
            child: InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: onTap,
              child: Row(
                children: [
                  Expanded(
                    child: CommonText.medium(item, size: 14, color: secondaryClr),
                  ),
                  const SquareSvgImageFromAsset(Assets.imagesIcForward, color: tertiaryClr, size: 20),
                ],
              ).paddingAll(14),
            ),
          ),
        ).marginOnly(left: 16, right: 16, bottom: 8, top: 8),
      ],
    );
  }

  void startNavigation(String navigateTo, BuildContext context) {
    switch (navigateTo) {
      case profile:
        {
          Get.toNamed(Routes.PROFILE);
          break;
        }
      case aboutUs:
        {
          Get.toNamed(Routes.ABOUT_US);
          break;
        }

      case contactUs:
        {
          Get.toNamed(Routes.CONTACT_US);
          break;
        }
      case myStock:
        {
          Get.toNamed(Routes.MY_STOCK);
          break;
        }

      case tutorial:
        {
          Get.toNamed(Routes.TUTORIAL);
          break;
        }

      case logout:
        {
          showSheet(
            context: context,
            title: "Logout",
            message: "Are you sure you want to logout?",
            primaryBtnText: "Confirm",
            showSecondaryBtn: true,
            secondaryBtnText: "Cancel",
            image: Assets.imagesIcLogout,
            onPrimaryBtnClick: () => Get.offAllNamed(Routes.LOGIN),
            onSecondaryBtnClick: () => Get.back(),
          );
        }
    }
  }
}
