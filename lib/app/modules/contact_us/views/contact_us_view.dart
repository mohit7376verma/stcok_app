import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:stock_app/app/widgets/common_app_bar.dart';
import 'package:stock_app/app/widgets/common_text.dart';

import '../../../../generated/assets.dart';
import '../../../theme/app_colors.dart';
import '../../../utils/validator.dart';
import '../../../widgets/common_button.dart';
import '../../../widgets/common_text_field.dart';
import '../../../widgets/image.dart';
import '../controllers/contact_us_controller.dart';

class ContactUsView extends GetView<ContactUsController> {
  const ContactUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: "Contact Us"),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child:  Column(
            children: [
              const CommonText.bold("DO YOU HAVE ANY QUESTION OR COMMENTS?", size: 18),
              const SizedBox(height: 16),
              Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    CommonTextField(
                      controller: controller.nameController,
                      hintText: "Enter Your Full Name",
                      keyboardType: TextInputType.name,
                      focus: controller.nameFocus,
                      textCapitalization: TextCapitalization.sentences,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(20),
                        FilteringTextInputFormatter.allow(RegExp("[a-z A-Z]")),
                      ],
                      validator: (value) => nameValidateFiled(value, "Please enter your name!"),
                      prefixIcon: const Padding(
                        padding: EdgeInsets.all(16),
                        child: SquareSvgImageFromAsset(
                          Assets.imagesIcPerson,
                          size: 20,
                          color: secondaryClr,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    CommonTextField(
                      controller: controller.emailController,
                      hintText: "Enter Email Address",
                      keyboardType: TextInputType.emailAddress,
                      focus: controller.emailFocus,
                      validator: validateEmail,
                      prefixIcon: const Padding(
                        padding: EdgeInsets.all(16),
                        child: SquareSvgImageFromAsset(
                          Assets.imagesIcMail,
                          size: 20,
                          color:secondaryClr,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    CommonTextField(
                      controller: controller.phoneController,
                      hintText: "Enter your phone number",
                      keyboardType: TextInputType.none,
                      validator: validateMobileNumber,
                      isReadOnly: true,
                      prefixIcon: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(16),
                            child: SquareSvgImageFromAsset(
                              Assets.imagesIcCall,
                              size: 20,
                              color: secondaryClr,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    CommonTextField(
                      controller: controller.messageController,
                      hintText: "Type message here...",
                      focus: controller.messageFocus,
                      validator: (value) => validateFiled(value, "Please enter message!"),
                      minLines: 8,
                      maxLines: 8,
                      prefix: const SizedBox(height: 24, width: 16),
                    ),
                    const SizedBox(height: 24),
                    CommonButton(onPressed: () => controller.onSendTap(), label: "Send")
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
