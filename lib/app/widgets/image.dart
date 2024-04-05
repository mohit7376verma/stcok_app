import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stock_app/app/utils/extensions/extension.dart';

import '../theme/app_colors.dart';
import '../utils/pref.dart';

class SquareImageFromAsset extends StatelessWidget {
  final String image;
  final double size;
  final BoxFit fit;
  final Color? color;
  final bool matchTextDirection;

  const SquareImageFromAsset(
    this.image, {
    this.size = 24,
    this.fit = BoxFit.contain,
    this.color,
    this.matchTextDirection = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      fit: fit,
      color: color,
      width: size,
      height: size,
      matchTextDirection: matchTextDirection,
    );
  }
}

class CircleSvgImageFromAsset extends StatelessWidget {
  final String image;
  final double size;
  final BoxFit fit;
  final Color? color;
  final bool matchTextDirection;

  const CircleSvgImageFromAsset(
    this.image, {
    this.size = 24,
    this.fit = BoxFit.none,

    this.color,
    this.matchTextDirection = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ClipOval(
        // child: SvgPicture.asset(
        //   image,
        //   fit: fit,
        //   color: color,
        //   width: size,
        //   height: size,
        //   matchTextDirection: matchTextDirection,
        // ),
        );
  }
}

class SquareSvgImageFromAsset extends StatelessWidget {
  final String image;
  final double size;
  final BoxFit fit;
  final Color? color;
  final bool matchTextDirection;

  const SquareSvgImageFromAsset(this.image,
      {this.size = 24, this.fit = BoxFit.contain, this.color, this.matchTextDirection = true, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(image, fit: fit, color: color, width: size, height: size, matchTextDirection: matchTextDirection);
  }
}

class SquareImageFromNetwork extends StatelessWidget {
  final String imageUrl;
  final String? placeholder;
  final Widget? placeholderWidget;
  final double size;
  final BoxFit fit;
  final Color? color;
  final bool matchTextDirection;

  const SquareImageFromNetwork({
    required this.imageUrl,
    this.placeholder,
    this.placeholderWidget,
    this.size = 24,
    this.fit = BoxFit.contain,
    this.color,
    this.matchTextDirection = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (imageUrl.isEmpty) {
      return placeholderWidget ?? (placeholder!.isNullOrEmpty ? const SizedBox.shrink() : Image.asset(placeholder!, fit: fit));
    }

    return const SizedBox.shrink();
    // return CachedNetworkImage(
    //   width: size,
    //   height: size,
    //   imageUrl: imageUrl,
    //   httpHeaders: {'Authorization': 'Bearer ${AppPref.userToken}'},
    //   placeholder: (context, url) =>
    //       placeholderWidget ??
    //       (placeholder.isNullOrEmpty ? const SizedBox.shrink() : Image.asset(placeholder!, fit: fit)),
    //   errorWidget: (context, url, error) =>
    //       placeholderWidget ??
    //       (placeholder.isNullOrEmpty ? const SizedBox.shrink() : Image.asset(placeholder!, fit: fit)),
    //   fit: fit,
    //   useOldImageOnUrlChange: true,
    // );
  }
}

class SvgImageFromAsset extends StatelessWidget {
  final String image;
  final double? height;
  final double? width;
  final BoxFit fit;
  final Color? color;
  final bool matchTextDirection;

  const SvgImageFromAsset(
    this.image, {
    this.height,
    this.width,
    this.color,
    this.fit = BoxFit.contain,
    this.matchTextDirection = true,
    super.key,
  });

  const SvgImageFromAsset.square(
    this.image, {
    double size = 24,
    this.color,
    this.fit = BoxFit.contain,
    this.matchTextDirection = true,
    super.key,
  })  : height = size,
        width = size;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      image,
      fit: fit,
      color: color,
      width: width,
      height: height,
      matchTextDirection: matchTextDirection,
    );
  }
}

class RoundedSquareCachedImage extends StatelessWidget {
  final String imageUrl;
  final String? placeholder;
  final Widget? placeholderWidget;
  final double size;
  final BoxFit fit;
  final Color? color;
  final bool matchTextDirection;
  final double radius;

  const RoundedSquareCachedImage({
    required this.imageUrl,
    this.placeholder,
    this.placeholderWidget,
    this.size = 48,
    this.fit = BoxFit.cover,
    this.color,
    this.matchTextDirection = true,
    this.radius = 8,
    Key? key,
  })  : assert(placeholder == null || placeholderWidget == null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    if (imageUrl.isEmpty) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: placeholderWidget ?? (placeholder.isNullOrEmpty ? const SizedBox.shrink() : Image.asset(placeholder!, fit: fit)),
      );
    }
    return PhysicalModel(
      elevation: 2,
      borderRadius: BorderRadius.circular(radius),
      color: onBackgroundClr.withOpacity(0.4),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: CachedNetworkImage(
          width: size,
          height: size,
          imageUrl: imageUrl,
          httpHeaders: {'Authorization': 'Bearer ${Prefs().token()}'},
          placeholder: (context, url) =>
              placeholderWidget ?? (placeholder.isNullOrEmpty ? const SizedBox.shrink() : Image.asset(placeholder!, fit: fit)),
          errorWidget: (context, url, error) =>
              placeholderWidget ?? (placeholder.isNullOrEmpty ? const SizedBox.shrink() : Image.asset(placeholder!, fit: fit)),
          fit: fit,
          useOldImageOnUrlChange: true,
        ),
      ),
    );
  }
}

class CachedImage extends StatelessWidget {
  final String imageUrl;
  final String? placeholder;
  final Widget? placeholderWidget;
  final double width;
  final double height;
  final BoxFit fit;
  final Color? color;
  final bool matchTextDirection;

  const CachedImage({
    required this.imageUrl,
    this.placeholder,
    this.placeholderWidget,
    this.width = 24,
    this.height = 24,
    this.fit = BoxFit.contain,
    this.color,
    this.matchTextDirection = true,
    Key? key,
  })  : assert(placeholder == null || placeholderWidget == null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    if (imageUrl.isEmpty) {
      return placeholderWidget ?? (placeholder.isNullOrEmpty ? const SizedBox.shrink() : Image.asset(placeholder!, fit: fit));
    }
    return CachedNetworkImage(
      width: width,
      height: height,
      imageUrl: imageUrl,
      httpHeaders: {'Authorization': 'Bearer ${Prefs().token()}'},
      placeholder: (context, url) =>
          placeholderWidget ?? (placeholder.isNullOrEmpty ? const SizedBox.shrink() : Image.asset(placeholder!, fit: fit)),
      errorWidget: (context, url, error) =>
          placeholderWidget ?? (placeholder.isNullOrEmpty ? const SizedBox.shrink() : Image.asset(placeholder!, fit: fit)),
      fit: fit,
      useOldImageOnUrlChange: true,
    );
  }
}
