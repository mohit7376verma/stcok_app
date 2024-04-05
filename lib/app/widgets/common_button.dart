import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import 'common_text.dart';

class CommonButton extends StatelessWidget {
  final String? label;
  final EdgeInsetsGeometry? mPadding;
  final VoidCallback? onPressed;
  final double textSize;
  final Color labelColor;
  final Widget? child;
  final Color? bgColor;
  final bool isOutlineButton;

  static const pad = EdgeInsets.all(16);

  const CommonButton({
    required this.onPressed,
    this.label,
    this.child,
    this.mPadding = pad,
    this.textSize = 12.0,
    this.labelColor = onPrimaryClr,
    this.bgColor = primaryClr,
    this.isOutlineButton = false,
    Key? key,
  })  : assert(child == null || label == null, "cannot assign both at once."),
        super(key: key);

  const CommonButton.transparent({
    required this.onPressed,
    this.label,
    this.child,
    this.mPadding = pad,
    this.textSize = 14.0,
    this.labelColor = primaryClr,
    this.bgColor = Colors.transparent,
    this.isOutlineButton = false,
    super.key,
  }) : assert(child == null || label == null, "cannot assign both at once.");

  const CommonButton.outline({
    required this.onPressed,
    this.label,
    this.child,
    this.mPadding = pad,
    this.textSize = 14.0,
    this.labelColor = primaryClr,
    this.bgColor = Colors.transparent,
    this.isOutlineButton = true,
    super.key,
  }) : assert(child == null || label == null, "cannot assign both at once.");

  @override
  Widget build(BuildContext context) {
    var mStyle = ButtonStyle(
        padding: MaterialStateProperty.all(mPadding ?? pad),
        backgroundColor: MaterialStateProperty.all(bgColor ?? secondaryClr),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))));

    return isOutlineButton
        ? OutlinedButton(
            onPressed: onPressed,
            style: OutlinedButton.styleFrom(
              foregroundColor: primaryClr,
              backgroundColor: Colors.transparent,
              side: BorderSide(color: labelColor, width: 2),
              padding: mPadding ?? pad,
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
            ),
            child: Center(
              child: CommonText.bold(label!, size: textSize, color: labelColor, textAlign: TextAlign.center),
            ),
          )
        : ElevatedButton(
            onPressed: onPressed,
            clipBehavior: Clip.hardEdge,
            style: mStyle,
            child: Center(
              child: child ?? CommonText.extraBold(label!.toUpperCase(), size: textSize, color: labelColor, textAlign: TextAlign.center),
            ),
          );
  }
}
