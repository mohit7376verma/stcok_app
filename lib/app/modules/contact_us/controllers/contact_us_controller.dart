import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../utils/pref.dart';

class ContactUsController extends GetxController {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late TextEditingController nameController = TextEditingController(text: Prefs().userName());
  late TextEditingController phoneController = TextEditingController(text: Prefs().getData(Prefs.phone));
  late TextEditingController emailController = TextEditingController(text: Prefs().userEmail());
  late TextEditingController messageController = TextEditingController();

  late final FocusNode nameFocus = FocusNode();
  late final FocusNode phoneFocus = FocusNode();
  late final FocusNode emailFocus = FocusNode();
  late final FocusNode messageFocus = FocusNode();

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

  onSendTap() {}

}
