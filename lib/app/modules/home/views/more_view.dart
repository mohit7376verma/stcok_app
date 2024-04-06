import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_app/app/routes/app_pages.dart';

import '../../../../generated/assets.dart';
import '../../../theme/app_colors.dart';
import '../../../utils/constants.dart';
import '../../../widgets/common_app_bar.dart';
import '../../../widgets/common_text.dart';
import '../../../widgets/image.dart';
import '../controllers/dash_controller.dart';

class MoreView extends GetView<DashController> {
  const MoreView({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> mList = [home, profile, aboutUs, contactUs, tutorial, setting, leaderboard, myStock, logout];
    return Scaffold(
      appBar: const CommonAppBar(
        title: "More",
        hasBackIcon: false,
        titleCentered: false,
      ),
      backgroundColor: primaryClr,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 16),
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
          clipBehavior: Clip.hardEdge,
          decoration: carDecoration,
          child: InkWell(
            overlayColor: const MaterialStatePropertyAll(Colors.transparent),
            focusColor: Colors.transparent,
            splashColor: neutralClr,
            hoverColor: neutralClr,
            highlightColor: neutralClr,
            onTap: onTap,
            child: Row(
              children: [
                Expanded(
                  child: CommonText.medium(item, size: 14, color: secondaryClr),
                ),
                const SquareSvgImageFromAsset(Assets.imagesIcForward, color: neutralClr, size: 20),
              ],
            ).paddingAll(16),
          ),
        ).marginOnly(left: 16, right: 16, bottom: 8, top: 8),
      ],
    );
  }

  void startNavigation(String navigateTo, BuildContext context) {
    switch (navigateTo) {
      case home:
        {
          controller.pageCtrl.animateToPage(0, duration: const Duration(milliseconds: 350), curve: Curves.ease);
          controller.currentIndex.value = 0;
          break;
        }
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
    }
  }
}
