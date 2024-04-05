class RegisterResponse {
  RegisterResponse({
      this.status, 
      this.message, 
      this.errorType, 
      this.data,});

  RegisterResponse.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    errorType = json['error_type'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? status;
  String? message;
  String? errorType;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    map['error_type'] = errorType;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

class Data {
  Data({
      this.fullname, 
      this.email, 
      this.roleId, 
      this.position, 
      this.username, 
      this.status, 
      this.id,});

  Data.fromJson(dynamic json) {
    fullname = json['fullname'];
    email = json['email'];
    roleId = json['role_id'];
    position = json['position'];
    username = json['username'];
    status = json['status'];
    id = json['id'];
  }
  String? fullname;
  String? email;
  String? roleId;
  String? position;
  String? username;
  int? status;
  int? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['fullname'] = fullname;
    map['email'] = email;
    map['role_id'] = roleId;
    map['position'] = position;
    map['username'] = username;
    map['status'] = status;
    map['id'] = id;
    return map;
  }

}