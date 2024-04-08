import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_app/app/modules/home/controllers/dash_controller.dart';
import 'package:stock_app/app/utils/extensions/extension.dart';

import '../../../models/TutorialModel.dart';
import '../../../network/utils/log_util.dart';
import '../../../theme/app_colors.dart';
import '../../../utils/constants.dart';
import '../../../widgets/common_app_bar.dart';
import '../../../widgets/common_text.dart';
import '../../../widgets/image.dart';

class NewsView extends GetView<DashController> {
  const NewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CommonAppBar(
          title: "News",
          hasBackIcon: false,
        ),
        body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              children: [
                Flexible(
                  child: Obx(() {
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.newsList.length,
                        itemBuilder: (context, index) => _singleTutorialItem(controller.newsList[index], index, context, () {
                              Alert.log(runtimeType.toString(), "CLICK");
                            }));
                  }),
                ),
              ],
            )));
  }

  Widget _singleTutorialItem(TutorialModel item, int index, BuildContext context, VoidCallback callback) {
    return InkWell(
     borderRadius: BorderRadius.circular(8),
      onTap: callback,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: carDecoration,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8))),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * .25,
              clipBehavior: Clip.hardEdge,
              child: const SquareImageFromNetwork(
                imageUrl: defaultImage,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Align(
              alignment: Alignment.topLeft,
              child: CommonText.regular(
                "News Title",
                maxLines: 2,
                size: 14,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            CommonText.regular(
              item.data,
              color: neutralClr,
              maxLines: item.isSelected ? null : 2,
              overflow: item.isSelected ? null : TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 4,
            ),
            CommonText(
              item.isSelected ? "Read Less" : "Read More",
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
              size: 12,
              color: item.isSelected ? warningClr : tertiaryClr,
            ),
          ],
        ),
      ),
    ).marginSymmetric(vertical: 8);
  }
}
