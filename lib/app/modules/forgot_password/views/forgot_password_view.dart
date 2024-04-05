import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_app/app/theme/app_colors.dart';
import 'package:stock_app/app/widgets/common_app_bar.dart';
import 'package:stock_app/app/widgets/common_button.dart';

import '../../../utils/validator.dart';
import '../../../widgets/common_text_field.dart';
import '../../../widgets/common_text.dart';
import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: onBackgroundClr,
      appBar: const CommonAppBar(title: "Forgot Password"),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              /*const CommonText.bold(
                "Stock",
                color: secondaryClr,
                size: 32,
              ),*/
              // SizedBox(height: MediaQuery.of(context).size.height * 0.05),

              Obx(() => Visibility(
                    replacement: codeView(context),
                    visible: controller.forgotOtpStatus.value,
                    child: emailView(context),
                  )),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Wrap(
        alignment: WrapAlignment.center,
        children: [
          CommonText.bold(
            "Back to Login",
            color: primaryClr,
            size: 16,
            onTap: () {
              Get.back();
            },
          ).marginAll(16)
        ],
      ),
    );
  }

  Widget emailView(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const CommonText.bold(
        "Email",
        size: 14,
      ),
      const CommonText(
        "Enter the email associated with your account",
        color: secondaryClr,
        size: 14,
      ).paddingOnly(bottom: 24),
      Form(
        key: controller.forgotFormKey,
        child: CommonTextField(
          controller: controller.fEmailController,
          hintText: "Enter Email Address",
          keyboardType: TextInputType.emailAddress,
          focus: controller.fEmailFocus,
          validator: validateEmail,
          prefixIcon: const Padding(
            padding: EdgeInsets.all(16),
            child: Icon(Icons.mail_outline, size: 20, color: secondaryClr),
          ),
        ),
      ),
      const SizedBox(height: 16),
      CommonButton(onPressed: () => {controller.forgotOtpStatus.value = false}, label: "Submit"),
    ]).paddingOnly(left: 16, right: 16, bottom: 16);
  }

  Widget codeView(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const CommonText.bold(
        "Verification code sent !",
        size: 14,
      ),
      const CommonText(
        "Enter the code sent to your mail",
        color: secondaryClr,
        size: 14,
      ).paddingOnly(bottom: 24),
      CommonTextField(
        controller: controller.fCodeController,
        hintText: "Enter code",
        keyboardType: TextInputType.text,
        focus: controller.fCodeFocus,
        prefixIcon: const Padding(
          padding: EdgeInsets.all(16),
          child: Icon(Icons.numbers, size: 20, color: secondaryClr),
        ),
      ),
      const SizedBox(height: 16),
      Row(
        children: [
          Expanded(
            child: CommonButton.outline(onPressed: () => controller.forgotOtpStatus.value = true, label: "Previous Step").paddingOnly(right: 8),
          ),
          Expanded(child: CommonButton(onPressed: () => {}, label: "Submit").paddingOnly(left: 8)),
        ],
      ),
    ]).paddingOnly(left: 16, right: 16, bottom: 16);
  }
}
