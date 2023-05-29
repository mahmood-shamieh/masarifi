import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:masarifi/constants.dart';
import 'package:masarifi/controllers/View_controllers/main_page_controller.dart';

class AddCategoryDialg extends GetView<MainPageController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        getTextField(
            hintText: "أدخل اسم التصنيف",
            textEditingController: controller.categoryNameFieldController),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: [
            ElevatedButton(
              onPressed: () => controller.addCategoryData(),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: "إضافة",
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
