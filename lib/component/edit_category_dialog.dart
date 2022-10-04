import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masarifi/constants.dart';
import 'package:masarifi/controllers/View_controllers/main_page_controller.dart';
import 'package:masarifi/models/db_models/category_model.dart';

class EditCategoryDialog extends GetView<MainPageController> {
  CategoryModel categoryModel;
  EditCategoryDialog({super.key, required this.categoryModel});

  @override
  Widget build(BuildContext context) {
    controller.editCategoryFieldController.text = categoryModel.name!;
    return ListBody(
      children: [
        getTextField(
            hintText: categoryModel.name,
            textEditingController: controller.editCategoryFieldController,
            textInputType: TextInputType.streetAddress),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: [
            ElevatedButton(
              onPressed: () =>
                  controller.updateCategoryModle(categoryModel: categoryModel),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: "تحديث",
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
