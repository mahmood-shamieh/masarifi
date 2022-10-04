import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class CreatePaymentRequest {
  String query =
      "CREATE TABLE IF NOT EXISTS `payment` ( `id` INTEGER  NOT NULL PRIMARY KEY AUTOINCREMENT , `price` DOUBLE(255) NOT NULL , `category_id` INT(255) NULL , `record_id` INT(255) NULL , `note` VARCHAR(255) NOT NULL,`time_stamp` VARCHAR(255) NOT NULL) ;";

  void inialRequest() async {
    Database database = GetIt.I<Database>();
    print(database);
    database.execute(query);
//     await database?.transaction((txn) async {
//       int id1 = await txn.rawInsert(
//           'INSERT INTO Test(name, value, num) VALUES("some name", 1234, 456.789)');
//       print('inserted1: $id1');
//       int id2 = await txn.rawInsert(
//           'INSERT INTO Test(name, value, num) VALUES(?, ?, ?)',
//           ['another name', 12345678, 3.1416]);
//       print('inserted2: $id2');
//       int count = await database!.rawUpdate(
//           'UPDATE Test SET name = ?, value = ? WHERE name = ?',
//           ['updated name', '9876', 'some name']);
//       print('updated: $count');
//       List<Map> list = await database!.rawQuery('SELECT * FROM Test');
//       List<Map> expectedList = [
//         {'name': 'updated name', 'id': 1, 'value': 9876, 'num': 456.789},
//         {'name': 'another name', 'id': 2, 'value': 12345678, 'num': 3.1416}
//       ];
//       print(list);
//       print(expectedList);

// // Count the records
//       count = Sqflite.firstIntValue(
//           await database!.rawQuery('SELECT COUNT(*) FROM Test'))!;
//       assert(count == 2);
//     });
  }
}
