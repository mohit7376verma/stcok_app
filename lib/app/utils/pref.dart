import 'dart:async';
import 'dart:convert';

import 'package:get_storage/get_storage.dart';

class Prefs {
  static const String sharedPref = 'stock';
  static const String userToken = 'token';
  static const String name = 'name';
  static const String email = 'user_email';
  static const String image = 'user_image';
  static const String id = 'user_id';

  final GetStorage _prefs = GetStorage(sharedPref);

  Future<void> init() async {
    await GetStorage.init(sharedPref);
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

  /*void saveList(String key, List<CryptoResponse> data) {
    _prefs.write(key, jsonEncode(data));
  }*/

  List<dynamic> getList(String key) {
    return jsonDecode(_prefs.read(key) ?? "[]") as List<dynamic>;
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
