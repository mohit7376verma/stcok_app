import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:stock_app/app/utils/extensions/extension.dart';

import '../../../models/credentials_model.dart';
import '../../../network/utils/log_util.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/pref.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();

  RxBool hidePassword = true.obs;
  RxBool isRemember = false.obs;

  List<Credentials> credentialList = [];
  List<String> emailList = [];

  @override
  void onInit() {
    credentialList.clear();
    emailList.clear();
    /*credentialList.add(Credentials(email: "a@gmail.com", password: "12345678"));
    credentialList.add(Credentials(email: "alex@gmail.com", password: "1234aa5678"));
    emailList.add(credentialList[0].email ?? "");
    emailList.add(credentialList[1].email ?? "");*/

    try {
      credentialList = Prefs().getList(Prefs.credentials).map((e) => Credentials.fromJson(e)).toList();
      if (credentialList.isNotEmpty) {
        for (var element in credentialList) {
          emailList.add(element.email ?? "");
        }
      }
    } catch (e) {
      Alert.log(runtimeType.toString(), e.toString());
    }

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    emailFocus.dispose();
    passwordFocus.dispose();
  }

  Future<void> signIn(BuildContext context) async {
    context.hideKeyboard();
    Get.toNamed(Routes.HOME);

    /*if (formKey.currentState?.validate() ?? false) {
      Loader.showLoading();
      var repo = await AuthRepository().login(emailController.text.trim(), passwordController.text.trim());
      repo.when(success: (value) {
        Loader.hideLoading();
        if(isRemember.value) saveCredentials();
        Get.offAndToNamed(Routes.HOME);
      }, error: (error) {
        Loader.hideLoading();
        showSheet(context: context, title: "Error", message: error.errorMessage, primaryBtnText: "Okay", onPrimaryBtnClick: () => Get.back());
      });
    }*/
  }

  String findPassword(String email) {
    if (credentialList.isNotEmpty) {
      return credentialList.firstWhere((element) => element.email == email).password;
    }
    return "";
  }

  void saveCredentials() {
    var credential = Credentials(email: emailController.text, password: passwordController.text);

    if (credentialList.isNotEmpty) {
      var exist = false;

      for (var element in credentialList) {
        if (element.email == emailController.text) {
          exist = true;
        }
      }

      Alert.log(runtimeType.toString(), "ALREADY EXIST $exist");

      if (exist) {
        if (credentialList.firstWhere((element) => element.email == emailController.text).password != passwordController.text) {
          Alert.log(runtimeType.toString(), "pass do not match");
          credentialList.removeAt(credentialList.indexOf(credential));
          credentialList.add(credential);
          Prefs().saveList(Prefs.credentials, credentialList);
        }
      } else {
        credentialList.add(credential);
        Prefs().saveList(Prefs.credentials, credentialList);
      }
    } else {
      credentialList.add(credential);
      Prefs().saveList(Prefs.credentials, credentialList);
    }

    Alert.log(runtimeType.toString(), "SAVED LIST ${Prefs().getList(Prefs.credentials)}");
  }
}
