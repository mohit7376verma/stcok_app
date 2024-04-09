class Credentials {
  late String? email;
  late String password;

  Credentials({
    required this.email,
    required this.password,
  });

  Credentials.fromJson(dynamic json) {
    email = json['email'].toString();
    password = json['password'].toString();
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    map['password'] = password;
    return map;
  }
}
