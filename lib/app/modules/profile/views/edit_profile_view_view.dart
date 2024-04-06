import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:stock_app/app/modules/profile/controllers/profile_controller.dart';

import '../../../theme/app_colors.dart';
import '../../../utils/validator.dart';
import '../../../widgets/common_app_bar.dart';
import '../../../widgets/common_button.dart';
import '../../../widgets/common_text_field.dart';
import '../../../widgets/widgets.dart';

class EditProfileViewView extends GetView<ProfileController> {
  const EditProfileViewView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: "Edit Profile"),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Center(
                child: Stack(
                  children: [
                    Obx(() {
                      return Container(
                        height: 120.0,
                        width: 120.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: secondaryClr,
                          border: Border.all(color: tertiaryClr, width: 4.0, strokeAlign: BorderSide.strokeAlignOutside),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: controller.pickedImage.value.value == null
                                ? NetworkImage(controller.userProfileImg.value)
                                : FileImage(controller.pickedImage.value.value!) as ImageProvider,
                          ),
                        ),
                      );
                    }),
                    Positioned(
                      bottom: 4,
                      right: 2,
                      child: SizedBox(
                        width: 32,
                        height: 32,
                        child: FloatingActionButton.small(
                          backgroundColor: secondaryClr,
                          elevation: 0,
                          heroTag: null,
                          focusElevation: 0.0,
                          highlightElevation: 0.0,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                          child: const Icon(
                            Icons.edit,
                            color: primaryClr,
                            size: 20,
                          ),
                          onPressed: () async {
                            controller.checkPermissions().then((value) => {
                                  if (value)
                                    {
                                      showPicker(
                                        galleryPicker: () {
                                          Get.back();
                                          controller.getImageFromGallery();
                                        },
                                        cameraPicker: () {
                                          Get.back();
                                          controller.getImageFromCamera();
                                        },
                                      )
                                    }
                                  else
                                    {openAppSettings()}
                                });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Transform.translate(
                offset: const Offset(0, 40),
                child: Form(
                    key: controller.formKey,
                    child: Column(
                      children: [
                        CommonTextField(
                          controller: controller.ctrFirstName,
                          hintText: "First Name",
                          keyboardType: TextInputType.text,
                          focus: controller.firstNameFocus,
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
                          isReadOnly: true,
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
                        CommonButton(onPressed: () {}, label: "Update"),
                        const SizedBox(
                          height: 16,
                        ),
                      ],
                    )),
              ).paddingOnly(bottom: 16)
            ],
          ),
        ),
      ),
    );
  }
}
