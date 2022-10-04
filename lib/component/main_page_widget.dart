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
    int getIndex() {
      switch (controller.currentPage.value) {
        case Pages.homePage:
          return 0;
        case Pages.mounthPage:
          return 1;
        case Pages.categoriesPage:
          return 2;
        case Pages.settingsPage:
          return 3;
        default:
          return 0;
      }
    }

    return IndexedStack(
      children: [HomePage(), MounthPage(), CategoriesPage(), SettingsPage()],
      index: getIndex(),
    );
  }
}
