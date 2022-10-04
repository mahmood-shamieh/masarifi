import 'package:get_it/get_it.dart';
import 'package:masarifi/models/db_models/category_model.dart';
import 'package:sqflite/sqflite.dart';

class AddCategoryRequest {
  Future<int> executeRequest({required CategoryModel categoryModel}) async {
    Database database = GetIt.I<Database>();
    int id = await database.insert('category', categoryModel.toMap());
    return id;
  }
}
