import 'package:get_it/get_it.dart';
import 'package:masarifi/models/db_models/category_model.dart';
import 'package:sqflite/sqflite.dart';

class UpdateCategoryRequest {
  Future<int> excuteRequest({required CategoryModel categoryModel}) async {
    Database db = GetIt.I<Database>();
    int innerId = await db.update('category', categoryModel.toMap(),
        where: 'id = ?', whereArgs: [categoryModel.id]);
    return innerId;
  }
}
