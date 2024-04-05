
/*class ChatModel {
  final String senderId;
  final String receiverId;
  final String msg;
  final String receiverName;
  final String type;
  final String timeStamp;
  final bool isSender;

  ChatModel(
      {required this.senderId,
      required this.receiverId,
      required this.msg,
      required this.receiverName,
      required this.type,
      required this.timeStamp,
      required this.isSender,});

  Map<String, dynamic> toMap() {
    return {
      'senderId': senderId,
      'receiverId': receiverId,
      'msg': msg,
      'receiverName': receiverName,
      'type': type,
      'timeStamp': timeStamp,
    };
  }
}*/


class ChatModel {
  final String senderId;
  final String receiverId;
  final String msg;
  final String receiverName;
  final String receiverImage;
  final String senderName;
  final String senderImage;
  final String type;
  final String timeStamp;
  final String pushKey;
  String? status;
  String? requestId;
  String? paidId;
  int? unReadCount;

  ChatModel({
    required this.senderId,
    required this.receiverId,
    required this.msg,
    required this.receiverName,
    required this.receiverImage,
    required this.senderName,
    required this.senderImage,
    required this.type,
    required this.timeStamp,
    required this.pushKey,
    this.status,
    this.requestId,
    this.paidId,
    this.unReadCount
  });
}