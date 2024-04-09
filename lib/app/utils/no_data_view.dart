import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../generated/assets.dart';
import '../theme/app_colors.dart';
import '../widgets/image.dart';

class NoDataView extends StatefulWidget {
  final String title;
  final bool showImage;

  const NoDataView({super.key, this.title = "No Data Found", this.showImage = false});

  @override
  State<NoDataView> createState() => _NoDataViewState();
}

class _NoDataViewState extends State<NoDataView> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2 / 1.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SquareSvgImageFromAsset(Assets.imagesIcAlertCircle, color: secondaryClr.withOpacity(0.5), size: 64),
          Text(widget.title.toString()).paddingAll(16),
        ],
      ),
    );
  }
}
