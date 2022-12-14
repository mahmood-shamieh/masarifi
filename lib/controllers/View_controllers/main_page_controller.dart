import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:masarifi/models/db_models/category_model.dart';
import 'package:masarifi/models/db_models/payment_model.dart';
import 'package:masarifi/models/db_models/record_model.dart';
import 'package:masarifi/pages.dart';
import 'package:masarifi/requests/category_requests/add_category_request.dart';
import 'package:masarifi/requests/category_requests/delete_category_request.dart';
import 'package:masarifi/requests/category_requests/read_category_request.dart';
import 'package:masarifi/requests/category_requests/update_category_request.dart';
import 'package:masarifi/requests/payment_requests/add_payment_request.dart';
import 'package:masarifi/requests/payment_requests/delete_payment_request.dart';
import 'package:masarifi/requests/payment_requests/read_payment_request.dart';
import 'package:masarifi/requests/payment_requests/update_payment_request.dart';
import 'package:masarifi/requests/public_database_requests/create_record_request.dart';
import 'package:intl/intl.dart';
import 'package:masarifi/requests/record_requests/read_record_request.dart';

class MainPageController extends GetxController {
  RxBool loading = true.obs;
  Rx<Pages> currentPage = Pages.homePage.obs;
  RecordModel? todayRecord;
  Rxn<List<CategoryModel>> categories = Rxn<List<CategoryModel>>();
  Rxn<List<PaymentModel>> viewTodayPayment = Rxn<List<PaymentModel>>();
  Rxn<List<PaymentModel>> todayPayment = Rxn();
  Rxn<bool> isLightkMode = Rxn<bool>();
  Rxn<CategoryModel> filterdCategory = Rxn<CategoryModel>();
  Rxn<CategoryModel?> selectedCategory = Rxn();
  Rxn<PaymentModel?> selectedPayment = Rxn();
  Rxn<List<RecordModel>> records = Rxn<List<RecordModel>>();
  TextEditingController categoryNameFieldController = TextEditingController();
  TextEditingController priceFieldController = TextEditingController();
  TextEditingController noteFieldController = TextEditingController();
  TextEditingController editPriceFieldController = TextEditingController();
  TextEditingController editNoteFieldController = TextEditingController();
  TextEditingController editCategoryFieldController = TextEditingController();
  bool? detectThemeMode() {
    bool? isLightMode = GetStorage().read<bool>("lightMode");
    if (isLightMode == null) {
      return null;
    } else if (isLightMode) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void onInit() async {
    isLightkMode.value = detectThemeMode();
    loading(true);
    CreateRecordRequest createRecordRequest = CreateRecordRequest();
    ReadRecordRequest readRecordRequest = ReadRecordRequest();
    ReadCategoryRequest readCategoryRequest = ReadCategoryRequest();
    ReadPaymentRequest readPaymentRequest = ReadPaymentRequest();
    todayRecord = await createRecordRequest.getTodayRequest();
    records.value = await readRecordRequest.excuteRequest();
    categories.value = await readCategoryRequest.excuteRequest();
    viewTodayPayment.value =
        await readPaymentRequest.excuteRequest(recordId: todayRecord?.id);
    todayPayment.value = viewTodayPayment.value!;
    loading(false);
    update();
  }

  void changeThemeMode({bool? isLightMode}) {
    this.isLightkMode.value = isLightMode;
    update();
  }

  void filterData({CategoryModel? categoryModel}) {
    if (categoryModel == null) return;
    filterdCategory.value = categoryModel;
    List<PaymentModel> tempList = [];
    todayPayment.value?.forEach((element) {
      if (element.category_id == categoryModel.id) tempList.add(element);
    });
    viewTodayPayment.value = tempList;
    update();
  }

  void updateAllData({required RecordModel todayRecord}) async {
    loading(true);
    // ReadRecordRequest readRecordRequest = ReadRecordRequest();
    ReadPaymentRequest readPaymentRequest = ReadPaymentRequest();
    this.todayRecord = todayRecord;
    // records.value = await readRecordRequest.excuteRequest();
    todayPayment.value =
        await readPaymentRequest.excuteRequest(recordId: todayRecord.id);
    viewTodayPayment.value = todayPayment.value;
    resetFilterMounthPage();
    loading(false);
    update();
  }

  double getTodayPaymentByCategory({int? categoryId}) {
    double result = 0;
    todayPayment.value?.forEach((element) {
      if (element.category_id == categoryId) result += element.price!;
    });
    return result;
  }

  void deleteCategory({required CategoryModel categoryModel}) {
    DeleteCategoryRequest deleteCategoryRequest = DeleteCategoryRequest();
    deleteCategoryRequest.excuteRequest(categoryModel: categoryModel);
    categories.value?.remove(categoryModel);
    Get.back();
    update();
  }

  void deletePayment({required PaymentModel paymentModel}) {
    DeletePaymentRequest deletePaymentRequest = DeletePaymentRequest();
    deletePaymentRequest.excuteRequest(paymentModel: paymentModel);
    todayPayment.value?.remove(paymentModel);
    viewTodayPayment.value?.remove(paymentModel);
    Get.back();
    update();
  }

  void resetFilterMounthPage() {
    viewTodayPayment.value = todayPayment.value;
    filterdCategory.value = null;
    update();
  }

  void addCategoryData() async {
    AddCategoryRequest addCategoryRequest = AddCategoryRequest();
    CategoryModel categoryModel = CategoryModel();
    categoryModel.id = null;
    categoryModel.name = categoryNameFieldController.text;
    int catId =
        await addCategoryRequest.executeRequest(categoryModel: categoryModel);
    categoryModel.id = catId;
    if (catId != 0) {
      categories.value?.add(categoryModel);
      update();
    }
    categoryNameFieldController.text = '';
    Get.back();
  }

  void choseSelectedCategory({CategoryModel? categoryModel}) {
    selectedCategory.value = categoryModel;
    update();
  }

  void updateCategoryModle({required CategoryModel categoryModel}) {
    UpdateCategoryRequest updateCategoryRequest = UpdateCategoryRequest();
    categoryModel.name = editCategoryFieldController.text;
    updateCategoryRequest.excuteRequest(categoryModel: categoryModel);
    Get.back();
  }

  void updatepaymentModle({required PaymentModel paymentModel}) {
    UpdatePaymentRequest updatePaymentRequest = UpdatePaymentRequest();
    paymentModel.price = double.tryParse(editPriceFieldController.text);
    paymentModel.note = editNoteFieldController.text;
    paymentModel.category_id =
        selectedCategory.value?.id ?? paymentModel.category_id;
    updatePaymentRequest.excuteRequest(paymentModel: paymentModel);
    update();
    Get.back();
  }

  void addPaymentData() async {
    PaymentModel paymentModel = PaymentModel(
        id: null,
        category_id: selectedCategory.value?.id,
        note: noteFieldController.text,
        record_id: todayRecord?.id,
        price: double.tryParse(priceFieldController.text),
        time_stamp: DateFormat("yyyy-MM-dd").format(DateTime.now()));
    AddPaymentRequest addPaymentRequest = AddPaymentRequest();
    int id = await addPaymentRequest.excuteRequest(paymentModel: paymentModel);
    if (id != 0) paymentModel.id = id;
    viewTodayPayment.value!.insert(0, paymentModel);
    update();
    priceFieldController.text = '';
    noteFieldController.text = '';
    Get.back();
  }

  String? getCategoryName({required int id}) {
    String? name;
    categories.value!.forEach((element) {
      if (element.id == id) name = element.name;
    });
    return name;
  }

  navigate({required Pages page}) {
    currentPage.value = page;
    update();
  }
}
