import 'dart:async';
import 'dart:math';
import 'package:field/src/utils/providers.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinning_wheel/flutter_spinning_wheel.dart';


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final StreamController _dividerController = StreamController<int>();
  bool isDialog = false;
  double _generateRandomAngle() => Random().nextDouble() * pi * 2;
  @override
  void dispose() {
    _dividerController.close();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final providerInfo = Provider.of<ProviderInfo>(context);

    return Scaffold(
        appBar: AppBar(backgroundColor: Color(0xFF45DDDD), elevation: 0.0),
        backgroundColor: Color(0xffDDC3FF),
        body: Container(
          width: screenWidth,
          child: Stack(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  setState(() {
                    isDialog = true;
                  });
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SpinningWheel(
                      context,
                      Image.asset('assets/ruleta.png'),
                      width: 390,
                      height: 390,
                      initialSpinAngle: _generateRandomAngle(),
                      spinResistance: 0.6,
                      canInteractWhileSpinning: false,
                      dividers: 8,
                      onUpdate: _dividerController.add,
                      onEnd: _dividerController.add,
                      secondaryImage:
                          Image.asset('assets/roulette-center-300.png'),
                      secondaryImageHeight: 110,
                      secondaryImageWidth: 110,
                    ),
                    StreamBuilder(
                        stream: _dividerController.stream,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return RouletteScore(snapshot.data);
                          } else
                            return Container();
                        })
                  ],
                ),
              ),
              //SideBar(),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: providerInfo.escalones ? transparentWidget(context) : Container(),
                ),
              ),
            ],
          ),
        ));
  }

  Widget transparentWidget(BuildContext context) {
    return Container(
      color: Colors.transparent,
      width: double.infinity,
      height: double.infinity,
      child: Align(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  decoration: new BoxDecoration(
                      color: Colors.white,
                      borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(15.0),
                        topRight: const Radius.circular(15.0),
                        bottomLeft: const Radius.circular(15.0),
                        bottomRight: const Radius.circular(15.0),
                      )),

                  //ACA DEBERIA MI CODIGO
                  child: Padding(
                    padding: const EdgeInsets.only(left: 0.0, top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[],
                    ),
                  ),

                  height: 360,
                  width: 320,
                ),
              ],
            ),
          )),
    );
  }
}

class RouletteScore extends StatefulWidget {
  final int selected;
  RouletteScore(this.selected);

  @override
  _RoulesScoreState createState() => _RoulesScoreState();
}

class _RoulesScoreState extends State<RouletteScore> {
  final Map<int, String> labels = {
    1: "Carrito de Compra",
    2: "Tarjeta de 500 soles",
    3: "Sigue intentando",
    4: "Six Pack de Productos",
    5: "Carrito de Compra",
    6: "Tarjeta de 500 soles",
    7: "Sigue intentando",
    8: "Six Pack de Productos",
  };

  @override
  Widget build(BuildContext context) {
    return Text('${labels[widget.selected]}',
        style: TextStyle(fontStyle: FontStyle.italic, fontSize: 24.0));
  }
}
