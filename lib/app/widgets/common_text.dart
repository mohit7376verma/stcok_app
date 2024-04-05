import 'package:flutter/cupertino.dart';

import '../theme/app_colors.dart';
import '../utils/constants.dart';

class CommonText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final bool isItalic;
  final double? height;
  final double? letterSpacing;
  final FontWeight fontWeight;
  final VoidCallback? onTap;
  final String fontFamily;
  final bool isUnderLine;

  const CommonText(
      this.text, {
        this.size = 12,
        this.color = secondaryClr,
        this.textAlign,
        this.overflow,
        this.maxLines,
        this.isItalic = false,
        this.height,
        this.letterSpacing,
        this.fontWeight = FontWeight.normal,
        this.onTap,
        this.fontFamily = kFontFamily,
        this.isUnderLine = false,
        Key? key,
      }) : super(key: key);

  const CommonText.extraBold(
      this.text, {
        this.size = 12,
        this.color = primaryClr,
        this.textAlign,
        this.overflow,
        this.maxLines,
        this.isItalic = false,
        this.height,
        this.letterSpacing,
        this.onTap,
        this.fontFamily = kFontFamily,
        this.isUnderLine = false,
        Key? key,
      })  : fontWeight = FontWeight.w900,
        super(key: key);

  const CommonText.bold(
      this.text, {
        this.size = 12,
        this.color = secondaryClr,
        this.textAlign,
        this.overflow,
        this.maxLines,
        this.isItalic = false,
        this.height,
        this.letterSpacing,
        this.onTap,
        this.fontFamily = kFontFamily,
        this.isUnderLine = false,
        Key? key,
      })  : fontWeight = FontWeight.w700,
        super(key: key);

  const CommonText.semiBold(
      this.text, {
        this.size = 12,
        this.color = secondaryClr,
        this.textAlign,
        this.overflow,
        this.maxLines,
        this.isItalic = false,
        this.height,
        this.letterSpacing,
        this.onTap,
        this.fontFamily = kFontFamily,
        this.isUnderLine = false,
        Key? key,
      })  : fontWeight = FontWeight.w600,
        super(key: key);

  const CommonText.medium(
      this.text, {
        this.size = 12,
        this.color = shadowClr,
        this.textAlign,
        this.overflow,
        this.maxLines,
        this.isItalic = false,
        this.height,
        this.letterSpacing,
        this.onTap,
        this.fontFamily = kFontFamily,
        this.isUnderLine = false,
        Key? key,
      })  : fontWeight = FontWeight.w500,
        super(key: key);

  const CommonText.regular(
      this.text, {
        this.size = 12,
        this.color = secondaryClr,
        this.textAlign,
        this.overflow,
        this.maxLines,
        this.isItalic = false,
        this.height = 1.5,
        this.letterSpacing,
        this.onTap,
        this.fontFamily = kFontFamily,
        this.isUnderLine = false,
        Key? key,
      })  : fontWeight = FontWeight.w400,
        super(key: key);

  const CommonText.light(
      this.text, {
        this.size = 12,
        this.color = secondaryClr,
        this.textAlign,
        this.overflow,
        this.maxLines,
        this.isItalic = false,
        this.height = 1.5,
        this.letterSpacing,
        this.onTap,
        this.fontFamily = kFontFamily,
        this.isUnderLine = false,
        Key? key,
      })  : fontWeight = FontWeight.w300,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        textAlign: textAlign,
        overflow: overflow,
        maxLines: maxLines,
        style: TextStyle(
            fontFamily: fontFamily,
            color: color,
            fontSize: size,
            fontStyle: isItalic ? FontStyle.italic : null,
            fontWeight: fontWeight,
            height: height,
            letterSpacing: letterSpacing,
            decoration: isUnderLine ? TextDecoration.underline : null,
            decorationThickness: 1,
            decorationColor: secondaryClr),
      ),
    );
    // return onTap != null ? GestureDetector(onTap: onTap, child: child) : child;
  }
}