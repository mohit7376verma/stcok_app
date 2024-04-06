import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_app/app/gen/assets.gen.dart';
import 'package:stock_app/app/routes/app_pages.dart';
import 'package:stock_app/app/theme/app_colors.dart';
import 'package:stock_app/app/widgets/common_button.dart';
import 'package:stock_app/app/widgets/common_text.dart';
import 'package:stock_app/app/widgets/image.dart';

import '../../../routes/app_pages.dart';
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
            appBar(),
            topHeaderSection(context),
            Row(
              children: [
                const Expanded(
                    child: CommonText.medium(
                  "Favorite Stocks",
                  size: 16,
                )),
                CommonButton.outline(onPressed: () {}, label: "View All", textSize: 12, mPadding: EdgeInsets.all(4)),
              ],
            ).marginOnly(left: 16, right: 16),
            Container(
              decoration: const BoxDecoration(
                color: primaryClr,
                // borderRadius: BorderRadius.all(Radius.circular(12)),
                // boxShadow: [BoxShadow(color: shadowClr, blurRadius: 4.0)]
              ),
              child: favoriteStocks(context),
              height: MediaQuery.of(context).size.height * 0.23,
            ).marginAll(4),
            Row(
              children: [
                const Expanded(
                    child: CommonText.medium(
                  "My Stocks",
                  size: 18,
                )),
                CommonButton.outline(
                  onPressed: () {
                    Get.toNamed(Routes.MY_STOCK);
                  },
                  label: "View All",
                  textSize: 12,
                  mPadding: EdgeInsets.all(4),
                ),
              ],
            ).marginOnly(left: 16, right: 16),
            Container(
                    decoration: const BoxDecoration(
                      color: primaryClr,
                      // borderRadius: BorderRadius.all(Radius.circular(12)),
                      // boxShadow: [BoxShadow(color: shadowClr, blurRadius: 4.0)]
                    ),
                    child: Expanded(child: myStocks(context)))
                .marginAll(4)
          ],
        ),
      ),
    ));
  }

  Widget topHeaderSection(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: carDecoration,
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
        ).marginOnly(left: 12, right: 12, bottom: 4, top: 8),
      ],
    );
  }

  Widget favoriteStocks(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 2 / 1,
      children: List.generate(4, (index) {
        return Container(
          decoration: carDecoration,
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CommonText.semiBold(
                    "Stocks Name",
                    color: secondaryClr,
                    size: 14,
                  ),
                  CommonText.semiBold(
                    "\$13.2342",
                    size: 14,
                    color: warningClr,
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
          return InkWell(
            focusColor: neutralClr,
            child: Container(
              decoration: carDecoration,
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 22,
                    backgroundColor: tertiaryClr,
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
                  Expanded(
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CommonText.semiBold(
                          "Stocks Name",
                          size: 14,
                        ),
                        CommonText.semiBold(
                          "description",
                          size: 12,
                          color: neutralClr,
                        ),
                      ],
                    ).marginOnly(left: 8),
                  ),
                   const Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CommonText.semiBold(
                        "\$13.2342",
                        size: 14,
                      ),
                      CommonText.semiBold(
                        "-0.3%",
                        size: 12,
                        color: errorClr,
                      ),
                    ],
                  ).marginOnly(left: 8)
                ],
              ).paddingAll(12),
            ).paddingAll(8),
            onTap: (){
             Get.toNamed(Routes.STOCK_DETAILS);
            },
          );
        });
  }

  Widget appBar() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: tertiaryClr,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(Assets.imagesAvatar.path),
                      clipBehavior: Clip.hardEdge,
                    ),
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CommonText.medium(
                        "Johan Dio",
                        size: 16,
                      ),
                      CommonText.medium(
                        "Johan Dio",
                        size: 12,
                        color: neutralClr,
                      ),
                    ],
                  ).marginOnly(left: 4)
                ],
              ),
            ),
          ),
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: cardClr,
                child: Icon(
                  Icons.search,
                  color: tertiaryClr,
                ).marginAll(4),
              ),
              CircleAvatar(
                radius: 20,
                backgroundColor: cardClr,
                child: Icon(
                  Icons.notifications,
                  color: tertiaryClr,
                ).marginAll(4),
              ).marginOnly(left: 8),
            ],
          ),
        ],
      ).paddingAll(16),
    );
  }
}
