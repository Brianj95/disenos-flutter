import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

import 'package:disenos/src/pages/charts_page.dart';
import 'package:disenos/src/pages/basico_page.dart';
import 'package:disenos/src/pages/scroll_page.dart';
import 'package:disenos/src/pages/botones_page.dart';
import 'package:disenos/src/pages/mario_page.dart';
import 'package:disenos/src/pages/gradientes_page.dart';
import 'package:disenos/src/pages/doble_page.dart';
import 'package:disenos/src/pages/doble2_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.black
    ));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños',
      initialRoute: 'doble',

      routes: {
        'basico'      : (BuildContext context) => BasicoPage(),
        'scroll'      : (BuildContext context) => ScrollPage(),
        'botones'     : (BuildContext context) => BotonesPage(),
        'mario'       : (BuildContext context) => MarioPage(),
        'gradientes'  : (BuildContext context) => GradientesPage(),
        'charts'      : (BuildContext context) => ChartsPage(),
        'doble'       : (BuildContext context) => DoblePage(),
        'doble2'      : (BuildContext context) => Doble2Page(),
      },
    );
  }
}