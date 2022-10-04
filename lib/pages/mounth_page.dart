import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masarifi/component/category_filter_widget.dart';
import 'package:masarifi/component/payment_block_widget.dart';
import 'package:masarifi/constants.dart';
import 'package:masarifi/controllers/View_controllers/main_page_controller.dart';
import 'package:masarifi/models/db_models/category_model.dart';

class MounthPage extends GetView<MainPageController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainPageController>(
        init: Get.find<MainPageController>(),
        builder: (controller) => Column(
              children: [
                SizedBox(
                  height: 50,
                  child: ListView(
                    padding: const EdgeInsets.all(4.0),
                    scrollDirection: Axis.horizontal,
                    children: [
                      CategoryFilterWidget(
                        categoryModel: CategoryModel(id: 0, name: "الكل"),
                        onTap: () => controller.resetFilterMounthPage(),
                      ),
                      if (controller.viewTodayPayment.value != null)
                        ...controller.categories.value!
                            .map(
                              (data) => CategoryFilterWidget(
                                categoryModel: data,
                                onTap: () =>
                                    controller.filterData(categoryModel: data),
                              ),
                            )
                            .toList()
                    ],
                  ),
                ),
                Divider(
                  thickness: 3,
                ),
                controller.viewTodayPayment.value?.isEmpty ?? true
                    ? Container(
                        margin: const EdgeInsets.only(top: 50),
                        child: Center(
                          child: RichText(
                            text: TextSpan(
                              text: "لا يوجد بينات بعد",
                              style: getTextStyle(
                                  size: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Get.theme.primaryColor),
                            ),
                          ),
                        ),
                      )
                    : SizedBox(
                        height: MediaQuery.of(context).size.height - 170,
                        // width: 200,
                        child: SingleChildScrollView(
                          child: ListBody(
                            children: controller.viewTodayPayment.value!
                                .map((e) => PaymentBlockWidget(paymentModel: e))
                                .toList(),
                          ),
                        ),
                      ),
              ],
            ));
  }
}
