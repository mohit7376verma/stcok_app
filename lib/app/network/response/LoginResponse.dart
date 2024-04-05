class LoginResponse {
  LoginResponse({
      this.message, 
      this.status, 
      this.data,});

  LoginResponse.fromJson(dynamic json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? message;
  String? status;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

class Data {
  Data({
      this.id, 
      this.username, 
      this.fullname, 
      this.email, 
      this.roleId, 
      this.position, 
      this.profileImg, 
      this.status, 
      this.token,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    username = json['username'];
    fullname = json['fullname'];
    email = json['email'];
    roleId = json['role_id'];
    position = json['position'];
    profileImg = json['profile_img'];
    status = json['status'];
    token = json['token'];
  }
  int? id;
  String? username;
  String? fullname;
  String? email;
  String? roleId;
  String? position;
  dynamic profileImg;
  String? status;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['username'] = username;
    map['fullname'] = fullname;
    map['email'] = email;
    map['role_id'] = roleId;
    map['position'] = position;
    map['profile_img'] = profileImg;
    map['status'] = status;
    map['token'] = token;
    return map;
  }

}