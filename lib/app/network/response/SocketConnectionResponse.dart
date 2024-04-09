class SocketConnectionResponse {
  SocketConnectionResponse({
      this.ev, 
      this.status, 
      this.message,});

  SocketConnectionResponse.fromJson(dynamic json) {
    print("event ${(json)}");

    ev = json[0]['ev'];
    status = json[0]['status'];
    message = json[0]['message'];
  }
  String? ev;
  String? status;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ev'] = ev;
    map['status'] = status;
    map['message'] = message;
    return map;
  }

}