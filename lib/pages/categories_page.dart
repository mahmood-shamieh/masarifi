import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:masarifi/component/delete_category_dialog.dart';
import 'package:masarifi/component/edit_category_dialog.dart';
import 'package:masarifi/constants.dart';
import 'package:masarifi/controllers/View_controllers/main_page_controller.dart';

class CategoriesPage extends GetView<MainPageController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainPageController>(
      init: Get.find<MainPageController>(),
      builder: (controller) => ListBody(
        children: controller.categories.value?.isNotEmpty ?? false
            ? controller.categories.value!
                .map((e) => Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: ListTile(
                            leading: Icon(Icons.category_outlined),
                            title: RichText(
                              text: TextSpan(
                                text: e.name,
                                style: getTextStyle(
                                    size: 20, color: Get.theme.primaryColor),
                              ),
                            ),
                            trailing: SizedBox(
                              width: MediaQuery.of(context).size.width / 4,
                              child: Row(
                                children: [
                                  IconButton(
                                    onPressed: () => Get.defaultDialog(
                                        title: "تعديل",
                                        titleStyle: getTextStyle(
                                            size: 20,
                                            color: Get.theme.primaryColor,
                                            fontWeight: FontWeight.bold),
                                        content: EditCategoryDialog(
                                            categoryModel: e)),
                                    icon: Icon(Icons.edit),
                                  ),
                                  IconButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.red[500])),
                                    onPressed: () => Get.defaultDialog(
                                      title: "تنبيه الحذف",
                                      titleStyle: getTextStyle(
                                        size: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Get.theme.primaryColor,
                                      ),
                                      content: DeleteCategoryDialog(
                                          categoryModel: e),
                                    ),
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.redAccent[700],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Divider(
                          thickness: 2,
                        )
                      ],
                    ))
                .toList()
            : [
                Container(
                  margin: EdgeInsets.only(top: 50),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: "لا يوجد بيانات",
                      style: getTextStyle(
                          size: 20,
                          fontWeight: FontWeight.bold,
                          color: Get.theme.primaryColor),
                    ),
                  ),
                ),
              ],
      ),
    );
  }
}
