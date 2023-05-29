import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:masarifi/controllers/View_controllers/main_page_controller.dart';

import '../constants.dart';
import '../models/db_models/payment_model.dart';

class DeletePaymentDialog extends GetView<MainPageController> {
  PaymentModel paymentModel;
  DeletePaymentDialog({super.key, required this.paymentModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RichText(
          text: TextSpan(
            text: "هل أنت متأكد ؟؟",
            style: getTextStyle(
                size: 20,
                color: Get.theme.primaryColor,
                fontWeight: FontWeight.w100),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () =>
                  controller.deletePayment(paymentModel: paymentModel),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: "تأكيد",
                  style: getTextStyle(
                      size: 20,
                      color: Get.theme.scaffoldBackgroundColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red[500])),
              onPressed: () => Get.back(),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: "إلغاء",
                  style: getTextStyle(
                      size: 20,
                      color: Get.theme.scaffoldBackgroundColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
