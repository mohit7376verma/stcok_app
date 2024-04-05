import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:stock_app/app/modules/home/controllers/dash_controller.dart';

class NewsView extends GetView<DashController> {
  const NewsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text(
        'NewsView is working',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
