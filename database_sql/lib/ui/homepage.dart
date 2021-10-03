import 'dart:ffi';

import 'package:database_sql/BancoDeDados/DataBase.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ItemHelper helper = ItemHelper();

  List<Item> itens = [];

  @override
  void initState() {
    super.initState();
    /* Item c = Item();
    c.name = "sabão";
    c.quant = "2";
    c.valor = "10.00";

    helper.saveItem(c); */

    helper.getItem(0).then((value) {
      print(itens[0].quant);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
