import 'package:get/get.dart';
import 'package:stock_app/app/utils/constants.dart';

import '../../../models/TutorialModel.dart';

class TutorialController extends GetxController {
  RxList<TutorialModel> tutorialList = <TutorialModel>[].obs;

  @override
  void onInit() {

   tutorialList.clear();
   tutorialList.add(TutorialModel(dummyText, false));
   tutorialList.add(TutorialModel(dummyText, false));
   tutorialList.add(TutorialModel(dummyText, false));
   tutorialList.add(TutorialModel(dummyText, false));
   tutorialList.add(TutorialModel(dummyText, false));

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
