

import 'dart:convert';

import '../api_end_points.dart';
import '../response/LoginResponse.dart';
import '../response/RegisterResponse.dart';
import '../utils/network_result.dart';
import 'base_repository.dart';

const title = "ApiRepo";

class AuthRepository extends BaseRepository {
  Future<NetworkResult<LoginResponse>> login(
      String email, String password) async {
    return post<LoginResponse>(ApiEndPoints.login,
        body: {"email": email, "password": password},
        fromJson: LoginResponse.fromJson);
  }

  Future<NetworkResult<RegisterResponse>> register(Map data) async {
    return post<RegisterResponse>(ApiEndPoints.register,
        body:jsonEncode(data),
        fromJson: RegisterResponse.fromJson
    );
  }


}
