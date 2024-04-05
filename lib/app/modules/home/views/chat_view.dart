import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_app/generated/assets.dart';

import '../../../models/chat_model.dart';
import '../../../routes/app_pages.dart';
import '../../../theme/app_colors.dart';
import '../../../utils/pref.dart';
import '../../../widgets/common_text.dart';
import '../../../widgets/image.dart';
import '../../Dashboard/controllers/dashboard_controller.dart';

class ChatView extends GetView<DashboardController> {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    List<ChatModel> recentChatList = <ChatModel>[];

    recentChatList.add(ChatModel(
        senderId: "",
        receiverId: "",
        msg: "Hello",
        receiverName: "Jhon",
        receiverImage: "https://www.gravatar.com/avatar/2c7d99fe281ecd3bcd65ab915bac6dd5?s=250",
        senderName: "Alex",
        senderImage: "",
        type: "text",
        timeStamp: "",
        pushKey: ""));

    recentChatList.add(ChatModel(
        senderId: "",
        receiverId: "",
        msg: "Hi",
        receiverName: "Mark",
        receiverImage: "https://gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50.jpg",
        senderName: "Alex",
        senderImage: "",
        type: "text",
        timeStamp: "",
        pushKey: ""));

    return SafeArea(
      child: Scaffold(
        backgroundColor: onBackgroundClr,
        body: RefreshIndicator.adaptive(
            onRefresh: () => controller.chatRefresh(),
            displacement: 20,
            edgeOffset: 20,
            color: primaryClr,
            child: Container(
              height: double.infinity,
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(color: onBackgroundClr),
              child: ListView.builder(
                  itemCount: recentChatList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return _singleItemView(recentChatList[index], context);
                  }),
            )),
      ),
    );
  }
}

Widget _singleItemView(ChatModel model, BuildContext context) {
  return Container(
    clipBehavior: Clip.hardEdge,
    decoration: BoxDecoration(
      color: surfaceClr,
      borderRadius: BorderRadius.circular(8),
      boxShadow: [BoxShadow(color: onBackgroundClr.withOpacity(0.1), blurRadius: 4)],
    ),
    child: Material(
      child: Ink(
        decoration: BoxDecoration(
          color: surfaceClr,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [BoxShadow(color: onBackgroundClr.withOpacity(0.1), blurRadius: 4)],
        ),
        child: InkWell(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 48,
                height: 48,
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(shape: BoxShape.circle),
                // child: SquareImageFromNetwork(imageUrl: model.senderId == Prefs().userId() ? model.receiverImage : model.senderImage),
                child: const SquareImageFromAsset(Assets.imagesAvatar),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText.bold(model.senderId == Prefs().userId() ? model.receiverName : model.senderName, size: 16),
                    CommonText.medium(
                      model.msg,
                      maxLines: 1,
                      size: 14,
                      overflow: TextOverflow.ellipsis,
                      color: secondaryClr.withOpacity(0.7),
                    ),
                  ],
                ),
              ),
              /*Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CommonText.semiBold(formatDate(model.timeStamp))
                      .marginOnly(bottom: model.unReadCount != null && model.unReadCount.toString().toInt() > 0 ? 8 : 0),
                  Visibility(
                    visible: model.unReadCount != null && model.unReadCount.toString().toInt() > 0 ? true : false,
                    child: Container(
                      height: 28,
                      width: 28,
                      alignment: Alignment.center,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        color: secondaryClr,
                        borderRadius: BorderRadius.circular(100),
                        boxShadow: [BoxShadow(color: onBackgroundClr.withOpacity(0.05), blurRadius: 4)],
                      ),
                      child: CommonText.bold(
                        (model.unReadCount ?? 0) >= 100 ? "99+" : model.unReadCount.toString(),
                        textAlign: TextAlign.center,
                        color: onPrimaryClr,
                        size: 10,
                      ),
                    ),
                  )
                ],
              )*/
            ],
          ).paddingAll(12),
          onTap: () {
            var receiverId = "";
            var receiverName = "";
            var receiverImg = "";
            if (Prefs().userId() == model.senderId) {
              receiverId = model.receiverId;
              receiverName = model.receiverName;
              receiverImg = model.receiverImage;
            } else {
              receiverId = model.senderId;
              receiverName = model.senderName;
              receiverImg = model.senderImage;
            }
            Get.toNamed(Routes.MESSAGE, arguments: {"name": receiverName, "receiverId": receiverId, "img": receiverImg});
          },
        ),
      ),
    ),
  ).marginOnly(top: 8, bottom: 8);
}
