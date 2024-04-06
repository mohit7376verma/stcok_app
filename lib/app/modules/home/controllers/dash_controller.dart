import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashController extends GetxController {
  RxInt currentIndex = 0.obs;
  var isDrawerOpen = false.obs;

  PageController pageCtrl = PageController(initialPage: 0, keepPage: true);
  var scaffoldKey = GlobalObjectKey<ScaffoldState>(ScaffoldState());

  TextEditingController searchController = TextEditingController();
  final FocusNode searchFocus = FocusNode();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  chatRefresh() {}

  onPageChanged(int index) {
    try {
      pageCtrl.animateToPage(index, duration: const Duration(milliseconds: 350), curve: Curves.ease);
      currentIndex.value = index;
    } catch (e) {
      e.printError();
    }
  }
}
