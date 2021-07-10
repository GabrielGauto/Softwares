import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text("Biblioteca central"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: RadialGradient(colors: [
            Colors.black,
            Colors.blue,
            Colors.white,
          ], radius: 5.0),
        ),
        child: Center(
          child: CircularPercentIndicator(
            radius: 200.0,
            percent: 0.4,
            lineWidth: 10.0,
            backgroundWidth: 2.0,
            progressColor: Colors.green,
            circularStrokeCap: CircularStrokeCap.round,
            footer: Text(
              "Pessoas",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
            center: Text(
              "25",
              style: TextStyle(
                color: Colors.white,
                fontSize: 40.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
