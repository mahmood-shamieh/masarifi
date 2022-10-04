import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
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
  createRecordRequest.inialRequest();
  createCategoryRequest.inialRequest();
  createPaymentRequest.inialRequest();
  Get.put<MainPageController>(MainPageController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      textDirection: direction,
      home: ScaffoldWidget(),
    );
  }
}
