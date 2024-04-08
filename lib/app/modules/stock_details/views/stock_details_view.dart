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
    List<_SalesData> data = [
      _SalesData('Jan', 35),
      _SalesData('Feb', 20),
      _SalesData('Mar', 34),
      _SalesData('Apr', 12),
      _SalesData('May', 40)
    ];
    return Scaffold(
      appBar: AppBar(
        title: const CommonText.semiBold('ADGH'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
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
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: SquareImageFromNetwork(
                          imageUrl: defaultImage,
                          fit: BoxFit.cover,
                          size: 44,
                        ),
                        clipBehavior: Clip.hardEdge,
                      ).marginAll(2),
                    ),
                    Expanded(
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CommonText.semiBold(
                            "Stocks Name",
                            size: 14,
                          ),
                        ],
                      ).marginOnly(left: 8),
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CommonText.semiBold(
                          "\$13.2342",
                          size: 14,
                        ),
                        CommonText.semiBold(
                          "-0.3%",
                          size: 12,
                          color: errorClr,
                        ),
                      ],
                    ).marginOnly(left: 8)
                  ],
                ).paddingAll(12),
              ),
              tabBar(controller).marginOnly(top: 12),
              SfCartesianChart(
                  primaryXAxis: CategoryAxis(),
                  title: ChartTitle(text: ""),
                  legend: Legend(isVisible: true),
                  primaryYAxis: NumericAxis(minimum: 0, maximum: 40, interval: 2),
                  tooltipBehavior: TooltipBehavior(enable: true),
                  series: <CartesianSeries<_SalesData, String>>[
                    AreaSeries<_SalesData, String>(
                        dataSource: data,
                        xValueMapper: (_SalesData sales, _) => sales.year,
                        yValueMapper: (_SalesData sales, _) => sales.sales,
                        name: 'Sales',
                        color: Color.fromRGBO(8, 142, 255, 0.5),
                        dataLabelSettings: DataLabelSettings(isVisible: true))
                  ]).marginOnly(top: 8),
              aboutUs().marginOnly(top: 12),
              CommonButton(
                onPressed: () {},
                label: "Purchase Stock",
              ).marginOnly(top: 12)
            ],
          ),
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
          CommonText.semiBold(
            "About",
            size: 16,
            color: tertiaryClr,
          ).marginOnly(bottom: 8),
          CommonText.medium(
              "Is it really possible to passively invest in small- and mid-cap stocks? Depending on which small- or mid-cap index an investor seeks to track, expect wide variations at both the equity style and sector levels as well as factors such as profitability. ")
        ],
      ).paddingAll(12),
    );
  }

  Widget tabBar(StockDetailsController controller) {
    return Container(
      decoration: carDecoration,
        child: TabBar(
      tabs: <Tab>[
        Tab(
          text: "Day",
        ),
        Tab(text: "Week"),
        Tab(
          text: "Month",
        ),
        Tab(
          text: "Year",
        ),
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
      indicator: BoxDecoration(borderRadius: BorderRadius.circular(8), color: tertiaryClr),
    ));
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
