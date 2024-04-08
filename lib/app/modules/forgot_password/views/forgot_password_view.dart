import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_app/app/routes/app_pages.dart';
import 'package:stock_app/app/theme/app_colors.dart';
import 'package:stock_app/app/widgets/common_app_bar.dart';
import 'package:stock_app/app/widgets/common_button.dart';

import '../../../utils/validator.dart';
import '../../../widgets/common_text.dart';
import '../../../widgets/common_text_field.dart';
import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryClr,
      appBar: const CommonAppBar(title: "Forgot Password"),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(32),
          child: Column(
            children: [
              // SizedBox(height: MediaQuery.of(context).size.height * 0.05),
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
            color: secondaryClr,
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
    ]);
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
            child: OutlinedButton(
              onPressed: () => controller.forgotOtpStatus.value = true,
              style: OutlinedButton.styleFrom(
                foregroundColor: primaryClr,
                backgroundColor: Colors.transparent,
                side: const BorderSide(color: tertiaryClr, width: 2),
                minimumSize: const Size(double.infinity, 50),
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
              ),
              child: const Center(
                child: CommonText.bold("Previous Step", size: 14, color: tertiaryClr, textAlign: TextAlign.center),
              ),
            ).paddingOnly(right: 8),
          ),
          Expanded(child: CommonButton(onPressed: () => {Get.toNamed(Routes.RESET_PASSWORD)}, label: "Submit").paddingOnly(left: 8)),
        ],
      ),
    ]);
  }
}
