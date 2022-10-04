import 'package:get_it/get_it.dart';
import 'package:masarifi/models/db_models/record_model.dart';
import 'package:sqflite/sqflite.dart';

class AddRecordRequest {
  Future<int> excuteRequest({required RecordModel recordModel}) async {
    Database database = GetIt.I<Database>();
    return await database.insert('record', recordModel.toMap());
  }
}
