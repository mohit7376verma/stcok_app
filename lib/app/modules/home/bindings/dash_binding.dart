import 'package:get/get.dart';

import '../../Dashboard/controllers/dashboard_controller.dart';
import '../controllers/dash_controller.dart';

class DashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashController>(
      () => DashController(),
    );
  }
}
