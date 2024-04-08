import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_app/app/models/TutorialModel.dart';
import 'package:stock_app/app/network/utils/log_util.dart';
import 'package:stock_app/app/theme/app_colors.dart';
import 'package:stock_app/app/utils/constants.dart';
import 'package:stock_app/app/utils/extensions/extension.dart';
import 'package:stock_app/app/widgets/common_app_bar.dart';
import 'package:stock_app/app/widgets/common_text.dart';
import 'package:stock_app/app/widgets/image.dart';

import '../controllers/tutorial_controller.dart';

class TutorialView extends GetView<TutorialController> {
  const TutorialView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CommonAppBar(title: "Tutorial"),
        body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              children: [
                Flexible(
                  child: Obx(() {
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.tutorialList.length,
                        itemBuilder: (context, index) => _singleTutorialItem(controller.tutorialList[index], index, context, () {
                              Alert.log(runtimeType.toString(), "CLICK");
                            }));
                  }),
                ),
              ],
            )));
  }

  Widget _singleTutorialItem(TutorialModel item, int index, BuildContext context, VoidCallback callback) {
    return Container(
      decoration: carDecoration,
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(2),
      child: Material(
        color: cardClr,
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: callback,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(4))),
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
              CommonText.regular(
                item.data,
                maxLines: item.isSelected ? null : 2,
                overflow: item.isSelected ? null : TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 4,
              ),
              CommonText(
                item.isSelected ? "Read Less" : "Read More",
                onTap: () {
                  controller.tutorialList.forEachIndexed((element, innerIndex) {
                    if (innerIndex == index) {
                      element.isSelected = !element.isSelected;
                    } else {
                      element.isSelected = false;
                    }
                  });
                  controller.tutorialList.refresh();
                },
                color: item.isSelected ? warningClr : tertiaryClr,
              ).paddingSymmetric(vertical: 2, horizontal: 4),
            ],
          ).paddingAll(10),
        ),
      ),
    );
  }
}
