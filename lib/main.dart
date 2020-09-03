import 'package:field/src/utils/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/pages/home.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => ProviderInfo(),
          ),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Field',
            // color: Utils.colorgreen,
            initialRoute: 'Home',
            //MAPA DE RUTAS
            routes: {
              'Home': (BuildContext context) => MyHomePage(),
              /*    
              'Loading': (BuildContext context) => LoadingPage(),
            'Cuentas': (BuildContext context) => Cuentas(),
            'Acceso': (BuildContext context) => AccesoPage(),
            'RecuperarCuenta': (BuildContext context) => RecuperarCuenta(), */
            }));
  }
}
