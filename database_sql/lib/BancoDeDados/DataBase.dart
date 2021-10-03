import 'dart:io';
import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

final String itemTable = "listTable";
final String idColumn = "idColumn";
final String nameColumn = "itemColumn";
final String quantColumn = "quantColumn";
final String valorColumn = "valorColumn";

class Item {
  int? id;
  String name = "";
  String quant = "";
  String valor = "";

  Item();

  Item.fromMap(Map map) {
    id = map[idColumn];
    name = map[nameColumn];
    quant = map[quantColumn];
    valor = map[valorColumn];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      nameColumn: name,
      quantColumn: quant,
      valorColumn: valor
    };
    if (id != null) {
      map[idColumn] = id;
    }
    return map;
  }

  @override
  String toString() {
    return "Item(id: $id, Name: $name, Quantidade: $quant, Valor: $valor)";
  }
}

class ItemHelper {
  static final ItemHelper _instance = ItemHelper._();

  factory ItemHelper() => _instance;

  ItemHelper._();

  static Database? _db;

  get db async {
    if (_db == null) {
      _db = await initDb();
      return _db;
    } else {
      return _db;
    }
  }

  Future<Database> initDb() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, "itenss.db");

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int newerVersion) async {
      await db.execute(
          '''CREATE TABLE $itemTable($idColumn INTEGER PRIMARY KEY AUTOINCREMENT, $nameColumn TEXT NOT NULL, $quantColumn TEXT, $valorColumn TEXT);''');
    });
  }

  Future<Item> saveItem(var item) async {
    Database dbItem = await db;
    item.id = await dbItem.insert(itemTable, item.toMap());
    return item;
  }

  Future<Item?> getItem(int id) async {
    Database dbItem = await db;
    List<Map> maps = await dbItem.query(
      itemTable,
      columns: [idColumn, nameColumn, quantColumn, valorColumn],
      where: "$idColumn = ?",
      whereArgs: [id],
    );
    if (maps.length > 0) {
      return Item.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<int> deleteItem(int id) async {
    Database dbItem = await db;
    return await dbItem
        .delete(itemTable, where: "$idColumn = ?", whereArgs: [id]);
  }

  Future<int> updateItem(Item item) async {
    Database dbItem = await db;
    return await dbItem.update(
      itemTable,
      item.toMap(),
      where: "$idColumn = ?",
      whereArgs: [item.id],
    );
  }

  Future<List> getAllItem() async {
    Database dbItem = await db;
    List listMap = await dbItem.rawQuery("SELECT * FROM $itemTable");
    List<Item> listItem = [];
    for (Map m in listMap) {
      listItem.add(Item.fromMap(m));
    }
    return listItem;
  }

  Future<int?> getNumber() async {
    Database dbItem = await db;
    return Sqflite.firstIntValue(
        await dbItem.rawQuery("SELECT COUNT(*) FROM $itemTable"));
  }

  Future<void> close() async {
    Database dbItem = await _instance.db;
    dbItem.close();
  }
}


/*
class DB {
  // contrutor com acesso privado
  DB._();
  //criar uma instancia de DB
  static final DB instance = DB._();
  //instaNce do SQLite
  static Database? _database;

  get database async {
    if (_database != null) {
      return _database;
    } else {
      return await _initDatabase();
    }
  }

  _initDatabase() async {
    Directory directory = (await getDatabasesPath()) as Directory;
    return await openDatabase(
      join(await getDatabasesPath(), 'lista.db'),
      version: 1,
      onCreate: _onCreate,
    );
  }

  _onCreate(db, versao) async {
    await db.execute(_lista);
    await db.insert('lista', {'saldo': 0});
  }

  String get _lista => '''
  CREATE TABLE historico (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    saldo REAL
    item TEXT,
    quantidade TEXT,
    valor TEXT
  )
  ''';
}*/
