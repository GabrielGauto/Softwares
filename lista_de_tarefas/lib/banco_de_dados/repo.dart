import 'package:flutter/cupertino.dart';
import 'package:lista_de_tarefas/banco_de_dados/db_provider.dart';
import 'package:lista_de_tarefas/model/model.dart';
import 'package:sqflite/sqflite.dart';

class TaskRepository extends ChangeNotifier {
  late Database db;
  List<ModelTarefa> _task = [];
  String _title = "nem fudendo";

  get title => _title;

  List<ModelTarefa> get task => _task;

  TaskRepository() {
    _initRepository();
  }
  _initRepository() async {
    await _getTitleTask();
  }

  _getTitleTask() async {
    db = await DBProvider.instance.database;
    List task = await db.query('tableTask');
    _title = task.first['title_task'];
    notifyListeners();
  }

  setTask(String value) async {
    db = await DBProvider.instance.database;
    db.update('tableTask', {
      'title_task': value,
    });
    _title = value;
    notifyListeners();
  }
}
