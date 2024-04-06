import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var ctrFirstName = TextEditingController();
  var ctrLastName = TextEditingController();
  var ctrlEmail = TextEditingController();
  var ctrPhone = TextEditingController();
  var ctrlPassword = TextEditingController();
  var ctrlConPassword = TextEditingController();
  var ctrlSellPercentage = TextEditingController();
  var ctrlBuyPercentage = TextEditingController();

  FocusNode firstNameFocus = FocusNode();
  FocusNode lastNameFocus = FocusNode();
  FocusNode emailFocus = FocusNode();
  FocusNode phoneFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  FocusNode conPasswordFocus = FocusNode();
  FocusNode sellPercFocus = FocusNode();
  FocusNode buyPercFocus = FocusNode();

  RxBool hidePassword = true.obs;
  RxBool hidePasswordCon = true.obs;

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
