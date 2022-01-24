import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/banco_de_dados/repo.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<Null> _refresh() async {
    await Future.delayed(Duration(seconds: 1));

    setState(() {
      /* _Tarefas.sort((a, b) {
        if (a["ok"] && !b["ok"])
          return 1;
        else if (!a["ok"] && b["ok"])
          return -1;
        else
          return 0;
      });*/
    });

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Home();
  }
}
