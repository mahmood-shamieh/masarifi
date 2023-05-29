import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:masarifi/requests/category_requests/add_category_request.dart';
import 'package:masarifi/requests/category_requests/delete_category_request.dart';
import 'package:masarifi/requests/category_requests/read_category_request.dart';
import 'package:masarifi/requests/category_requests/update_category_request.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class CreateCategoryRequest {
  String query =
      "CREATE TABLE IF NOT EXISTS `category` ( `id` INTEGER  NOT NULL PRIMARY KEY AUTOINCREMENT , `name` VARCHAR(255) NOT NULL ) ;";

  void inialRequest() async {
    Database db = GetIt.I<Database>();
    db.execute(query);
  }
}
