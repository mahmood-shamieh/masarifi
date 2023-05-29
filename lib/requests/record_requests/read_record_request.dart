import 'package:get_it/get_it.dart';
import 'package:sqflite/sqflite.dart';

import '../../models/db_models/record_model.dart';

class ReadRecordRequest {
  Future<List<RecordModel>> excuteRequest() async {
    Database database = GetIt.I<Database>();
    List data = await database.rawQuery("SELECT * FROM record");
    return data.map((e) => RecordModel.fromMap(e)).toList();
  }
}
