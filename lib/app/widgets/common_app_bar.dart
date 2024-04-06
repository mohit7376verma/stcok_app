import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../gen/assets.gen.dart';
import '../theme/app_colors.dart';
import 'common_text.dart';
import 'image.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBackTap;
  final PreferredSizeWidget? bottom;
  final bool hasBackIcon;
  final bool titleCentered;
  final List<Widget>? actions;
  final String? leadingIcon;
  final Color? bgColor;
  final double size;

  const CommonAppBar({
    required this.title,
    this.onBackTap,
    this.bottom,
    this.hasBackIcon = true,
    this.titleCentered = true,
    this.actions,
    this.leadingIcon,
    this.bgColor = primaryClr,
    this.size = 18,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: primaryClr
      ),
      backgroundColor: bgColor,
      automaticallyImplyLeading: hasBackIcon,
      leading: hasBackIcon
          ? IconButton(
              splashRadius: 24,
              onPressed: onBackTap ?? () => Get.back(),
              icon: SquareSvgImageFromAsset(leadingIcon ?? Assets.imagesIcBack.path, color: secondaryClr),
            )
          : null,
      title: CommonText.bold(title, size: size ?? 18, color: secondaryClr, textAlign: TextAlign.start),
      centerTitle: titleCentered,
      actions: actions,
     scrolledUnderElevation: 0.0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56 + (bottom?.preferredSize.height ?? 0));
}
