import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_app/app/modules/home/views/home_view.dart';
import 'package:stock_app/app/modules/home/views/market_view.dart';
import 'package:stock_app/app/modules/home/views/more_view.dart';
import 'package:stock_app/app/modules/home/views/news_view.dart';
import 'package:stock_app/app/widgets/image.dart';

import '../../../gen/assets.gen.dart';
import '../../../theme/app_colors.dart';
import '../controllers/dash_controller.dart';
import 'chat_view.dart';

class DashboardView extends GetView<DashController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SafeArea(
        child: Scaffold(
          key: controller.scaffoldKey,
          body: PageView(
            controller: controller.pageCtrl,
            onPageChanged: controller.onPageChanged(controller.currentIndex.value),
            physics: const NeverScrollableScrollPhysics(),
            children: pages,
          ),
          bottomNavigationBar: bottomNavigationBar(),
          drawer: Drawer(
            width: MediaQuery.sizeOf(context).width * .75,
            backgroundColor: onBackgroundClr,
            elevation: 0.0,
            child: const MoreView(),
          ),
          drawerDragStartBehavior: DragStartBehavior.start,
          drawerEnableOpenDragGesture: true,
          onDrawerChanged: (state) {
            controller.isDrawerOpen.value = state;
            if (state != true) {
              var index = controller.drawerOpenIndex.value;
              controller.currentIndex.value = index;
            }
          },
        ),
      ),
    );
  }

  NavigationDestination navItem(String icon, title) {
    return NavigationDestination(
      icon: SquareSvgImageFromAsset(
        icon,
        size: 16,
        color: onPrimaryClr.withOpacity(0.5),
      ),
      selectedIcon: SquareSvgImageFromAsset(
        icon,
        size: 16,
        color: onPrimaryClr,
      ),
      label: title,
    );
  }

  Widget bottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(color: onPrimaryClr.withOpacity(0.05), spreadRadius: 4, blurRadius: 8)],
        color: onBackgroundClr,
        borderRadius: const BorderRadius.only(topRight: Radius.circular(16), topLeft: Radius.circular(16)),
      ),
      child: NavigationBar(
        destinations: <NavigationDestination>[
          navItem(Assets.imagesIcSearch.path, "Home"),
          navItem(Assets.imagesMarket48.path, "Market"),
          navItem(Assets.imagesIcMail.path, "Chat"),
          navItem(Assets.imagesNews.path, "News"),
          navItem(Assets.imagesIcForward.path, "More"),
        ],
        selectedIndex: controller.currentIndex.value,
        onDestinationSelected: (index) {
          if (index == 4) {
            controller.drawerOpenIndex.value = controller.currentIndex.value;
            controller.onPageChanged(index);
            controller.scaffoldKey.currentState?.openDrawer();
          } else {
            controller.onPageChanged(index);
          }
        },
        backgroundColor: Colors.transparent,
        indicatorColor: tertiaryClr.withOpacity(0.6),
        indicatorShape: RoundedRectangleBorder(
          side: const BorderSide(color: tertiaryClr, width: 2),
          borderRadius: BorderRadius.circular(32),
        ),
      ),
    );
  }
}

const pages = [HomeView(), MarketView(), ChatView(), NewsView()];
