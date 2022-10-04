import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import "package:path/path.dart";
import 'package:get_it/get_it.dart';
import 'create_category_request.dart';
import 'create_payment_request.dart';
import 'create_record_request.dart';

class CreateDatabaseRequest {
  String databaseName = "database.db";
  String? path;
  String? databasesPath;
  Database? database;
  initalRequest() async {
    databasesPath = await getDatabasesPath();
    path = join(databasesPath!, databaseName);
    database = await openDatabase(
      path!,
      version: 1,
    );
    GetIt getIt = GetIt.I;
    // database!.execute("drop table category");
    getIt.registerSingleton<Database>(database!);
  }
}
