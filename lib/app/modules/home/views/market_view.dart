import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_app/app/modules/home/controllers/dash_controller.dart';

import '../../../widgets/common_app_bar.dart';

class MarketView extends GetView<DashController> {
  const MarketView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: "Market",
        hasBackIcon: false,
      ),
      body: Container(
        child: Text("Market View"),
      ),
    );
  }
}

