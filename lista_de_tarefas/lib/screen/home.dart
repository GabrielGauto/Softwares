import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _seleciona = false;
  final _ItemController = TextEditingController();
  final _TarefaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            title: Text(
              "Tarefas e Compras",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            backgroundColor: Colors.transparent,
            centerTitle: true,
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.list,
                    color: Colors.black,
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
          body: TabBarView(
            children: [
/////////////////////////////////// Tarefas ////////////////////////////////////
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    end: Alignment.topCenter,
                    begin: Alignment.bottomCenter,
                    colors: [
                      Color(0xff96ffda),
                      Color(0xff96e8ff),
                    ],
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                        top: 120.0,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(17.0, 1.0, 7.0, 1.0),
                      decoration: BoxDecoration(),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: TextField(
                              controller: _TarefaController,
                              decoration: InputDecoration(
                                labelText: "Nova Tarefa",
                                labelStyle: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              _adicionaTarefa();
                            },
                            icon: Icon(
                              Icons.add,
                              color: Colors.black,
                              size: 30.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    /*Expanded(
                     child: RefreshIndicator(
                    onRefresh: _refresh,
                    child: ListView.builder(
                    padding: EdgeInsets.only(top: 10.0),
                    itemCount: _Tarefas.length,
                    itemBuilder: buildTarefa),
                    ),
                    )*/
                  ],
                ),
              ),
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////// compras /////////////////////////////////////
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    end: Alignment.topCenter,
                    begin: Alignment.bottomCenter,
                    colors: [
                      Color(0xff96ffda),
                      Color(0xff96e8ff),
                    ],
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                        top: 120.0,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(17.0, 1.0, 7.0, 1.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: TextField(
                              controller: _ItemController,
                              decoration: InputDecoration(
                                labelText: "Novo item",
                                labelStyle: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              _seleciona = true;
                              _adicionaItem();
                            },
                            icon: Icon(
                              Icons.add_shopping_cart_rounded,
                              color: Colors.black,
                              size: 30.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    /*Expanded(
                      child: RefreshIndicator(
                        onRefresh: _refresh,
                        child: ListView.builder(
                            padding: EdgeInsets.only(top: 10.0),
                            itemCount: _Itens.length,
                            itemBuilder: buildTarefa),
                      ),
                    )*/
                  ],
                ),
              ),
////////////////////////////////////////////////////////////////////////////////
            ],
          )),
    );
  }

  void _adicionaTarefa() {
    setState(() {
      _TarefaController.text = "";
    });
  }

  void _adicionaItem() {
    setState(() {});
  }
}
