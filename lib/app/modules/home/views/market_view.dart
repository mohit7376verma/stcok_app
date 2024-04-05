import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:stock_app/app/modules/home/controllers/dash_controller.dart';

class MarketView extends GetView<DashController> {
  const MarketView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Market View"),
    );
  }
}

