class UpdateProfileResponse {
  UpdateProfileResponse({
      this.message, 
      this.status, 
      this.data,});

  UpdateProfileResponse.fromJson(dynamic json) {
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
      this.status,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    username = json['username'];
    fullname = json['fullname'];
    email = json['email'];
    roleId = json['role_id'];
    position = json['position'];
    profileImg = json['profile_img'];
    status = json['status'];
  }
  int? id;
  String? username;
  String? fullname;
  String? email;
  String? roleId;
  String? position;
  String? profileImg;
  String? status;

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
    return map;
  }

}