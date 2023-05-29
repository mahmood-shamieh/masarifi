import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masarifi/controllers/View_controllers/main_page_controller.dart';
import 'package:masarifi/models/db_models/record_model.dart';

import '../constants.dart';
import '../models/db_models/category_model.dart';

class SelectRecordDialog extends GetView<MainPageController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainPageController>(
      builder: (controller) => controller.loading.value
          ? CircularProgressIndicator()
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownSearch<RecordModel>(
                    items: controller.records.value!.toList(),
                    dropdownDecoratorProps: DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: "اليوم",
                      ),
                    ),
                    onChanged: (selectedRecord) {
                      controller.updateAllData(todayRecord: selectedRecord!);
                      Get.back();
                    },
                  ),
                ),
                Center(
                  child: ElevatedButton(
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
                  ),
                )
              ],
            ),
    );
  }
}
