import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBProvider {
  DBProvider._();
  static final DBProvider instance = DBProvider._();
  static Database? _database;

  get database async {
    if (_database != null) {
      //check if we already have a database
      return _database;
    }
    //crete a new database
    return await initDataBase();
  }

  initDataBase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'tarefas.db'),
      //this property will execute a function when the db is created
      onCreate: (db, version) async {
        //we will create a SQL request to create a table  for our task
        await db.execute(_tableTask);
        await db.execute(_tableObjects);
      },
      version: 1,
    );
  }

  String get _tableTask => '''CREATE TABLE task (
    title_task TEXT PRIMARY KEY,
    status_task TEXT

  );''';

  String get _tableObjects => '''CREATE TABLE task (
    title_object TEXT PRIMARY KEY,
    status_object TEXT,
    quantity TEXT,
    value TEXT
  );''';
}
