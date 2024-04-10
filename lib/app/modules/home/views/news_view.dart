import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:stock_app/app/modules/home/controllers/dash_controller.dart';
import 'package:stock_app/app/network/response/NewsResponse.dart';
import 'package:stock_app/app/utils/extensions/extension.dart';

import '../../../network/utils/log_util.dart';
import '../../../theme/app_colors.dart';
import '../../../widgets/common_app_bar.dart';
import '../../../widgets/common_text.dart';
import '../../../widgets/image.dart';
import '../../../widgets/widgets.dart';

class NewsView extends GetView<DashController> {
  const NewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CommonAppBar(
          title: "News",
          hasBackIcon: false,
        ),
        body: Obx(() {
          return controller.newsList.isEmpty
              ? const SpinKitThreeBounce(color: secondaryClr, size: 20)
              : Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: Column(
                    children: [
                      Expanded(
                        child: Obx(() {
                          return ListView.builder(
                              shrinkWrap: true,
                              controller: controller.newsScrollController,
                              itemCount: controller.newsList.length,
                              itemBuilder: (context, index) => _singleTutorialItem(controller.newsList[index], index, context, () {
                                    Alert.log(runtimeType.toString(), "CLICK");
                                  }));
                        }),
                      ),
                      Obx(() => controller.newsMoreLoading.value ? pageLoader(context) : Container())
                    ],
                  ));
        }));
  }

  Widget _singleTutorialItem(Results item, int index, BuildContext context, VoidCallback callback) {
    return Container(
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: carDecoration,
      child: Material(
        color: cardClr,
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: callback,
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(0))),
                width: double.infinity,
                height: MediaQuery.of(context).size.height * .25,
                clipBehavior: Clip.hardEdge,
                child: SquareImageFromNetwork(
                  imageUrl: item.imageUrl ?? "",
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: CommonText.regular(
                      item.title ?? "",
                      maxLines: 2,
                      size: 14,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  CommonText.regular(
                    item.description ?? "",
                    color: neutralClr,
                    maxLines: item.isSelected ? null : 2,
                    overflow: item.isSelected ? null : TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  CommonText(
                    item.isSelected ? "Read Less" : "Read More",
                    size: 12,
                    onTap: () {
                      controller.newsList.forEachIndexed((element, innerIndex) {
                        if (innerIndex == index) {
                          element.isSelected = !element.isSelected;
                        } else {
                          element.isSelected = false;
                        }
                      });
                      controller.newsList.refresh();
                    },
                    color: item.isSelected ? warningClr : tertiaryClr,
                  )
                ],
              ).paddingSymmetric(vertical: 4, horizontal: 8),
            ],
          ),
        ),
      ),
    );
  }
}
