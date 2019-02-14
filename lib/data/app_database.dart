import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'package:sqflite/sqflite.dart';

import 'package:expense_manager/resources/strings.dart';

class AppDatabase {
  static final AppDatabase _appDatabase = new AppDatabase._internal();

  AppDatabase._internal();

  Database db;
  bool didInit = false;

  static AppDatabase get() {
    return _appDatabase;
  }

  Future<Database> getDb() async {
    if (!didInit) await _init();
    return db;
  }

  Future _init() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path= join(documentsDirectory.path,DbStrings.app_database_name);

  }

  Future close() async{
    var db = await getDb();
    return db.close();
  }
}
