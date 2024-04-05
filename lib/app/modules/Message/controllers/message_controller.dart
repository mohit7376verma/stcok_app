import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../models/chat_model.dart';
import '../../../network/utils/log_util.dart';

class MessageController extends GetxController {

  late String receiverId = "";
  RxString receiverImage = "".obs;
  RxString receiverName = "".obs;
  RxBool isLoaderVisible = false.obs;
  RxBool emojiShowing = false.obs;
  RxList<ChatModel> chatList = <ChatModel>[].obs;

  final FocusNode messageFocus = FocusNode();
  ScrollController scrollController = ScrollController();
  final TextEditingController messageController = TextEditingController();


  @override
  void onInit() {

    if (Get.arguments != null) {
      receiverName.value = Get.arguments["name"];
      receiverImage.value = Get.arguments["img"];
      receiverId = Get.arguments["receiverId"];
    }

    Alert.log(runtimeType.toString(), "NAME => ${receiverName.value}");
    Alert.log(runtimeType.toString(), "IMAGE => ${receiverImage.value}");
    Alert.log(runtimeType.toString(), "RECEIVER ID => $receiverId");

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
