import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../models/chat_model.dart';
import '../../../theme/app_colors.dart';
import '../../../utils/fire_ref.dart';
import '../../../utils/pref.dart';
import '../../../widgets/common_text.dart';
import 'text_message.dart';

class Message extends StatelessWidget {
  final String recName;
  final String recImage;

  final ChatModel message;

  const Message({
    super.key,
    required this.recImage,
    required this.recName,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    Widget messageContainer(ChatModel message) {
      switch (message.type) {
        case Types.TEXT:
          return TextMessage(message: message);
        case Types.DATE:
          return _dateItem(message);
        default:
          return const SizedBox();
      }
    }

    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: (message.type == Types.TEXT)
          ? message.senderId == Prefs().userId()
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [messageContainer(message)],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [CircleAvatar(radius: 20, backgroundImage: NetworkImage(recImage)), messageContainer(message)],
                )
          : messageContainer(message),
    );
  }

  Widget _dateItem(ChatModel message) {
    return Center(
      child: Container(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
        decoration: BoxDecoration(
            color: secondaryClr, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: outlineClr.withOpacity(0.1), blurRadius: 4)]),
        child: CommonText.bold(checkDate(message.msg), color: onPrimaryClr),
      ),
    );
  }
}

String checkDate(String date) {
  try {
    var format = DateFormat('MM-dd-yyyy');
    var currentDate = format.format(DateTime.now());
    var days = format.parse(currentDate).difference(format.parse(date)).inDays;
    if (days == 0) {
      return "Today";
    } else if (days == 1) {
      return "Yesterday";
    } else {
      return date;
    }
  } catch (e) {
    e.printError();
    return date;
  }
}
