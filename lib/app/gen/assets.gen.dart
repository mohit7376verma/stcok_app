/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class Assets {
  Assets._();

  /// File path: assets/images/ic_back.svg
  static const SvgGenImage imagesIcBack =
      SvgGenImage('assets/images/ic_back.svg');

  /// File path: assets/images/ic_eye.svg
  static const SvgGenImage imagesIcEye =
      SvgGenImage('assets/images/ic_eye.svg');

  /// File path: assets/images/ic_eye_off.svg
  static const SvgGenImage imagesIcEyeOff =
      SvgGenImage('assets/images/ic_eye_off.svg');

  /// File path: assets/images/ic_notification.svg
  static const SvgGenImage imagesIcNotification =
      SvgGenImage('assets/images/ic_notification.svg');

  /// File path: assets/images/ic_search.svg
  static const SvgGenImage imagesIcSearch =
      SvgGenImage('assets/images/ic_search.svg');

  /// List of all assets
  static List<SvgGenImage> get values => [
        imagesIcBack,
        imagesIcEye,
        imagesIcEyeOff,
        imagesIcNotification,
        imagesIcSearch
      ];
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter,
      color: color,
      colorBlendMode: colorBlendMode,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
