import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:masarifi/controllers/View_controllers/main_page_controller.dart';
import 'package:masarifi/models/db_models/category_model.dart';

import '../constants.dart';

class DeleteCategoryDialog extends GetView<MainPageController> {
  CategoryModel categoryModel;
  DeleteCategoryDialog({super.key, required this.categoryModel});

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
                  controller.deleteCategory(categoryModel: categoryModel),
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
