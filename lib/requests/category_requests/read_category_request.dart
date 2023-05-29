import 'package:get_it/get_it.dart';
import 'package:masarifi/models/db_models/category_model.dart';
import 'package:sqflite/sqflite.dart';

class ReadCategoryRequest {
  Future<List<CategoryModel>> excuteRequest() async {
    Database db = GetIt.I<Database>();
    List data = await db.rawQuery('SELECT * FROM category');
    return data.map((e) => CategoryModel.fromMap(e)).toList();
  }
}
