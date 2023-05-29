import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:masarifi/models/db_models/record_model.dart';
import 'package:masarifi/requests/record_requests/add_record_request.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:intl/intl.dart';

class CreateRecordRequest {
  String query =
      "CREATE TABLE IF NOT EXISTS `record` ( `id` INTEGER  NOT NULL PRIMARY KEY AUTOINCREMENT , `date_as_id` VARCHAR(255) NOT NULL ) ;";
  void inialRequest() async {
    Database database = GetIt.I<Database>();
    database.execute(query);
  }

  Future<RecordModel> getTodayRequest() async {
    DateTime time = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM').format(time);
    StringBuffer query = StringBuffer();
    query.write('SELECT * FROM record WHERE date_as_id LIKE');
    query.write('\'');
    query.write(formattedDate.toString());
    query.write('\'');
    Database database = GetIt.I<Database>();
    List data = await database.rawQuery(query.toString());
    if (data.isEmpty) {
      RecordModel todayRecord = RecordModel();
      todayRecord.id = null;
      todayRecord.date_as_id = formattedDate;
      AddRecordRequest addRecordRequest = AddRecordRequest();
      int recordId =
          await addRecordRequest.excuteRequest(recordModel: todayRecord);
      todayRecord.id = recordId;
      return todayRecord;
    } else {
      return RecordModel.fromMap(data.first);
    }
  }
}
