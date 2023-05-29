import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:masarifi/component/add_category_dialog.dart';
import 'package:masarifi/constants.dart';

import 'add_payment_dialog.dart';

class PaymentOrCategoryAddBottomSheet extends StatelessWidget {
  const PaymentOrCategoryAddBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              Get.back();
              Get.defaultDialog(
                  title: "إضافة تصنيف",
                  content: AddCategoryDialg(),
                  titleStyle: getTextStyle(
                      size: 25,
                      fontWeight: FontWeight.bold,
                      color: Get.theme.primaryColor));
            },
            child: Container(
              width: Get.mediaQuery.size.width,
              child: Center(
                child: RichText(
                  text: TextSpan(
                    text: "إضافة تصنيف",
                    style: getTextStyle(
                        size: 20,
                        color: Get.theme.scaffoldBackgroundColor,
                        fontWeight: FontWeight.w300),
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              Get.back();
              Get.defaultDialog(
                  titleStyle: getTextStyle(
                      size: 25,
                      fontWeight: FontWeight.bold,
                      color: Get.theme.primaryColor),
                  title: "إضافة دفعة",
                  content: AddPaymentDialog());
            },
            child: Container(
              width: Get.mediaQuery.size.width,
              child: Center(
                child: RichText(
                  text: TextSpan(
                    text: "إضافة دفعة",
                    style: getTextStyle(
                        size: 20,
                        color: Get.theme.scaffoldBackgroundColor,
                        fontWeight: FontWeight.w300),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
