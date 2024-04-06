import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:stock_app/app/modules/home/controllers/dash_controller.dart';

import '../../../widgets/common_app_bar.dart';

class NewsView extends GetView<DashController> {
  const NewsView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CommonAppBar(
        title: "News",
        hasBackIcon: false,
      ),
      body: Text(
        'NewsView is working',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
