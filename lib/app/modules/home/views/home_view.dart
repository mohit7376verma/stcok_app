import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:stock_app/app/gen/assets.gen.dart';
import 'package:stock_app/app/theme/app_colors.dart';
import 'package:stock_app/app/widgets/common_button.dart';
import 'package:stock_app/app/widgets/common_text.dart';
import 'package:stock_app/app/widgets/image.dart';

import '../../../utils/constants.dart';
import '../controllers/dash_controller.dart';

class HomeView extends GetView<DashController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        color: primaryClr,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            topHeaderSection(context),
            Row(
              children: [
                const Expanded(
                    child: CommonText.medium(
                  "Favorite Stocks",
                  size: 18,
                )),
                CommonButton.outline(onPressed: () {}, label: "View All", textSize: 12, mPadding: EdgeInsets.all(6)),
              ],
            ).marginOnly(left: 16, right: 16, top: 8, bottom: 8),
            Container(
              decoration: const BoxDecoration(
                  color: primaryClr,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  boxShadow: [BoxShadow(color: shadowClr, blurRadius: 4.0)]),
              child: favoriteStocks(context),
              height: MediaQuery.of(context).size.height * 0.21,
            ).marginOnly(left: 16, right: 16, top: 8, bottom: 8),
            Row(
              children: [
                const Expanded(
                    child: CommonText.medium(
                  "My Stocks",
                  size: 18,
                )),
                CommonButton.outline(
                  onPressed: () {},
                  label: "View All",
                  textSize: 12,
                  mPadding: EdgeInsets.all(6),
                ),
              ],
            ).marginOnly(left: 16, right: 16, top: 8, bottom: 8),
            Container(
                    decoration: const BoxDecoration(
                        color: primaryClr,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        boxShadow: [BoxShadow(color: shadowClr, blurRadius: 4.0)]),
                    child: Expanded(child: myStocks(context)).paddingAll(8))
                .marginOnly(left: 16, right: 16, top: 8, bottom: 8)
          ],
        ),
      ),
    ));
  }

  Widget topHeaderSection(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    color: primaryClr,
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    boxShadow: [BoxShadow(color: shadowClr, blurRadius: 4.0)]),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 22,
                      backgroundColor: primaryClr,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(Assets.imagesAvatar.path),
                        clipBehavior: Clip.hardEdge,
                      ).marginAll(2),
                    ),
                    const CommonText.medium(
                      "Johan Dio",
                      size: 16,
                    ).marginOnly(left: 8)
                  ],
                ).paddingAll(12),
              ).paddingAll(8),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    color: primaryClr,
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    boxShadow: [BoxShadow(color: shadowClr, blurRadius: 4.0)]),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 22,
                      backgroundColor: primaryClr,
                      child: Assets.imagesIcBack.svg(height: 24, width: 24).marginAll(4),
                    ),
                    const CommonText.medium(
                      "Name",
                      size: 16,
                    ).marginOnly(left: 8)
                  ],
                ).paddingAll(12),
              ).paddingAll(8),
            ),
          ],
        ).marginAll(8),
        Container(
          decoration: const BoxDecoration(
              color: primaryClr,
              borderRadius: BorderRadius.all(Radius.circular(12)),
              boxShadow: [BoxShadow(color: shadowClr, blurRadius: 4.0)]),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Expanded(
                child: CommonText.medium("Today", size: 14, textAlign: TextAlign.center),
              ),
              Container(width: 1, height: 24, color: Colors.grey.withOpacity(0.7)).marginOnly(
                left: 4,
                right: 4,
              ),
              const Expanded(child: CommonText.medium("Total Invest", size: 14, textAlign: TextAlign.center)),
              Container(width: 1, height: 24, color: Colors.grey.withOpacity(0.7)).marginOnly(left: 4, right: 4),
              const Expanded(child: CommonText.medium("Current Value", size: 14, textAlign: TextAlign.center)),
            ],
          ).paddingAll(12).marginOnly(top: 8, bottom: 8),
        ).marginOnly(left: 16, right: 16, bottom: 8, top: 8),
      ],
    );
  }

  Widget favoriteStocks(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 2 / 1,
      children: List.generate(4, (index) {
        return Container(
          decoration: BoxDecoration(
              color: primaryClr,
              borderRadius: BorderRadius.all(Radius.circular(12)),
              boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 4.0)]),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: SquareImageFromNetwork(
                  imageUrl: defaultImage,
                  fit: BoxFit.cover,
                  size: 40,
                ),
                clipBehavior: Clip.hardEdge,
              ).marginAll(2),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonText.semiBold(
                    "Stocks Name",
                    color: Colors.white,
                    size: 14,
                  ),
                  CommonText.semiBold(
                    "\$13.2342",
                    size: 14,
                    color: Colors.white,
                  ),
                ],
              ).marginOnly(left: 8)
            ],
          ).paddingAll(12),
        ).paddingAll(8);
      }),
    );
  }

  Widget myStocks(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 8,
        itemBuilder: (context, index) {
          return Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(12)),
                boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 4.0)]),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 22,
                  backgroundColor: primaryClr,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: SquareImageFromNetwork(
                      imageUrl: defaultImage,
                      fit: BoxFit.cover,
                      size: 44,
                    ),
                    clipBehavior: Clip.hardEdge,
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
