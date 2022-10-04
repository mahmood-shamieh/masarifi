import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masarifi/component/payment_block_widget.dart';
import 'package:masarifi/constants.dart';
import 'package:masarifi/controllers/View_controllers/main_page_controller.dart';

class MounthPage extends GetView<MainPageController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainPageController>(
        init: controller,
        builder: (controller) => controller.todayPayment.value!.isEmpty
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
            : ListBody(
                children: controller.todayPayment.value!
                    .map((e) => PaymentBlockWidget(paymentModel: e))
                    .toList(),
              ));
  }
}
