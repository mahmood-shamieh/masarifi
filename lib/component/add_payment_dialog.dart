import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masarifi/controllers/View_controllers/main_page_controller.dart';
import 'package:masarifi/models/db_models/category_model.dart';

import '../constants.dart';

class AddPaymentDialog extends GetView<MainPageController> {
  @override
  Widget build(BuildContext context) {
    // Get.put(MainPageController());
    print(controller.categories.value!.length);
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: ListBody(
          children: [
            getTextField(
                hintText: "أدخل الدفعة الحالية",
                textInputType: TextInputType.number,
                textEditingController: controller.priceFieldController),
            getTextField(
                hintText: "أدخل وصف الدفعة",
                textInputType: TextInputType.multiline,
                textEditingController: controller.noteFieldController,
                lineNumber: null),
            controller.categories.value == null
                ? RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: "لا يوجد بيانات",
                        style: getTextStyle(
                            size: 20,
                            color: Get.theme.primaryColor,
                            fontWeight: FontWeight.w300)))
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownSearch<CategoryModel>(
                      // popupProps: PopupProps.menu(
                      //     showSelectedItems: true,
                      //     disabledItemFn: (String s) => s.startsWith('I'),
                      // ),
                      items: controller.categories.value!.toList(),
                      dropdownDecoratorProps: DropDownDecoratorProps(
                        dropdownSearchDecoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: "الصنف",
                        ),
                      ),
                      onChanged: (selectedCategory) =>
                          controller.choseSelectedCategory(
                              categoryModel: selectedCategory),
                    ),
                  ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: [
                ElevatedButton(
                  onPressed: () => controller.addPaymentData(),
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
                      backgroundColor:
                          MaterialStateProperty.all(Colors.red[500])),
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
        ),
      ),
    );
  }
}
