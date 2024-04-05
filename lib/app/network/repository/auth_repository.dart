

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

  Future<NetworkResult<RegisterResponse>> register(String name, String email,
      String password, String confirmPassword) async {
    return post<RegisterResponse>(ApiEndPoints.register,
        body: {
          "fullname": name,
          "email": email,
          "password": password,
          "password_confirmation": confirmPassword
        },
        fromJson: RegisterResponse.fromJson);
  }


}
