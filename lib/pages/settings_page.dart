import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:masarifi/constants.dart';
import 'package:masarifi/controllers/View_controllers/main_page_controller.dart';
import 'package:masarifi/pages.dart';

class SettingsPage extends GetView<MainPageController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainPageController>(
        init: Get.find<MainPageController>(),
        builder: (controller) => ListBody(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 50),
                  padding: const EdgeInsets.all(12),
                  child: ElevatedButton(
                    onPressed: () {
                      controller.changeThemeMode(
                          isDarkMode: !controller.isDarkMode.value);
                      if (controller.isDarkMode.value) {
                        Get.changeThemeMode(ThemeMode.light);
                        GetStorage().write("lightMode", true);
                      } else {
                        Get.changeThemeMode(ThemeMode.dark);
                        GetStorage().write("lightMode", false);
                      }
                    },
                    child: RichText(
                      text: TextSpan(
                        text: controller.isDarkMode.value
                            ? "تفعيل الوضع المظلم"
                            : "تفعيل الوضع المضيء",
                        style: getTextStyle(
                          color: Colors.white,
                          size: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ));
  }
}
