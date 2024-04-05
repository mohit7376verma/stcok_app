import 'package:get/get.dart';

import '../../../models/chat_model.dart';

class DashboardController extends GetxController {

  // RxList<ChatModel> recentChatList = <ChatModel>[].obs;

  final count = 0.obs;
  @override
  void onInit() {
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

  void increment() => count.value++;

  Future<void> chatRefresh() async {
   /* // isChatListLoading.value = true;
    await getRecentChatUser();*/
  }
}
