import 'dart:io';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

Future<String> tempDirectory() async {
  final directory = await path_provider.getTemporaryDirectory();
  return _checkAndCreateDir(directory);
}

Future<String> downloadDirectory() async {
  final directory = Platform.isAndroid ? await path_provider.getExternalStorageDirectory() : await path_provider.getApplicationDocumentsDirectory();
  return _checkAndCreateDir(directory!);
}

Future<String> _checkAndCreateDir(Directory directory) async {
  bool hasExisted = await directory.exists();
  if (!hasExisted) directory.create();
  return directory.path;
}

String getFormattedCardNumber(String cardNumber, [bool padZero = true]) {
  if (cardNumber.isEmpty) return "0000  0000  0000  0000";
  var text = padZero ? cardNumber.replaceAll(" ", '').padRight(16, "0") : cardNumber;
  var buffer = StringBuffer();
  for (int i = 0; i < text.length; i++) {
    buffer.write(text[i]);
    if ((i + 1) % 4 == 0) buffer.write("  ");
  }
  return buffer.toString().trim();
}

String getFormattedCardMonth(String cardMonth, [bool padZero = true]) {
  if (cardMonth.isEmpty) return "00/0000";
  var text = padZero ? cardMonth.replaceAll("/", '').padRight(6, "0") : cardMonth;
  var buffer = StringBuffer();
  for (int i = 0; i < text.length; i++) {
    buffer.write(text[i]);
    if (i == 1) buffer.write('/');
  }
  return buffer.toString().trim();
}

String getHiddenAccountNumber(String accountNumber) {
  if (accountNumber.isEmpty) return "";
  var buffer = StringBuffer();
  var length = accountNumber.length;
  for (int i = 0; i < length - 4; i++) {
    buffer.write("*");
    if ((i + 1) % 4 == 0) buffer.write(' ');
  }
  buffer.write(accountNumber.substring(length - 4));
  return buffer.toString().trim();
}

String get deviceType {
  return Platform.isAndroid ? "0" : "1";
}

String formatDate(String time) {
  try {
    var timeStamp = DateTime.fromMillisecondsSinceEpoch(int.parse(time));
    var format = DateFormat('MM-dd-yyyy');
    var currentDate = format.format(DateTime.now());
    var date = format.format(timeStamp);
    var days = format.parse(currentDate).difference(format.parse(date)).inDays;

    var rTime = DateFormat('hh:mm a').format(timeStamp);
    if (days == 0) {
      return rTime;
    } else if (days == 1) {
      return "Yesterday";
    } else {
      return date;
    }
  } catch (e) {
    e.printError();
    return time;
  }
}
