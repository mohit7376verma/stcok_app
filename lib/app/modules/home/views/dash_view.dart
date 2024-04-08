import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:stock_app/app/modules/home/views/home_view.dart';
import 'package:stock_app/app/modules/home/views/market_view.dart';
import 'package:stock_app/app/modules/home/views/more_view.dart';
import 'package:stock_app/app/modules/home/views/news_view.dart';
import 'package:stock_app/generated/assets.dart';

import '../../../theme/app_colors.dart';
import '../controllers/dash_controller.dart';
import 'chat_view.dart';

class DashboardView extends GetView<DashController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: primaryClr,
      systemNavigationBarColor: tertiaryClr,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light,
      systemNavigationBarDividerColor: tertiaryClr,
      systemNavigationBarIconBrightness: Brightness.light,
      systemNavigationBarContrastEnforced: false,
      systemStatusBarContrastEnforced: false,
    ));
    return Obx(() {
      return Scaffold(
        key: controller.scaffoldKey,
        body: SafeArea(
          child: PageView(
            controller: controller.pageCtrl,
            onPageChanged: controller.onPageChanged(controller.currentIndex.value),
            physics: const NeverScrollableScrollPhysics(),
            children: pages,
          ),
        ),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            color: tertiaryClr,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
          ),
          clipBehavior: Clip.hardEdge,
          child: bottomNavigationBar(),
        ),
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
        destinations: [],
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
        indicatorColor: onTertiaryClr,
        indicatorShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
      );
    } else {
      return null;
    }
  }

  BottomNavigationBarItem navItem(String icon, String activeIcon, String title) {
    if (title.toLowerCase() == "more") {
      return BottomNavigationBarItem(
        icon: Container(),
        label: title,
      );
    } else {
      return BottomNavigationBarItem(icon: Container(), label: title);
    }
  }

  BottomNavigationBar bottomNavigationBar() {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        navItem(Assets.imagesIcSearch, Assets.imagesIcSearch, "Home"),
        navItem(Assets.imagesIcSearch, Assets.imagesIcSearch, "Market"),
        navItem(Assets.imagesIcSearch, Assets.imagesIcSearch, "Chat"),
        navItem(Assets.imagesIcSearch, Assets.imagesIcSearch, "News"),
        navItem(Assets.imagesIcSearch, Assets.imagesIcSearch, "More"),
      ],
      type: BottomNavigationBarType.fixed,
      backgroundColor: tertiaryClr,
      currentIndex: controller.currentIndex.value,
      onTap: (index) {
        if (index == 4) {
          controller.scaffoldKey.currentState?.openDrawer();
        } else {
          controller.onPageChanged(index);
        }
      },
    );
  }
}

const pages = [HomeView(), MarketView(), ChatView(), NewsView()];
