import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Caldeira',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Simulador de caldeira'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _cor12 = const Color(0xff878686);
  final _cor25 = const Color(0xff877373);
  final _cor38 = const Color(0xff875f5f);
  final _cor50 = const Color(0xff874c4c);
  final _cor62 = const Color(0xff873737);
  final _cor75 = const Color(0xff872424);
  final _cor87 = const Color(0xff871212);
  final _cor100 = const Color(0xfff50505);

  var _cor_resistencia = const Color(0xff878686);

  final double _volume = 0.2;
  final double _pressao = 0.5;
  final double _temperatura = 0.5;
  final double _vazao = 0.6;
  final double _bombaDagua = 0.25;

  final double _capacidadeVolume = 1000.0;
  final double _capacidadePressao = 0.6;
  final double _capacidadeTemperatura = 200.0;
  final double _capacidadeVazao = 10.0;
  final double _capacidadeBomba = 50.0;

  @override
  Widget build(BuildContext context) {
    if (_temperatura <= 0.12) {
      _cor_resistencia = _cor12;
    } else if (_temperatura > 0.12 && _temperatura <= 0.25) {
      _cor_resistencia = _cor25;
    } else if (_temperatura > 0.25 && _temperatura <= 0.38) {
      _cor_resistencia = _cor38;
    } else if (_temperatura > 0.38 && _temperatura <= 0.50) {
      _cor_resistencia = _cor50;
    } else if (_temperatura > 0.50 && _temperatura <= 0.62) {
      _cor_resistencia = _cor62;
    } else if (_temperatura > 0.62 && _temperatura <= 0.75) {
      _cor_resistencia = _cor75;
    } else if (_temperatura > 0.75 && _temperatura <= 0.87) {
      _cor_resistencia = _cor87;
    } else {
      _cor_resistencia = _cor100;
    }
    return Scaffold(
        extendBodyBehindAppBar: true,
        //extendBody: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: const Text(
            "Simulador de caldeira",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25.0,
            ),
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Color(0xff212121),
                  Color(0xff616161),
                ]),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                border:
                                    Border.all(color: Colors.grey, width: 20),
                                borderRadius: BorderRadius.circular(200)),
                            height: 500,
                            width: 1000,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                                210.0, 10.0, 10.0, 10.0),
                            child: Container(
                              height: 480,
                              width: 580,
                              color: Colors.blue,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                                210.0, 10.0, 10.0, 10.0),
                            child: Container(
                              height: 480 * (1 - _volume),
                              width: 580,
                              color: const Color(0xff9fc4fc),
                            ),
                          ),
                          Container(
                            height: 500,
                            width: 1000,
                            color: Colors.transparent,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 280,
                                      ),
                                      child: Container(
                                        height: 20,
                                        width: 580,
                                        color: _cor_resistencia,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 20,
                                      ),
                                      child: Container(
                                        height: 20,
                                        width: 580,
                                        color: _cor_resistencia,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 20,
                                      ),
                                      child: Container(
                                        height: 20,
                                        width: 580,
                                        color: _cor_resistencia,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 20,
                                      ),
                                      child: Container(
                                        height: 20,
                                        width: 580,
                                        color: _cor_resistencia,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 20,
                                      ),
                                      child: Container(
                                        height: 20,
                                        width: 580,
                                        color: _cor_resistencia,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    top: 20.0,
                  ),
                ),
