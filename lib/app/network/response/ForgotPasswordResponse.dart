class ForgotPasswordResponse {
  ForgotPasswordResponse({
      this.status, 
      this.message, 
      this.errorType, 
      this.data,});

  ForgotPasswordResponse.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    errorType = json['error_type'];
    data = json['data'];
  }
  String? status;
  String? message;
  String? errorType;
  dynamic data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    map['error_type'] = errorType;
    map['data'] = data;
    return map;
  }

}