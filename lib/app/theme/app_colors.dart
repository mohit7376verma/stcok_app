import 'dart:ui';

import 'package:flutter/material.dart';

const primaryClr = Color(0xFF2A2A2A);
const onPrimaryClr = Color(0xFFF6F6F6);
const secondaryClr = Color(0xFFF6F6F6);
const tertiaryClr = Color(0xFFA1C638);
const neutralClr = Color(0xFF888888);
const onBackgroundClr = Color(0xFF1E1E1E);
const errorClr = Color(0xF7D80606);
const successClr = Color(0xFF106802);
const warningClr = Color(0xFFC1B207);

const surfaceClr = Color(0xFF171616);
const surfaceVariantClr = Color(0xFFBCB9B9);
const shadowClr = Color(0xFF000000);
const outlineClr = Color(0xFF757780);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: primaryClr,
  onPrimary: secondaryClr,
  primaryContainer: primaryClr,
  onPrimaryContainer:secondaryClr,
  secondary: secondaryClr,
  onSecondary: neutralClr,
  secondaryContainer: secondaryClr,
  onSecondaryContainer: tertiaryClr,
  tertiary: tertiaryClr,
  onTertiary: secondaryClr,
  tertiaryContainer: primaryClr,
  onTertiaryContainer: tertiaryClr,
  error: errorClr,
  errorContainer: secondaryClr,
  onError: errorClr,
  onErrorContainer: secondaryClr,
  background: primaryClr,
  onBackground: secondaryClr,
  surface: primaryClr,
  onSurface: secondaryClr,
  surfaceVariant: primaryClr,
  onSurfaceVariant: neutralClr,
  outline: neutralClr,
  shadow: Color(0xCF414141),
  outlineVariant: neutralClr,
  scrim: primaryClr,
);



