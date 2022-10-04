import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masarifi/component/select_record_dialog.dart';
import 'package:masarifi/constants.dart';
import 'package:masarifi/controllers/View_controllers/main_page_controller.dart';
import 'package:masarifi/pages.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  String getTitleValue({required Pages page}) {
    switch (page) {
      case Pages.homePage:
        return "لمحة عامة";
      case Pages.mounthPage:
        return "مصاريف الشهر";
      case Pages.categoriesPage:
        return "الأصناف";
      case Pages.settingsPage:
        return "الإعدادات";
      default:
        return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: GetBuilder<MainPageController>(
        init: Get.find<MainPageController>(),
        builder: (controller) => RichText(
          text: TextSpan(
            text: getTitleValue(page: controller.currentPage.value),
            style: getTextStyle(
              size: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
      centerTitle: true,
      // actions: [
      //   Get.find<MainPageController>().currentPage.value == Pages.mounthPage
      //       ? IconButton(
      //           onPressed: () =>
      //               Get.find<MainPageController>().resetFilterMounthPage(),
      //           icon: Icon(Icons.sort))
      //       : Container()
      // ],
      leading: IconButton(
          onPressed: () => Get.defaultDialog(
              title: "إختر اليوم",
              titleStyle: getTextStyle(
                size: 20,
                fontWeight: FontWeight.bold,
                color: Get.theme.primaryColor,
              ),
              content: SelectRecordDialog()),
          icon: Icon(Icons.date_range)),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(55);
}
