import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_app/app/modules/home/controllers/dash_controller.dart';
import 'package:stock_app/app/network/utils/log_util.dart';
import 'package:stock_app/app/utils/no_data_view.dart';
import 'package:stock_app/app/widgets/widgets.dart';

import '../../../../generated/assets.dart';
import '../../../theme/app_colors.dart';
import '../../../utils/constants.dart';
import '../../../widgets/common_app_bar.dart';
import '../../../widgets/common_text.dart';
import '../../../widgets/common_text_field.dart';
import '../../../widgets/image.dart';

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
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
        child: Column(
          children: [
            CommonTextField(
              bgColor: cardClr,
              controller: controller.searchController,
              inputAction: TextInputAction.search,
              cursorColor: neutralClr,
              textColor: secondaryClr,
              focus: controller.searchFocus,
              prefixIcon: IconButton(
                icon: const Icon(
                  Icons.search,
                  color: secondaryClr,
                ),
                onPressed: () {
                  FocusScope.of(context).unfocus();
                },
                color: secondaryClr,
              ),
              hintText: "Search Stock ....",
            ).paddingOnly(bottom: 8),
            Expanded(child: Obx(() {
              return marketStocks(context);
            })),
            Obx(() => controller.isLoading.value ? pageLoader(context) : Container())
          ],
        ),
      ),
    );
  }

  Widget marketStocks(BuildContext context) {
    return controller.stockList.isEmpty ? const NoDataView(title: "No Stocks Found",showImage: true,): ListView.builder(
        shrinkWrap: true,
        controller: controller.stockScrollController,
        itemCount: controller.stockList.length,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(2),
            decoration: carDecoration,
            child: Material(
              color: cardClr,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () {
                  Alert.log(runtimeType.toString(), "ITEM ${controller.stockList[index].toJson()}");
                },
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
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonText.semiBold(
                            controller.stockList[index].name ?? "",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            size: 14,
                          ),
                          const CommonText.semiBold(
                            "\$13.2342",
                            size: 14,
                            color: warningClr,
                          ),
                        ],
                      ).marginOnly(left: 8),
                    ),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border_outlined))
                  ],
                ).paddingAll(10),
              ),
            ),
          ).paddingOnly(top: 8, bottom: 8);
        });
  }
}
