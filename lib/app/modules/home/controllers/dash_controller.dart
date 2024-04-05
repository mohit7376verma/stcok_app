import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashController extends GetxController {
  RxInt currentIndex = 0.obs;
  var isDrawerOpen = false.obs;

  PageController pageCtrl = PageController(initialPage: 0, keepPage: true);
  var scaffoldKey = GlobalObjectKey<ScaffoldState>(ScaffoldState());

  final count = 0.obs;

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

  void increment() => count.value++;
}
