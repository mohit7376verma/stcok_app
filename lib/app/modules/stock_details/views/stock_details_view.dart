import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:stock_app/app/theme/app_colors.dart';
import 'package:stock_app/app/widgets/common_button.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

import '../../../utils/constants.dart';
import '../../../widgets/common_text.dart';
import '../../../widgets/image.dart';
import '../controllers/stock_details_controller.dart';

class StockDetailsView extends GetView<StockDetailsController> {
  const StockDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const CommonText.semiBold('ADGH'), centerTitle: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: carDecoration,
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 22,
                    backgroundColor: tertiaryClr,
                    child: Container(
                      decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                      clipBehavior: Clip.hardEdge,
                      child: const SquareImageFromNetwork(imageUrl: defaultImage, fit: BoxFit.cover, size: 44),
                    ).marginAll(2),
                  ),
                  Expanded(
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CommonText.semiBold("Stocks Name", size: 14),
                      ],
                    ).marginOnly(left: 8),
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CommonText.semiBold("\$13.2342", size: 14),
                      CommonText.semiBold("-0.3%", size: 12, color: errorClr),
                    ],
                  ).marginOnly(left: 8)
                ],
              ).paddingAll(12),
            ),
            tabBar(controller).marginOnly(top: 12),
            Obx(() {
              return SfCartesianChart(
                primaryXAxis: const CategoryAxis(minimum: 0),
                title: const ChartTitle(text: ""),
                legend: const Legend(isVisible: true),
                primaryYAxis: const NumericAxis(edgeLabelPlacement: EdgeLabelPlacement.none),
                margin: EdgeInsets.zero,
                zoomPanBehavior: ZoomPanBehavior(
                  enablePinching: true,
                  enablePanning: true,
                ),
                series: <CartesianSeries<SalesData, String>>[
                  SplineAreaSeries<SalesData, String>(
                    dataSource: controller.data.value,
                    splineType: SplineType.monotonic,
                    xValueMapper: (SalesData sales, _) => sales.year,
                    yValueMapper: (SalesData sales, _) => sales.sales,
                    borderColor: tertiaryClr,
                    borderDrawMode: BorderDrawMode.excludeBottom,
                    borderWidth: 2,
                    gradient: LinearGradient(
                      colors: [
                        Colors.green[400]?.withOpacity(0.1) ?? tertiaryClr, // Start color
                        Colors.green[400]?.withOpacity(0.3) ?? tertiaryClr, // Start color
                        Colors.green[600]?.withOpacity(0.6) ?? tertiaryClr, // Start color
                        Colors.green[800]?.withOpacity(0.9) ?? tertiaryClr, // End color
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
        
                    color: tertiaryClr,
                    name: 'ADGH',
                    markerSettings: const MarkerSettings(
                      isVisible: true,
                      color: secondaryClr,
                      shape: DataMarkerType.circle,
                    ),
                    dataLabelSettings: const DataLabelSettings(isVisible: true),
        
                  )
                ],
              );
            }).marginOnly(top: 8, bottom: 12),
            aboutUs().marginOnly(top: 12),
            CommonButton(
              onPressed: () {},
              label: "Purchase Stock",
            ).marginOnly(top: 12)
          ],
        ).paddingAll(16),
      ),
    );
  }

  Widget aboutUs() {
    return Container(
      decoration: carDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CommonText.semiBold(
            "About",
            size: 16,
            color: tertiaryClr,
          ).marginOnly(bottom: 8),
          const CommonText.medium(
              "Is it really possible to passively invest in small- and mid-cap stocks? Depending on which small- or mid-cap index an investor seeks to track, expect wide variations at both the equity style and sector levels as well as factors such as profitability. ")
        ],
      ).paddingAll(12),
    );
  }

  Widget tabBar(StockDetailsController controller) {
    return Container(
      decoration: carDecoration,
      child: TabBar(
        tabs: const <Tab>[
          Tab(text: "Day"),
          Tab(text: "Week"),
          Tab(text: "Month"),
          Tab(text: "Year"),
        ],
        controller: controller.tabController,
        onTap: (index) {
          controller.tabIndex.value = index;
        },
        labelColor: onPrimaryClr,
        unselectedLabelColor: neutralClr,
        indicatorColor: tertiaryClr,
        indicatorSize: TabBarIndicatorSize.tab,
        dividerHeight: 0,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: tertiaryClr.withOpacity(0.4),
          border: Border.all(color: tertiaryClr, width: 2),
        ),
      ),
    );
  }
}


