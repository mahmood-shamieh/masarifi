import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masarifi/controllers/View_controllers/main_page_controller.dart';
import 'package:masarifi/models/db_models/payment_model.dart';

import '../constants.dart';
import '../models/db_models/category_model.dart';

class EditPaymentDialog extends GetView<MainPageController> {
  PaymentModel paymentModel;
  EditPaymentDialog({super.key, required this.paymentModel});

  @override
  Widget build(BuildContext context) {
    controller.editNoteFieldController.text = paymentModel.note!;

    controller.editPriceFieldController.text = paymentModel.price.toString();

    CategoryModel? categoryModel;
    controller.categories.value?.forEach((element) {
      if (element.id == paymentModel.category_id) {
        categoryModel = element;
      }
    });
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: ListBody(
          children: [
            getTextField(
                hintText: paymentModel.price.toString(),
                textInputType: TextInputType.number,
                textEditingController: controller.editPriceFieldController),
            getTextField(
                hintText: paymentModel.note,
                textInputType: TextInputType.multiline,
                textEditingController: controller.editNoteFieldController,
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
                      selectedItem: categoryModel,
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
                  onPressed: () =>
                      controller.updatepaymentModle(paymentModel: paymentModel),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: "تعديل",
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
