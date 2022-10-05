import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masarifi/constants.dart';
import 'package:masarifi/controllers/View_controllers/main_page_controller.dart';
import 'package:masarifi/models/db_models/category_model.dart';

import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}

class HomePage extends GetView<MainPageController> {
  @override
  Widget build(BuildContext context) {
    double todayPrice = 0;
    return GetBuilder<MainPageController>(
      init: Get.find<MainPageController>(),
      builder: (controller) {
        if (controller.todayPayment.value != null) {
          controller.todayPayment.value?.forEach((element) {
            todayPrice += element.price ?? 0;
          });
        }
        List<CategoryModel>? data = controller.categories.value;
        return ListBody(children: <Widget>[
          const SizedBox(
            height: 20,
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: "المصروف",
              style: getTextStyle(size: 30, color: Get.theme.primaryColor),
            ),
          ),
          controller.loading.value
              ? const SizedBox(
                  width: 50,
                  height: 50,
                  child: CircularProgressIndicator(),
                )
              : RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: todayPrice.toString(),
                    style: getTextStyle(
                        size: 40,
                        color: Get.theme.primaryColor,
                        fontWeight: FontWeight.w600),
                  ),
                ),

          (controller.todayPayment.value?.isNotEmpty ?? true)
              ? SizedBox(
                  // width: MediaQuery.of(context).size.width + 200,
                  height: MediaQuery.of(context).size.height / 2 + 150,
                  child: SfCircularChart(
                      title: ChartTitle(
                          text: 'مخطط يوضح النفقات الشهرية',
                          textStyle: getTextStyle(
                            color: Get.theme.primaryColor,
                            size: 15,
                            fontWeight: FontWeight.w300,
                          )),
                      legend: Legend(
                          textStyle: getTextStyle(
                            color: Get.theme.primaryColor,
                            size: 15,
                            fontWeight: FontWeight.w100,
                          ),
                          isVisible: true,
                          alignment: ChartAlignment.center,
                          isResponsive: true,
                          padding: 25,
                          itemPadding: 20,
                          overflowMode: LegendItemOverflowMode.wrap,
                          position: LegendPosition.top),
                      tooltipBehavior: TooltipBehavior(
                        enable: true,
                      ),
                      series: <CircularSeries<CategoryModel, String>>[
                        PieSeries<CategoryModel, String>(
                          dataSource: data,
                          xValueMapper: (CategoryModel categoryModel, _) =>
                              categoryModel.name,
                          yValueMapper: (CategoryModel categoryModel, _) =>
                              controller.getTodayPaymentByCategory(
                                  categoryId: categoryModel.id),
                          name: 'الشرح',
                          dataLabelSettings: DataLabelSettings(
                            isVisible: true,
                            textStyle: getTextStyle(
                              size: 20,
                              fontWeight: FontWeight.bold,
                              color: Get.theme.scaffoldBackgroundColor,
                            ),
                          ),
                        )
                      ]),
                )
              : Container(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: "لا يوجد نفقات بعد",
                      style: getTextStyle(
                          size: 20,
                          color: Colors.red[500],
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   //Initialize the spark charts widget
          //   child: SfSparkLineChart.custom(
          //     //Enable the trackball
          //     trackball: SparkChartTrackball(
          //         activationMode: SparkChartActivationMode.tap),
          //     //Enable marker
          //     marker: SparkChartMarker(
          //         displayMode: SparkChartMarkerDisplayMode.all),
          //     //Enable data label
          //     labelDisplayMode: SparkChartLabelDisplayMode.all,
          //     xValueMapper: (int index) => data[index].name,
          //     yValueMapper: (int index) => data[index].id!,
          //     dataCount: 5,
          //   ),
          // )
        ]);
      },
    );
  }
}
