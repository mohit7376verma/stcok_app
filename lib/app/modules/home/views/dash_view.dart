import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_app/app/modules/home/views/home_view.dart';
import 'package:stock_app/app/modules/home/views/market_view.dart';
import 'package:stock_app/app/modules/home/views/more_view.dart';
import 'package:stock_app/app/modules/home/views/news_view.dart';
import 'package:stock_app/app/widgets/common_app_bar.dart';
import 'package:stock_app/app/widgets/common_text.dart';
import 'package:stock_app/generated/assets.dart';

import '../../../theme/app_colors.dart';
import '../../../widgets/image.dart';
import '../controllers/dash_controller.dart';
import 'chat_view.dart';

class DashboardView extends GetView<DashController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        key: controller.scaffoldKey,
        appBar: CommonAppBar(
          title: title[controller.currentIndex.value],
          leadingIcon: Assets.imagesIcNotification,
          hasBackIcon: true,
          onBackTap: () {},
          actions: [
            IconButton(
              splashRadius: 24,
              onPressed: () => {},
              icon: const SquareSvgImageFromAsset(Assets.imagesIcSearch, color: secondaryClr),
            )
          ],
        ),
        body: SafeArea(
          child: PageView(
            controller: controller.pageCtrl,
            onPageChanged: controller.onPageChanged(controller.currentIndex.value),
            physics: const NeverScrollableScrollPhysics(),
            children: pages,
          ),
        ),
        bottomNavigationBar: _bottomBar(context, controller.scaffoldKey),

        drawer: Drawer(width: MediaQuery.sizeOf(context).width * .75, backgroundColor: onBackgroundClr, elevation: 0.0, child: const Center(child: MoreView())),
        drawerDragStartBehavior: DragStartBehavior.start,
        drawerEnableOpenDragGesture: true,
        onDrawerChanged: (bool state) {
          controller.isDrawerOpen.value = state;
          if (!state) {}
        },
      );
    });
  }

  NavigationBar? _bottomBar(BuildContext context, GlobalObjectKey<ScaffoldState> scaffoldKey) {
    if (MediaQuery.sizeOf(context).width < 640) {
      return NavigationBar(
        destinations: [
          navItem(Assets.imagesIcSearch, Assets.imagesIcSearch, "Home"),
          navItem(Assets.imagesIcSearch, Assets.imagesIcSearch, "Market"),
          navItem(Assets.imagesIcSearch, Assets.imagesIcSearch, "Chat"),
          navItem(Assets.imagesIcSearch, Assets.imagesIcSearch, "News"),
          navItem(Assets.imagesIcSearch, Assets.imagesIcSearch, "More"),
        ],
        onDestinationSelected: (int index) {
          if (index == 4) {
            scaffoldKey.currentState?.openDrawer();
          } else {
            controller.onPageChanged(index);
          }
        },
        selectedIndex: controller.currentIndex.value,
        backgroundColor: tertiaryClr,
        elevation: 2.0,
        indicatorColor: primaryClr,
        indicatorShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
      );
    } else {
      return null;
    }
  }

  NavigationDestination navItem(String icon, String activeIcon, String title) {
    if (title.toLowerCase() == "more") {
      return NavigationDestination(
        icon: CommonText.semiBold(title,size: 12,),
        label: title,
      );
    } else {
      return NavigationDestination(
        icon: CommonText.semiBold(title,size: 12),
        label: title,
      );
    }
  }
}

const pages = [HomeView(),MarketView(), ChatView(),NewsView()];
const title = ["Home", "Chat", "Market", "More"];
