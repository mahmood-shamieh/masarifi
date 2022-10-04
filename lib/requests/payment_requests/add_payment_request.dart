import 'package:get_it/get_it.dart';
import 'package:masarifi/models/db_models/payment_model.dart';
import 'package:sqflite/sqflite.dart';

class AddPaymentRequest {
  Future<int> excuteRequest({required PaymentModel paymentModel}) async {
    Database database = GetIt.I<Database>();
    return await database.insert('payment', paymentModel.toMap());
  }
}
