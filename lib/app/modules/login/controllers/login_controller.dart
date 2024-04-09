import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:stock_app/app/utils/extensions/extension.dart';
import 'package:stock_app/main.dart';

import '../../../network/repository/auth_repository.dart';
import 'package:stock_app/app/utils/extensions/extension.dart';

import '../../../models/credentials_model.dart';
import '../../../network/utils/log_util.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/pref.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  TextEditingController sNameController = TextEditingController();
  TextEditingController sPasswordController = TextEditingController();
  TextEditingController sEmailController = TextEditingController();
  TextEditingController sMobileController = TextEditingController();
  TextEditingController sOtpController = TextEditingController();

  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();

  RxBool hidePassword = true.obs;
  RxBool isRemember = false.obs;

  List<Credentials> credentialList = [];
  List<String> emailList = [];

  final count = 0.obs;


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

  void increment() => count.value++;

  Future<void> onSignUpTap(BuildContext context) async {
    context.hideKeyboard();
    // if (sOtpController.value.text.isNotEmpty && sOtpController.value.text.length < 6) {
    //   isValid = false;
    //   Fluttertoast.showToast(
    //       msg: "Please Enter otp",
    //       toastLength: Toast.LENGTH_SHORT,
    //       gravity: ToastGravity.CENTER,
    //       timeInSecForIosWeb: 1,
    //       backgroundColor: Colors.red,
    //       textColor: Colors.white,
    //       fontSize: 16.0);
    //   return;
    // }

    // if ((signupFormKey.currentState?.validate() ?? false ) && sOtpController.value.text.isNotEmpty) {
    //   LoaderView.showLoading();
      final data = <String, dynamic>{};
      data['name'] = sNameController.value.text;
      data['mobile'] = sMobileController.value.text;
      data['email'] = sEmailController.value.text;
      data['code'] = sOtpController.value.text;
      data['password'] = sPasswordController.value.text;

      var repo = await AuthRepository().register(data);
      repo.when(success: (value) {
        // if (value.status == "success") {
        // LoaderView.hideLoading();
        Get.back();
        // }
      }, error: (error) {
        // LoaderView.hideLoading();
        // LoaderView.showErrorDialog(title: "Error", description: error.errorMessage);
      });
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
