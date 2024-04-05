class DefaultApiError {
  DefaultApiError({
    this.status,
    this.type,
    this.message,
    this.data,
  });

  DefaultApiError.fromJson(dynamic json) {
    status = json['status'];
    type = json['type'];
    message = json['message'];
    data = json['data'];
  }

  String? status;
  String? type;
  String? message;
  dynamic data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['type'] = type;
    map['message'] = message;
    map['data'] = data;
    return map;
  }
}
