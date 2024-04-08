import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_app/app/widgets/common_app_bar.dart';
import 'package:stock_app/app/widgets/common_text.dart';

import '../../../../generated/assets.dart';
import '../../../theme/app_colors.dart';
import '../../../utils/validator.dart';
import '../../../widgets/common_button.dart';
import '../../../widgets/common_text_field.dart';
import '../../../widgets/image.dart';
import '../controllers/reset_password_controller.dart';

class ResetPasswordView extends GetView<ResetPasswordController> {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: "Reset Password"),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(32),
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                const CommonText(
                  "Use at least 8 characters. Use a mix of letters (uppercase and lowercase), numbers, and symbols.",
                ),
                const SizedBox(height: 16,),
                Obx(() {
                  return CommonTextField(
                    controller: controller.passwordController,
                    hintText: "Password",
                    keyboardType: TextInputType.visiblePassword,
                    focus: controller.passwordFocus.obs.value,
                    obscure: controller.hasPasswordHide.value,
                    inputAction: TextInputAction.next,
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: InkWell(
                        onTap: () {
                          controller.hasPasswordHide.value = !controller.hasPasswordHide.value;
                        },
                        child: SquareSvgImageFromAsset(
                          controller.hasPasswordHide.value ? Assets.imagesIcEyeOff : Assets.imagesIcEye,
                          size: 20,
                          color: secondaryClr,
                        ),
                      ),
                    ),
                    validator: validatePassword,
                    prefixIcon: const Padding(
                      padding: EdgeInsets.all(16),
                      child: Icon(Icons.lock, size: 20, color: secondaryClr),
                    ),
                  );
                }),
                const SizedBox(height: 16,),
                Obx(() {
                  return CommonTextField(
                    controller: controller.confirmPasswordController,
                    hintText: "Confirm Password",
                    inputAction: TextInputAction.done,
                    keyboardType: TextInputType.visiblePassword,
                    focus: controller.confirmPasswordFocus.obs.value,
                    obscure: controller.hasConfirmPasswordHide.value,
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: InkWell(
                        onTap: () {
                          controller.hasConfirmPasswordHide.value = !controller.hasConfirmPasswordHide.value;
                        },
                        child: SquareSvgImageFromAsset(
                          controller.hasConfirmPasswordHide.value ? Assets.imagesIcEyeOff : Assets.imagesIcEye,
                          size: 20,
                          color: secondaryClr,
                        ),
                      ),
                    ),
                    validator: (value) => validateConfirmPassword(value, controller.passwordController.text),
                    prefixIcon: const Padding(
                      padding: EdgeInsets.all(16),
                      child: Icon(Icons.lock, size: 20, color: secondaryClr),
                    ),
                  );
                }),
                const SizedBox(height: 16),
                CommonButton(
                  onPressed: () {},
                  label: "Reset Password",
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
