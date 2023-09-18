import 'package:flutter/material.dart';
import 'screens/pantalla_home.dart';
import 'screens/pantalla_2.dart';
import 'screens/pantalla_3.dart';

class Routes {
  static final Map<String, WidgetBuilder> routes = {
    '/': (context) => PantallaHome(),
    '/pantalla2': (context) => Pantalla2(
          datoIngresado: '',
        ),
    '/pantalla3': (context) => Pantalla3(),
  };
}
