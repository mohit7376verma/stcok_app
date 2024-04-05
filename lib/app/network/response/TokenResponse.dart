class TokenResponse {
  TokenResponse({
      this.accessToken,
      this.expiresIn,
      this.scope,
      this.tokenType,});

  TokenResponse.fromJson(dynamic json) {
    accessToken = json['access_token'];
    expiresIn = json['expires_in'];
    scope = json['scope'];
    tokenType = json['token_type'];
  }
  String? accessToken;
  int? expiresIn;
  String? scope;
  String? tokenType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['access_token'] = accessToken;
    map['expires_in'] = expiresIn;
    map['scope'] = scope;
    map['token_type'] = tokenType;
    return map;
  }

}