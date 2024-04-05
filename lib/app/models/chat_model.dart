
class ChatModel {
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
}
