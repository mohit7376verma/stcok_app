import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_app/app/widgets/common_text_field.dart';
import 'package:stock_app/app/widgets/common_text.dart';

import '../../../gen/assets.gen.dart';
import '../../../routes/app_pages.dart';
import '../../../theme/app_colors.dart';
import '../../../utils/validator.dart';
import '../../../widgets/common_button.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: onBackgroundClr,
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.all(32),
            child: Column(
              children: [
                Form(
                  key: controller.formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                      const CommonText.bold(
                        "Stock App",
                        color: secondaryClr,
                        size: 32,
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                      CommonTextField(
                        controller: controller.emailController,
                        hintText: "Enter Email Address",
                        keyboardType: TextInputType.emailAddress,
                        focus: controller.emailFocus,
                        validator: validateEmail,
                        prefixIcon: const Padding(
                          padding: EdgeInsets.all(16),
                          child: Icon(Icons.mail_outline, size: 20, color: secondaryClr),
                        ),
                      ),
                      const SizedBox(height: 18),
                      Obx(() {
                        return CommonTextField(
                          controller: controller.passwordController,
                          hintText: "Enter password",
                          keyboardType: TextInputType.visiblePassword,
                          focus: controller.passwordFocus,
                          obscure: controller.hidePassword.value,
                          validator: validatePassword,
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: InkWell(
                                onTap: () => controller.hidePassword.value = !controller.hidePassword.value,
                                child: (controller.hidePassword.value ? Assets.imagesIcEyeOff : Assets.imagesIcEye)
                                    .svg(width: 20, height: 20, color: secondaryClr)),
                          ),
                          // validator: validatePassword,
                          prefixIcon: const Padding(
                            padding: EdgeInsets.all(16),
                            child: Icon(Icons.lock_outline, size: 20, color: secondaryClr),
                          ),
                        );
                      }),
                      const SizedBox(
                        height: 4,
                      ),
                      Align(
                          alignment: Alignment.bottomRight,
                          child: InkWell(
                            onTap: () => Get.toNamed(Routes.FORGOT_PASSWORD),
                            child: const CommonText.regular("Forgot Password?", size: 14),
                          )).marginAll(4),
                      const SizedBox(
                        height: 32,
                      ),
                      CommonButton(
                        onPressed: () {
                          Get.toNamed(Routes.HOME);
                        },
                        label: "Sign In",
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Obx(() {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Radio<bool>(
                              value: true,
                              activeColor: primaryClr,
                              groupValue: controller.isRemember.value,
                              onChanged: (value) {
                                controller.isRemember.value = value!;
                              },
                            ),
                            const CommonText.medium(
                              "Remember me",
                              size: 16,
                            )
                          ],
                        ).marginOnly(right: 16);
                      }),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CommonText.regular("New to Stock?", color: secondaryClr, size: 16),
                          const SizedBox(width: 4),
                          InkWell(
                            child: const CommonText.bold("Sign up", color: secondaryClr, size: 16),
                            onTap: () {
                              Get.toNamed(Routes.REGISTER);
                            },
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CommonText.regular("Login As", color: secondaryClr, size: 16),
                          const SizedBox(width: 4),
                          InkWell(
                            child: const CommonText.bold("Guest", color: secondaryClr, size: 16),
                            onTap: () {},
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
