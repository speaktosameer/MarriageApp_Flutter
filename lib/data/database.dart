import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';


class DbController {
  late Database _dataBase;

  static DbController? _instance;

  DbController._();

  factory DbController() {
    return _instance ??= DbController._();
  }

  Database get database => _dataBase;

  Future<void> initDataBase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'app_db.sql');
    _dataBase = await openDatabase(path, version: 1, onOpen: (Database db) {},
        onCreate: (Database db, int vertion) async {

          await db.execute('CREATE TABLE users ('
              'id INTEGER PRIMARY KEY AUTOINCREMENT,'
              'firstName TEXT  NOT NULL,'
              'lastName TEXT  NOT NULL,'
              'age INTEGER  NOT NULL,'
              'mobile TEXT NOT NULL,'
              'email TEXT NOT NULL,'
              'password TEXT NOT NULL'
              ')'
          );

        },
        onDowngrade: (Database database, int oldVertion, int newVertion) {},
        onUpgrade: (Database database, int oldVertion, int newVertion) {});
  }
}
