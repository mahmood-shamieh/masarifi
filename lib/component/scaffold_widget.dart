import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masarifi/component/add_payment_dialog.dart';
import 'package:masarifi/component/app_bar_widget.dart';
import 'package:masarifi/component/main_page_widget.dart';
import 'package:masarifi/component/payment_or_category_add_btoom_sheet.dart';
import 'package:masarifi/constants.dart';
import 'package:masarifi/controllers/View_controllers/main_page_controller.dart';
import 'package:masarifi/pages.dart';

class ScaffoldWidget extends GetView<MainPageController> {
  const ScaffoldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Get.put(MainPageController());

    return GetBuilder<MainPageController>(
      init: Get.find<MainPageController>(),
      builder: (controller) => Scaffold(
        floatingActionButton: Container(
          margin: const EdgeInsets.only(bottom: 15),
          child: InkWell(
            onTap: () => Get.bottomSheet(PaymentOrCategoryAddBottomSheet(),
                backgroundColor: Get.theme.scaffoldBackgroundColor),
            child: CircleAvatar(
              maxRadius: 30,
              minRadius: 20,
              backgroundColor: Get.theme.primaryColor,
              child: Icon(
                Icons.add,
                color: Get.theme.scaffoldBackgroundColor,
              ),
            ),
          ),
        ),
        appBar: MyAppBar(),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: MainPageWidget(),
          ),
        ),
        bottomNavigationBar: Obx(() {
          return ConvexAppBar(
            key: key,
            backgroundColor: Get.theme.appBarTheme.backgroundColor.obs.value,
            items: const [
              TabItem(
                icon: Icons.home,
                title: 'الرئيسية',
              ),
              TabItem(icon: Icons.date_range, title: 'الشهر'),
              TabItem(icon: Icons.category, title: 'الأصناف'),
              TabItem(icon: Icons.settings, title: 'الإعدادت'),
            ],
            onTap: (int i) {
              switch (i) {
                case 0:
                  controller.navigate(page: Pages.homePage);
                  break;
                case 1:
                  controller.navigate(page: Pages.mounthPage);
                  break;
                case 2:
                  controller.navigate(page: Pages.categoriesPage);
                  break;
                case 3:
                  controller.navigate(page: Pages.settingsPage);
                  break;
                default:
                  controller.navigate(page: Pages.homePage);
                  break;
              }
            },
          );
        }),
      ),
    );
  }
}
