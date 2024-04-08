import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_app/app/modules/home/controllers/dash_controller.dart';

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
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CommonTextField(
              bgColor: secondaryClr,
              controller: controller.searchController,
              inputAction: TextInputAction.search,
              cursorColor: neutralClr,
              textColor: primaryClr,
              focus: controller.searchFocus,
              prefixIcon: IconButton(
                icon: const SquareSvgImageFromAsset(Assets.imagesIcSearch, size: 20),
                onPressed: () => FocusScope.of(context).unfocus(),
                color: primaryClr,
              ),
              hintText: "Search Stock ...",
            ).paddingOnly(bottom: 8),
            Expanded(child: marketStocks(context))
          ],
        ),
      ),
    );
  }

  Widget marketStocks(BuildContext context) {
    return ListView.builder(
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
                Expanded(
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonText.semiBold(
                        "Stocks Name",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        size: 14,
                      ),
                      CommonText.semiBold(
                        "\$13.2342",
                        size: 14,
                        color: warningClr,
                      ),
                    ],
                  ).marginOnly(left: 8),
                ),
                IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border_outlined))
              ],
            ).paddingAll(12),
          ).paddingOnly(top: 8, bottom: 8);
        });
  }
}
