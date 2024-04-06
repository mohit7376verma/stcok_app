import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theme/app_colors.dart';
import '../utils/constants.dart';
import 'common_text.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final TextInputType keyboardType;
  final bool obscure;
  final TextInputAction inputAction;
  final FormFieldValidator<String>? validator;
  final GlobalKey<FormFieldState>? _fieldKey;
  final ValueChanged<String>? fieldSubmitted;
  final FocusNode? focus;
  final ValueChanged<String>? onChanged;
  final Widget? prefix;
  final Widget? suffix;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int maxLines;
  final int minLines;
  final List<TextInputFormatter> inputFormatters;
  final bool isReadOnly;
  final TextAlign textAlign;
  final VoidCallback? onTap;
  final BoxConstraints iconConstraints;
  final String obscuringCharacter;
  final Iterable<String>? autofillHints;
  final bool isCanSee;
  final Widget Function(BuildContext,
      {required int currentLength,
      required bool isFocused,
      required int? maxLength})? buildCounter;
  final TextCapitalization? textCapitalization;

  final Color? borderColor;

  final Color? bgColor;

  final Color? textColor;
  final Color? cursorColor;

  const CommonTextField({
    required this.controller,
    this.labelText = "",
    GlobalKey<FormFieldState>? globalKey,
    this.keyboardType = TextInputType.text,
    this.obscure = false,
    this.inputAction = TextInputAction.next,
    this.validator,
    this.fieldSubmitted,
    this.focus,
    this.onChanged,
    this.prefix,
    this.suffix,
    this.prefixIcon,
    this.suffixIcon,
    this.inputFormatters = const [],
    this.maxLines = 1,
    this.minLines = 1,
    this.isReadOnly = false,
    this.hintText = "",
    this.textAlign = TextAlign.start,
    this.onTap,
    this.iconConstraints = const BoxConstraints(maxWidth: 160),
    super.key,
    this.obscuringCharacter = '•',
    this.autofillHints,
    this.isCanSee = false,
    this.buildCounter,
    this.textCapitalization,
    this.borderColor = primaryClr,
    this.bgColor = surfaceClr,
    this.textColor = shadowClr,
    this.cursorColor = secondaryClr
  }) : _fieldKey = globalKey;

  @override
  Widget build(BuildContext context) {
    var borderStyle = OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: borderColor!.withOpacity(0.2), width: 0));
    var focusedBorderStyle = OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: borderColor!.withOpacity(1), width: 0));

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText.isNotEmpty) ...[
          CommonText.bold(labelText, size: 14, color: onBackgroundClr),
          const SizedBox(height: 12),
        ],
        TextFormField(
          onTap: onTap,
          key: _fieldKey,
          validator: validator,
          obscuringCharacter: obscuringCharacter,
          textInputAction: inputAction,
          onFieldSubmitted: fieldSubmitted,
          controller: controller,
          focusNode: focus,
          obscureText: obscure,
          onChanged: onChanged,
          keyboardType: keyboardType,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          textCapitalization: textCapitalization ?? TextCapitalization.none,
          buildCounter: buildCounter,
          style:  TextStyle(
              color: textColor,
              fontWeight: FontWeight.w500,
              fontSize: 16,
              fontFamily: kFontFamily),
          textAlign: textAlign,
          maxLines: maxLines,
          minLines: minLines,
          readOnly: isReadOnly,
          cursorColor: cursorColor,
          inputFormatters: inputFormatters,
          autofillHints: autofillHints,
          decoration:
          InputDecoration(
            contentPadding: const EdgeInsets.all(0),
            hintText: hintText,
            hintStyle: const TextStyle(
                color: surfaceVariantClr,
                fontWeight: FontWeight.w500,
                fontSize: 12,
                fontFamily: kFontFamily),
            prefix: prefix,
            suffix: suffix,
            errorMaxLines: 4,
            border: borderStyle,
            errorBorder: borderStyle,
            focusedBorder: focusedBorderStyle,
            focusedErrorBorder: focusedBorderStyle,
            enabledBorder: borderStyle,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            fillColor: bgColor,
            filled: true,
            prefixIconConstraints: iconConstraints,
            suffixIconConstraints: iconConstraints,
          ),
        ),
      ],
    );
  }
}