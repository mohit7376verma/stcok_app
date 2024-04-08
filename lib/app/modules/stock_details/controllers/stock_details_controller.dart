import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class StockDetailsController extends GetxController with GetTickerProviderStateMixin {
  late TabController tabController;
  Rx tabIndex=0.obs;
  RxList<SalesData> data = [
    SalesData('Jan', 35),
    SalesData('Feb', 20),
    SalesData('Mar', 34),
    SalesData('Apr', 12),
    SalesData('May', 40)
  ].obs;

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
 class SalesData {
  SalesData(this.year, this.sales);

  final String year;
  final double sales;
}