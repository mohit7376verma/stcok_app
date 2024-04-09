import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_app/app/theme/app_colors.dart';
import 'package:stock_app/app/utils/extensions/extension.dart';

import '../../../../generated/assets.dart';
import '../../../widgets/common_app_bar.dart';
import '../../../widgets/common_text.dart';
import '../../../widgets/common_text_field.dart';
import '../../../widgets/image.dart';
import '../../../widgets/widgets.dart';
import '../controllers/message_controller.dart';
import 'message.dart';

class MessageView extends GetView<MessageController> {
  const MessageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CommonAppBar(title: controller.receiverName.value.toString()),
      body: InkWell(
        onTap: () {
          FocusScope.of(context).unfocus();
          controller.messageFocus.unfocus();
        },
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(color: primaryClr),
          child: Column(
            children: [
              controller.isLoaderVisible.value ? const SizedBox(height: 4) : const SizedBox(),
              Visibility(visible: controller.isLoaderVisible.value, child: pageLoader(context)),
              Expanded(
                child: Container(
                  child: ListView.builder(
                      itemCount: controller.chatList.length,
                      controller: controller.scrollController,
                      itemBuilder: (context, index) {
                        return Message(
                          recImage: controller.receiverImage.value,
                          recName: controller.receiverName.value,
                          message: controller.chatList[index],
                        );
                      }).paddingOnly(top: 8, left: 8, right: 8),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                child: textBox(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget textBox(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: onBackgroundClr,
        boxShadow: [BoxShadow(offset: const Offset(0, -2), color: onBackgroundClr.withOpacity(0.05))],
      ),
      child: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(0),
                      child: CommonTextField(
                        controller: controller.messageController,
                        hintText: "Type Your Message here...",
                        keyboardType: TextInputType.multiline,
                        maxLines: 20,
                        focus: controller.messageFocus.obs.value,
                        bgColor: tertiaryClr.withOpacity(0.2),
                        borderColor: tertiaryClr,
                        onTap: () {
                          if (controller.emojiShowing.value) {
                            controller.emojiShowing.value = false;
                          }
                        },
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: InkWell(
                            onTap: () {
                              controller.emojiShowing.value = !controller.emojiShowing.value;
                              context.hideKeyboard();
                            },
                            child: SquareSvgImageFromAsset(Assets.imagesIcEmogi,
                                size: 40, color: controller.messageFocus.hasFocus ? onPrimaryClr : onPrimaryClr.withOpacity(0.5)),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  FloatingActionButton.small(
                    onPressed: () {
                      if (controller.messageController.text.isNotEmpty) {
                        // controller.sendMessage(Types.TEXT, controller.messageController.text);
                      } else {
                        return;
                      }
                    },
                    heroTag: null,
                    backgroundColor: tertiaryClr,
                    elevation: 0.0,
                    focusElevation: 0.0,
                    highlightElevation: 0.0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                    child: const Icon(Icons.send, color: onPrimaryClr).paddingAll(8),
                  ),
                ],
              ),
            ),
            Offstage(
              offstage: !controller.emojiShowing.value,
              child: Obx(
                () => SizedBox(
                  height: 245,
                  child: controller.emojiShowing.value
                      ? EmojiPicker(
                          textEditingController: controller.messageController,
                          onBackspacePressed: _onBackspacePressed,
                          config: Config(
                            columns: 9,
                            bgColor: surfaceClr,
                            indicatorColor: secondaryClr,
                            backspaceColor: secondaryClr,
                            iconColorSelected: secondaryClr,
                            buttonMode: ButtonMode.CUPERTINO,
                            noRecents: const CommonText.regular('No Recent Emojis', textAlign: TextAlign.center),
                            emojiSizeMax: 32 * (foundation.defaultTargetPlatform == TargetPlatform.iOS ? 1.30 : 1.0),
                          ),
                        )
                      : Container(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _onBackspacePressed() {
    controller.messageController
      ..text = controller.messageController.text.characters.toString()
      ..selection = TextSelection.fromPosition(TextPosition(offset: controller.messageController.text.length));
  }
}
