import 'package:get_it/get_it.dart';
import 'package:sqflite/sqflite.dart';

import '../../models/db_models/payment_model.dart';

class ReadPaymentRequest {
  Future<List<PaymentModel>> excuteRequest({int? recordId}) async {
    Database database = GetIt.I<Database>();
    StringBuffer query = StringBuffer();
    query.write("SELECT * FROM payment ");
    if (recordId != null) query.write("WHERE record_id = $recordId ");
    query.write("ORDER BY id DESC");
    List data = await database.rawQuery(query.toString());
    return data.map((e) => PaymentModel.fromMap(e)).toList();
  }
}