/////////////////////////////////////////////// INDICADORES ////////////////////////////////////////////////
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ////////////////////////////////// VOLUME ///////////////////////////////////
                    Padding(
                        padding: const EdgeInsets.only(
                          left: 0,
                        ),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        width: 5, color: Colors.grey),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  height: 200.0,
                                  width: 200.0,
                                  //color: Colors.indigo,
                                ),
                                Positioned(
                                  top: 25,
                                  right: 25,
                                  child: Container(
                                    height: 150.0,
                                    width: 150.0,
                                    child: CircularProgressIndicator(
                                      backgroundColor: const Color(0xffa4dcfc),
                                      color: const Color(0xff116696),
                                      strokeWidth: 15.0,
                                      value: _volume,
                                    ),
                                    color: Colors.transparent,
                                  ),
                                ),
                                Positioned(
                                  top: 80,
                                  left: 40,
                                  child: Container(
                                    height: 50,
                                    width: 120,
                                    color: Colors.transparent,
                                    child: Column(
                                      children: [
                                        Text(
                                          (_volume * _capacidadeVolume)
                                              .toStringAsPrecision(4),
                                          style: const TextStyle(
                                            fontSize: 20.0,
                                          ),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(
                                            top: 10.0,
                                          ),
                                        ),
                                        const Text(
                                          "Litros",
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.only(
                                top: 20,
                              ),
                            ),
                            const Text(
                              "Volume",
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )),
                    ///////////////////////////////////////////////////////////////////////////
                    //////////////////////////////////// PRESSÃO //////////////////////////////
                    Padding(
                        padding: const EdgeInsets.only(
                          left: 30,
                        ),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        width: 5, color: Colors.grey),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  height: 200.0,
                                  width: 200.0,
                                  //color: Colors.indigo,
                                ),
                                Positioned(
                                  top: 25,
                                  right: 25,
                                  child: Container(
                                    height: 150.0,
                                    width: 150.0,
                                    child: CircularProgressIndicator(
                                      backgroundColor: const Color(0xffa4dcfc),
                                      color: const Color(0xff116696),
                                      strokeWidth: 15.0,
                                      value: _pressao,
                                    ),
                                    color: Colors.transparent,
                                  ),
                                ),
                                Positioned(
                                  top: 80,
                                  left: 40,
                                  child: Container(
                                    height: 50,
                                    width: 120,
                                    color: Colors.transparent,
                                    child: Column(
                                      children: [
                                        Text(
                                          (_pressao * _capacidadePressao)
                                              .toStringAsPrecision(4),
                                          style: const TextStyle(
                                            fontSize: 20.0,
                                          ),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(
                                            top: 10.0,
                                          ),
                                        ),
                                        const Text(
                                          "Bar",
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.only(
                                top: 20,
                              ),
                            ),
                            const Text(
                              "Pressão",
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )),
                    ///////////////////////////////////////////////////////////////////////////
                    //////////////////////////////// TEMPERATURE //////////////////////////////
                    Padding(
                        padding: const EdgeInsets.only(
                          left: 30,
                        ),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        width: 5, color: Colors.grey),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  height: 200.0,
                                  width: 200.0,
                                  //color: Colors.indigo,
                                ),
                                Positioned(
                                  top: 25,
                                  right: 25,
                                  child: Container(
                                    height: 150.0,
                                    width: 150.0,
                                    child: CircularProgressIndicator(
                                      backgroundColor: const Color(0xffa4dcfc),
                                      color: const Color(0xff116696),
                                      strokeWidth: 15.0,
                                      value: _temperatura,
                                    ),
                                    color: Colors.transparent,
                                  ),
                                ),
                                Positioned(
                                  top: 80,
                                  left: 40,
                                  child: Container(
                                    height: 50,
                                    width: 120,
                                    color: Colors.transparent,
                                    child: Column(
                                      children: [
                                        Text(
                                          "${(_temperatura * _capacidadeTemperatura).toStringAsPrecision(4)}°",
                                          style: const TextStyle(
                                            fontSize: 20.0,
                                          ),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(
                                            top: 10.0,
                                          ),
                                        ),
                                        const Text(
                                          "Celsius",
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.only(
                                top: 20,
                              ),
                            ),
                            const Text(
                              "Temperatura",
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )),
                    ///////////////////////////////////////////////////////////////////////////
                    //////////////////////////////// VAZÃO ////////////////////////////////////
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 30,
                      ),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border:
                                      Border.all(width: 5, color: Colors.grey),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                height: 200.0,
                                width: 200.0,
                                //color: Colors.indigo,
                              ),
                              Positioned(
                                top: 25,
                                right: 25,
                                child: Container(
                                  height: 150.0,
                                  width: 150.0,
                                  child: CircularProgressIndicator(
                                    backgroundColor: const Color(0xffa4dcfc),
                                    color: const Color(0xff116696),
                                    strokeWidth: 15.0,
                                    value: _vazao,
                                  ),
                                  color: Colors.transparent,
                                ),
                              ),
                              Positioned(
                                top: 80,
                                left: 40,
                                child: Container(
                                  height: 50,
                                  width: 120,
                                  color: Colors.transparent,
                                  child: Column(
                                    children: [
                                      Text(
                                        (_vazao * _capacidadeVazao)
                                            .toStringAsPrecision(4),
                                        style: const TextStyle(
                                          fontSize: 20.0,
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(
                                          top: 10.0,
                                        ),
                                      ),
                                      const Text(
                                        "Litros/segundo",
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.only(
                              top: 20,
                            ),
                          ),
                          const Text(
                            "Vazão",
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ///////////////////////////////////////////////////////////////////////////
                    //////////////////////////////// B.D'ÁGUA /////////////////////////////////
                    Padding(
                        padding: const EdgeInsets.only(
                          left: 30,
                        ),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        width: 5, color: Colors.grey),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  height: 200.0,
                                  width: 200.0,
                                  //color: Colors.indigo,
                                ),
                                Positioned(
                                  top: 25,
                                  right: 25,
                                  child: Container(
                                    height: 150.0,
                                    width: 150.0,
                                    child: CircularProgressIndicator(
                                      backgroundColor: const Color(0xffa4dcfc),
                                      color: const Color(0xff116696),
                                      strokeWidth: 15.0,
                                      value: _bombaDagua,
                                    ),
                                    color: Colors.transparent,
                                  ),
                                ),
                                Positioned(
                                  top: 80,
                                  left: 40,
                                  child: Container(
                                    height: 50,
                                    width: 120,
                                    color: Colors.transparent,
                                    child: Column(
                                      children: [
                                        Text(
                                          (_bombaDagua * _capacidadeBomba)
                                              .toStringAsPrecision(4),
                                          style: const TextStyle(
                                            fontSize: 20.0,
                                          ),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(
                                            top: 10.0,
                                          ),
                                        ),
                                        const Text(
                                          "Litros/hora",
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.only(
                                top: 20,
                              ),
                            ),
                            const Text(
                              "Bomba d'água",
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )),
                    ///////////////////////////////////////////////////////////////////////////
                  ],
                )
/////////////////////////////////////////////////////////////////////////////////////////////////////////////
              ],
            ),
          ),
        ));
  }
}
