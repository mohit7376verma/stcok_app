import 'package:get/get.dart';

import '../controllers/my_stock_controller.dart';

class MyStockBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyStockController>(
      () => MyStockController(),
    );
  }
}
