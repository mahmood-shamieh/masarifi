import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:masarifi/component/scaffold_widget.dart';
import 'package:masarifi/constants.dart';
import 'package:masarifi/controllers/View_controllers/main_page_controller.dart';
import 'package:masarifi/requests/public_database_requests/create_category_request.dart';
import 'package:masarifi/requests/public_database_requests/create_database_request.dart';
import 'package:masarifi/requests/public_database_requests/create_payment_request.dart';
import 'package:masarifi/requests/public_database_requests/create_record_request.dart';
import 'package:intl/intl.dart';

import 'models/db_models/record_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  CreateDatabaseRequest createDatabaseRequest = CreateDatabaseRequest();
  CreateRecordRequest createRecordRequest = CreateRecordRequest();
  CreateCategoryRequest createCategoryRequest = CreateCategoryRequest();
  CreatePaymentRequest createPaymentRequest = CreatePaymentRequest();
  await createDatabaseRequest.initalRequest();
  await GetStorage.init();
  createRecordRequest.inialRequest();
  createCategoryRequest.inialRequest();
  createPaymentRequest.inialRequest();
  Get.put<MainPageController>(MainPageController());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ThemeMode getThemeMode() {
      bool? isLightMode = GetStorage().read<bool>("lightMode");
      if (isLightMode == null) {
        return ThemeMode.system;
      } else if (isLightMode) {
        return ThemeMode.light;
      } else {
        return ThemeMode.dark;
      }
    }

    return GetMaterialApp(
      textDirection: direction,
      home: ScaffoldWidget(),
      themeMode: getThemeMode(),
      theme: ThemeData.light().copyWith(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.indigo[600],
            foregroundColor: Colors.indigo[600],
          ),
        ),
        primaryColor: Colors.indigo[600],
        scaffoldBackgroundColor: Color(0xfdeeeeee),
        appBarTheme: AppBarTheme().copyWith(
          backgroundColor: Colors.indigo[600],
        ),
        cardColor: Colors.indigo[600],
      ),
      darkTheme: ThemeData.dark().copyWith(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 125, 68, 194),
            foregroundColor: Color.fromARGB(255, 125, 68, 194),
          ),
        ),
        scaffoldBackgroundColor: const Color(0xff121212),
        primaryColor: const Color(0xffeeeeee),
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: const Color(0xff1f1f1f),
        ),
        cardColor: Color.fromARGB(255, 125, 68, 194),
        iconTheme: const IconThemeData().copyWith(
          color: Color.fromARGB(255, 125, 68, 194),
        ),
      ),
    );
  }
}
