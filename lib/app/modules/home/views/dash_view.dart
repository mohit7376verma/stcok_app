import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_app/app/widgets/common_app_bar.dart';
import 'package:stock_app/generated/assets.dart';

import '../../../theme/app_colors.dart';
import '../../../widgets/image.dart';
import '../controllers/home_controller.dart';
import 'chat_view.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var scaffoldKey = GlobalObjectKey<ScaffoldState>(ScaffoldState());
    return Obx(() {
      return Scaffold(
        key: scaffoldKey,
        appBar: CommonAppBar(
          title: "Home",
          leadingIcon: Assets.imagesIcNotification,
          hasBackIcon: true,
          onBackTap: () {},
          actions: [
            IconButton(
              splashRadius: 24,
              onPressed: () => {},
              icon: const SquareSvgImageFromAsset(Assets.imagesIcSearch, color: onPrimaryClr),
            )
          ],
        ),
        body: const Center(
          child: Text(
            'HomeView is working',
            style: TextStyle(fontSize: 20),
          ),
        ),
        bottomNavigationBar: _bottomBar(context, scaffoldKey),
        drawer:
            Drawer(width: MediaQuery.sizeOf(context).width * .75, backgroundColor: onBackgroundClr, elevation: 0.0, child: const Center(child: Text("DRAWER"))),
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
          navItem(Assets.imagesIcSearch, Assets.imagesIcSearch, "News"),
          navItem(Assets.imagesIcSearch, Assets.imagesIcSearch, "More"),
        ],
        onDestinationSelected: (int index) {
          if (index == 3) {
            scaffoldKey.currentState?.openDrawer();
          } else {
            _onPageChanged(index);
          }
        },
        selectedIndex: controller.currentIndex.value,
        backgroundColor: surfaceClr,
        elevation: 0.0,
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
        icon: Text(title),
        label: title,
      );
    } else {
      return NavigationDestination(
        icon: Text(title),
        selectedIcon: SquareSvgImageFromAsset(title, color: onPrimaryClr, size: 28),
        label: title,
      );
    }
  }

  _onPageChanged(int index) {
    try {
      controller.pageCtrl.animateToPage(index, duration: const Duration(milliseconds: 350), curve: Curves.ease);
      controller.currentIndex.value = index;
    } catch (e) {
      e.printError();
    }
  }
}


