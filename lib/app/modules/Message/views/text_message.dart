import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/chat_model.dart';
import '../../../theme/app_colors.dart';
import '../../../utils/pref.dart';
import '../../../widgets/common_text.dart';

class TextMessage extends StatelessWidget {
  const TextMessage({
    super.key,
    this.message,
  });

  final ChatModel? message;

  @override
  Widget build(BuildContext context) {
    const border = BorderRadius.only(
      topLeft: Radius.circular(12),
      topRight: Radius.circular(12),
      bottomLeft: Radius.circular(12),
      bottomRight: Radius.circular(12),
    );

    return Flexible(
        child: SizedBox(
      width: MediaQuery.of(context).size.width * 0.65,
      child: Wrap(
        alignment: message?.senderId == Prefs().userId() ? WrapAlignment.end : WrapAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            decoration: BoxDecoration(
              color: message?.senderId == Prefs().userId() ? primaryClr : surfaceClr,
              borderRadius:
                  message?.senderId == Prefs().userId() ? border.copyWith(bottomRight: const Radius.circular(4)) : border.copyWith(bottomLeft: const Radius.circular(4)),
              boxShadow: [BoxShadow(color: onBackgroundClr.withOpacity(0.05), blurRadius: 4)],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText.regular(
                  message?.msg ?? "",
                  size: 14,
                  color: message?.senderId == Prefs().userId() ? Colors.white : onBackgroundClr,
                ),
                CommonText.regular(
                  message?.timeStamp ?? "",
                  size: 10,
                  color: message?.senderId == Prefs().userId() ? onPrimaryClr : onBackgroundClr,
                ).marginOnly(top: 6, bottom: 2),
              ],
            ),
          ).marginOnly(left: 8, right: 8),
        ],
      ),
    ));
  }
}
