import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:masarifi/constants.dart';
import 'package:masarifi/controllers/View_controllers/main_page_controller.dart';
import 'package:masarifi/pages.dart';

class SettingsPage extends GetView<MainPageController> {
  getTextValue({required bool isDarkMode}) {
    if (controller.isLightkMode.value != null) {
      if (controller.isLightkMode.value!) {
        return "تفعيل الوضع المظلم";
      } else {
        return "تفعيل الوضع المضيء";
      }
    } else {
      if (isDarkMode) {
        return "تفعيل الوضع المضيء";
      } else {
        return "تفعيل الوضع المظلم";
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return GetBuilder<MainPageController>(
        init: Get.find<MainPageController>(),
        builder: (controller) => ListBody(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 50),
                  padding: const EdgeInsets.all(12),
                  child: ElevatedButton(
                    onPressed: () {
                      if (controller.isLightkMode.value != null) {
                        if (controller.isLightkMode.value!) {
                          controller.changeThemeMode(isLightMode: false);
                          Get.changeThemeMode(ThemeMode.dark);
                          GetStorage().write("lightMode", false);
                        } else {
                          controller.changeThemeMode(isLightMode: true);
                          Get.changeThemeMode(ThemeMode.light);
                          GetStorage().write("lightMode", true);
                        }
                      } else {
                        controller.changeThemeMode(isLightMode: !isDarkMode);
                        Get.changeThemeMode(
                            isDarkMode ? ThemeMode.light : ThemeMode.dark);
                        GetStorage().write("lightMode", !isDarkMode);
                      }
                    },
                    child: RichText(
                      text: TextSpan(
                        text: getTextValue(isDarkMode: isDarkMode),
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
