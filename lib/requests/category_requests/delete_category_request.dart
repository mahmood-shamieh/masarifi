import 'package:get_it/get_it.dart';
import 'package:sqflite/sqflite.dart';

class DeleteCategoryRequest {
  Future<int> excuteRequest({required int id}) async {
    Database db = GetIt.I<Database>();
    int numberOfRowEffected =
        await db.delete('category', where: 'id = ?', whereArgs: [id]);
    return numberOfRowEffected;
  }
}
