import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masarifi/controllers/View_controllers/main_page_controller.dart';
import 'package:masarifi/pages.dart';
import 'package:masarifi/pages/categories_page.dart';
import 'package:masarifi/pages/home_page.dart';
import 'package:masarifi/pages/mounth_page.dart';
import 'package:masarifi/pages/settings_page.dart';

class MainPageWidget extends GetView<MainPageController> {
  @override
  Widget build(BuildContext context) {
    switch (controller.currentPage.value) {
      case Pages.homePage:
        return HomePage();
      case Pages.mounthPage:
        return MounthPage();
      case Pages.categoriesPage:
        return CategoriesPage();
      case Pages.settingsPage:
        return SettingsPage();
      default:
        return HomePage();
    }
  }
}
