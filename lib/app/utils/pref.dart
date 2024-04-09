import 'dart:async';
import 'dart:convert';

import 'package:get_storage/get_storage.dart';

import '../models/credentials_model.dart';

class Prefs {
  static const String sharedPref = 'stock';
  static const String rememberPref = 'remember_prefs';
  static const String userToken = 'token';
  static const String name = 'name';
  static const String email = 'user_email';
  static const String image = 'user_image';
  static const String id = 'user_id';
  static const String phone = 'phone';
  static const String credentials = 'credentials_list';

  final GetStorage _prefs = GetStorage(sharedPref);
  final GetStorage _rememberPrefs = GetStorage(rememberPref);

  Future<void> init() async {
    await GetStorage.init(sharedPref);
    await GetStorage.init(rememberPref);
  }

  void clear() {
    _prefs.erase();
  }

  void removeData(String key) {
    _prefs.remove(key);
  }

  void putData(String key, String value) {
    _prefs.write(key, value);
  }

  void saveList(String key, List<Credentials> data) {
    _rememberPrefs.write(key, jsonEncode(data));
  }

  List<dynamic> getList(String key) {
    return jsonDecode(_rememberPrefs.read(key) ?? "[]") as List<dynamic>;
  }

  String getData(String key) {
    return _prefs.read(key) ?? '';
  }

  String token() {
    return getData(userToken);
  }

  String userName() {
    return getData(name);
  }

  String userId() {
    return getData(id);
  }

  String userEmail() {
    return getData(email);
  }

  String userImage() {
    return getData(image);
  }
}
