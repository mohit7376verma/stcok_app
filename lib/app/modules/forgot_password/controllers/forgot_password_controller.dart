import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {

  final GlobalKey<FormState> forgotFormKey = GlobalKey<FormState>();

  RxBool forgotOtpStatus = true.obs;

  //forgot password
  TextEditingController fEmailController = TextEditingController();
  TextEditingController fCodeController = TextEditingController();

  FocusNode fEmailFocus = FocusNode();
  FocusNode fCodeFocus = FocusNode();

  final count = 0.obs;
  @override
  void onInit() {
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
}
