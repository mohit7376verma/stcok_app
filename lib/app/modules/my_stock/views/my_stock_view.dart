import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_app/app/widgets/common_app_bar.dart';

import '../../../theme/app_colors.dart';
import '../../../utils/constants.dart';
import '../../../widgets/common_text.dart';
import '../../../widgets/image.dart';
import '../controllers/my_stock_controller.dart';

class MyStockView extends GetView<MyStockController> {
  const MyStockView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: "My Stocks"),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [myStocks(context)],
          ),
        ),
      ),
    );
  }

  Widget myStocks(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 20,
        itemBuilder: (context, index) {
          return Container(
            decoration: carDecoration,
            child: Row(
              children: [
                CircleAvatar(
                  radius: 22,
                  backgroundColor: tertiaryClr,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: const SquareImageFromNetwork(
                      imageUrl: defaultImage,
                      fit: BoxFit.cover,
                      size: 44,
                    ),
                  ).marginAll(2),
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText.semiBold(
                      "Stocks Name",
                      size: 14,
                    ),
                    CommonText.semiBold(
                      "\$13.2342",
                      size: 14,
                    ),
                  ],
                ).marginOnly(left: 8)
              ],
            ).paddingAll(12),
          ).paddingAll(8);
        });
  }
}
