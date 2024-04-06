import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StockDetailsController extends GetxController with GetTickerProviderStateMixin {
  late TabController tabController;
  Rx tabIndex=0.obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    tabController=TabController(length: 4, vsync: this);
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
