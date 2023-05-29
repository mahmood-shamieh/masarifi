import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:masarifi/constants.dart';
import 'package:masarifi/controllers/View_controllers/main_page_controller.dart';
import 'package:masarifi/models/db_models/category_model.dart';

class CategoryFilterWidget extends GetView<MainPageController> {
  CategoryModel categoryModel;
  Function()? onTap;
  CategoryFilterWidget({super.key, required this.categoryModel, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(4.0),
        margin: const EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          color: controller.filterdCategory.value?.id == categoryModel.id
              ? Get.theme.cardColor.withOpacity(0.3)
              : Get.theme.cardColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: RichText(
          text: TextSpan(
            text: categoryModel.name,
            style: getTextStyle(
              color: Colors.white,
              size: 20,
              fontWeight: FontWeight.w100,
            ),
          ),
        ),
      ),
    );
  }
}
