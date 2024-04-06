import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_app/app/utils/constants.dart';
import 'package:stock_app/app/widgets/common_app_bar.dart';

import '../../../theme/app_colors.dart';
import '../../../widgets/common_text.dart';
import '../controllers/about_us_controller.dart';

class AboutUsView extends GetView<AboutUsController> {
  const AboutUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: "",
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CommonText.bold(
                "About Us",
                color: secondaryClr,
                size: 24,
              ),
              const SizedBox(height: 16,),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: carDecoration,
                child: const CommonText.medium(dummyText),
              )
            ],
          ),
        ),
      ),
    );
  }
}
