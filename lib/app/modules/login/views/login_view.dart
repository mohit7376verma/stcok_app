import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:stock_app/app/widgets/common_text.dart';
import 'package:stock_app/app/widgets/common_text_field.dart';
import 'package:stock_app/app/widgets/image.dart';

import '../../../gen/assets.gen.dart';
import '../../../routes/app_pages.dart';
import '../../../theme/app_colors.dart';
import '../../../utils/validator.dart';
import '../../../widgets/common_button.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryClr,
        body: SingleChildScrollView(
          child: InkWell(
            overlayColor: const MaterialStatePropertyAll(Colors.transparent),
            splashFactory: NoSplash.splashFactory,
            highlightColor: Colors.transparent,
            onTap: () {
              FocusScope.of(context).unfocus();
              controller.emailFocus.unfocus();
              controller.passwordFocus.unfocus();
            },
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
                        TypeAheadField(
                            itemBuilder: (context, itemData) => Container(
                                  padding: const EdgeInsets.all(12),
                                  color: cardClr,
                                  child: CommonText.semiBold(itemData.toString(), size: 14),
                                ),
                            onSelected: (suggestion) {
                              FocusScope.of(context).unfocus();
                              controller.emailController.text = suggestion ?? "";
                              controller.passwordController.text = controller.findPassword(suggestion);
                            },
                            suggestionsCallback: (pattern) {
                              if (pattern.isNotEmpty) {
                                return controller.emailList.where((e) => e.contains(pattern)).toList();
                              } else {
                                return [];
                              }
                            },
                            transitionBuilder: (context, animation, child) {
                              return FadeTransition(
                                opacity: CurvedAnimation(parent: animation, curve: Curves.fastOutSlowIn),
                                child: child,
                              );
                            },
                            direction: VerticalDirection.up,
                            hideOnEmpty: true,
                            decorationBuilder: (context, child) => Material(
                                  borderRadius: BorderRadius.circular(8),
                                  shadowColor: Colors.transparent,
                                  clipBehavior: Clip.hardEdge,
                                  color: Colors.transparent,
                                  type: MaterialType.card,
                                  elevation: 16,
                                  child: child,
                                ),
                            controller: controller.emailController,
                            focusNode: controller.emailFocus,
                            builder: (context, controller, focusNode) => CommonTextField(
                                  controller: controller,
                                  hintText: "Please Enter Email Address",
                                  keyboardType: TextInputType.emailAddress,
                                  focus: focusNode,
                                  validator: validateEmail,
                                  prefixIcon: const Padding(
                                    padding: EdgeInsets.all(16),
                                    child: Icon(Icons.mail_outline, size: 20, color: secondaryClr),
                                  ),
                                )),
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
                                child: SquareSvgImageFromAsset(
                                  controller.hidePassword.value ? Assets.imagesIcEyeOff.path : Assets.imagesIcEye.path,
                                  size: 20,
                                  color: secondaryClr,
                                ),
                              ),
                            ),
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
                              child: CommonText.regular(
                                "Forgot Password?",
                                size: 14,
                                onTap: () => Get.toNamed(Routes.FORGOT_PASSWORD),
                              ).marginOnly(top: 8),
                            )).marginAll(4),
                        const SizedBox(
                          height: 32,
                        ),
                        CommonButton(
                          onPressed: () => controller.signIn(context),
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
                                activeColor: tertiaryClr,
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
                              child: CommonText.bold("Sign up", color: secondaryClr, size: 16, onTap: () {
                                Get.toNamed(Routes.REGISTER);
                              }),
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
                              child: CommonText.bold("Guest", color: secondaryClr, size: 16, onTap: () {}),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
