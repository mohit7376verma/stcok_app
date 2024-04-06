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

  /// File path: assets/images/avatar.png
  static const AssetGenImage imagesAvatar =
      AssetGenImage('assets/images/avatar.png');

  /// File path: assets/images/ic_back.svg
  static const SvgGenImage imagesIcBack =
      SvgGenImage('assets/images/ic_back.svg');

  /// File path: assets/images/ic_call.svg
  static const SvgGenImage imagesIcCall =
      SvgGenImage('assets/images/ic_call.svg');

  /// File path: assets/images/ic_emogi.svg
  static const SvgGenImage imagesIcEmogi =
      SvgGenImage('assets/images/ic_emogi.svg');

  /// File path: assets/images/ic_eye.svg
  static const SvgGenImage imagesIcEye =
      SvgGenImage('assets/images/ic_eye.svg');

  /// File path: assets/images/ic_eye_off.svg
  static const SvgGenImage imagesIcEyeOff =
      SvgGenImage('assets/images/ic_eye_off.svg');

  /// File path: assets/images/ic_forward.svg
  static const SvgGenImage imagesIcForward =
      SvgGenImage('assets/images/ic_forward.svg');

  /// File path: assets/images/ic_notification.svg
  static const SvgGenImage imagesIcNotification =
      SvgGenImage('assets/images/ic_notification.svg');

  /// File path: assets/images/ic_pencil.svg
  static const SvgGenImage imagesIcPencil =
      SvgGenImage('assets/images/ic_pencil.svg');

  /// File path: assets/images/ic_search.svg
  static const SvgGenImage imagesIcSearch =
      SvgGenImage('assets/images/ic_search.svg');

  /// File path: assets/images/ic_trash.svg
  static const SvgGenImage imagesIcTrash =
      SvgGenImage('assets/images/ic_trash.svg');

  /// List of all assets
  static List<dynamic> get values => [
        imagesAvatar,
        imagesIcBack,
        imagesIcCall,
        imagesIcEmogi,
        imagesIcEye,
        imagesIcEyeOff,
        imagesIcForward,
        imagesIcNotification,
        imagesIcPencil,
        imagesIcSearch,
        imagesIcTrash
      ];
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
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
