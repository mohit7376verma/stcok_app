import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_app/app/widgets/common_text.dart';

import '../../../gen/assets.gen.dart';
import '../../../theme/app_colors.dart';
import '../../../utils/validator.dart';
import '../../../widgets/common_text_field.dart';
import '../../../widgets/common_button.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: onBackgroundClr,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CommonText.bold(
                  "Welcome to Stock",
                  size: 18,
                ),
                const SizedBox(
                  height: 8,
                ),
                const CommonText.regular("Enter your information below to sign up!", size: 14),
                const SizedBox(
                  height: 32,
                ),
                Form(
                    key: controller.formKey,
                    child: Column(
                      children: [
                        CommonTextField(
                          controller: controller.ctrFullName,
                          hintText: "Full Name",
                          keyboardType: TextInputType.text,
                          focus: controller.fullNameFocus,
                          validator: (value) => nameValidateFiled(value, "Please enter your first name!"),
                          prefixIcon: const Padding(
                            padding: EdgeInsets.all(16),
                            child: Icon(Icons.person_outline, size: 20, color: secondaryClr),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        CommonTextField(
                          controller: controller.ctrLastName,
                          hintText: "Last Name",
                          keyboardType: TextInputType.text,
                          focus: controller.lastNameFocus,
                          validator: (value) => nameValidateFiled(value, "Please enter your last name!"),
                          prefixIcon: const Padding(
                            padding: EdgeInsets.all(16),
                            child: Icon(Icons.person_outline, size: 20, color: secondaryClr),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        CommonTextField(
                          controller: controller.ctrlEmail,
                          hintText: "Email Address",
                          keyboardType: TextInputType.emailAddress,
                          focus: controller.emailFocus,
                          validator: validateEmail,
                          prefixIcon: const Padding(
                            padding: EdgeInsets.all(16),
                            child: Icon(Icons.mail_outline, size: 20, color: secondaryClr),
                          ),
                        ),
                        const SizedBox(height: 16),
                        CommonTextField(
                          controller: controller.ctrPhone,
                          hintText: "Phone",
                          keyboardType: TextInputType.number,
                          focus: controller.phoneFocus,
                          // validator: validateEmail,
                          prefixIcon: const Padding(
                            padding: EdgeInsets.all(16),
                            child: Icon(Icons.phone, size: 20, color: secondaryClr),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Obx(() {
                          return CommonTextField(
                            controller: controller.ctrlPassword,
                            hintText: "Password",
                            keyboardType: TextInputType.visiblePassword,
                            focus: controller.passwordFocus,
                            obscure: controller.hidePassword.value,
                            suffixIcon: Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: InkWell(
                                  onTap: () => controller.hidePassword.value = !controller.hidePassword.value,
                                  child: (controller.hidePassword.value ? Assets.imagesIcEyeOff : Assets.imagesIcEye)
                                      .svg(width: 20, height: 20, color: secondaryClr)),
                            ),
                            validator: validatePassword,
                            prefixIcon: const Padding(
                              padding: EdgeInsets.all(16),
                              child: Icon(Icons.lock_outline, size: 20, color: secondaryClr),
                            ),
                          );
                        }),
                        const SizedBox(height: 16),
                        Obx(() {
                          return CommonTextField(
                            controller: controller.ctrlConPassword,
                            hintText: "Confirm password",
                            keyboardType: TextInputType.visiblePassword,
                            focus: controller.conPasswordFocus,
                            obscure: controller.hidePasswordCon.value,
                            validator: (value) => validateConfirmPassword(value, controller.ctrlPassword.text),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: InkWell(
                                onTap: () => controller.hidePasswordCon.value = !controller.hidePasswordCon.value,
                                child: (controller.hidePassword.value ? Assets.imagesIcEyeOff : Assets.imagesIcEye)
                                    .svg(width: 20, height: 20, color: secondaryClr),
                              ),
                            ),
                            prefixIcon: const Padding(
                              padding: EdgeInsets.all(16),
                              child: Icon(Icons.lock_outline, size: 20, color: secondaryClr),
                            ),
                          );
                        }),
                        const SizedBox(
                          height: 16,
                        ),
                        CommonTextField(
                          controller: controller.ctrlSellPercentage,
                          hintText: "Sell Percentage",
                          keyboardType: TextInputType.number,
                          focus: controller.sellPercFocus,
                          prefixIcon: const Padding(
                            padding: EdgeInsets.all(16),
                            child: Icon(Icons.sell, size: 20, color: secondaryClr),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        CommonTextField(
                          controller: controller.ctrlBuyPercentage,
                          hintText: "But Percentage",
                          keyboardType: TextInputType.number,
                          focus: controller.buyPercFocus,
                          prefixIcon: const Padding(
                            padding: EdgeInsets.all(16),
                            child: Icon(Icons.sell, size: 20, color: secondaryClr),
                          ),
                        ),
                        const SizedBox(height: 32),
                        CommonButton(onPressed: () {}, label: "Sign up"),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const CommonText.regular("Already have a Account?", color: secondaryClr, size: 16),
                            const SizedBox(width: 4),
                            InkWell(
                              child: const CommonText.bold("Login", color: secondaryClr, size: 16),
                              onTap: () {
                                Get.back();
                              },
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
