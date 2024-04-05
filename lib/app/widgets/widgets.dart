import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/app_colors.dart';
import 'common_text.dart';

Widget pageLoader(BuildContext context) {
  return Center(
    child: Container(
      padding: const EdgeInsets.all(4),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: 12, height: 12, child: CircularProgressIndicator.adaptive(strokeWidth: 1.5)),
          SizedBox(width: 16),
          CommonText("Loading...", color: onBackgroundClr)
        ],
      ),
    ).paddingOnly(bottom: MediaQuery.of(context).padding.bottom, top: 4),
  );
}