import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tarea_extra/screens/pantalla_2.dart';
import 'package:tarea_extra/screens/pantalla_3.dart';

class PantallaHome extends StatefulWidget {
  @override
  _PantallaHomeState createState() => _PantallaHomeState();
}

class _PantallaHomeState extends State<PantallaHome> {
  String userInput = "";
  String textoPantalla3 = "Ningún botón seleccionado";
  int numeroRandom = 0;

  void _mostrarDialogo() async {
    final datoIngresado = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Diálogo'),
          content: TextField(
            onChanged: (input) {
              setState(() {
                userInput = input;
              });
            },
            decoration: InputDecoration(
              hintText: 'Ingrese un dato',
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Aceptar'),
              onPressed: () {
                Navigator.of(context).pop(userInput);
              },
            ),
          ],
        );
      },
    );

    if (datoIngresado != null) {
      setState(() {
        userInput = datoIngresado;
      });

      final resultado = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Pantalla2(datoIngresado: datoIngresado),
        ),
      );

      if (resultado != null) {
        if (resultado.contains(", Número Aleatorio: ")) {
          final partes = resultado.split(", Número Aleatorio: ");
          final numeroRandom = int.tryParse(partes[1]) ?? 0;

          setState(() {
            textoPantalla3 = textoPantalla3;
            this.numeroRandom = numeroRandom;
          });
        } else {
          setState(() {
            textoPantalla3 = resultado;
          });
        }
      }
    }
  }

  void _abrirPantalla3() async {
    final resultado = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Pantalla3()),
    );

    if (resultado != null) {
      setState(() {
        textoPantalla3 = resultado;
      });
    }
  }

  void _actualizarNumeroRandom(int numero) {
    setState(() {
      numeroRandom = numero;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pantalla Home'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20),
            Text(
              'BIENVENIDOS',
              style: GoogleFonts.pacifico(
                textStyle: TextStyle(fontSize: 45),
                color: const Color.fromARGB(255, 128, 132, 138),
              ),
            ),
            SizedBox(height: 10),
            Image.asset('lib/assets/Dash_Dart_White.jpg'),
            SizedBox(height: 20),
            Text(
              'Seleccione la acción a realizar:',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 50),
                  child: ElevatedButton(
                    onPressed: _mostrarDialogo,
                    child: Text('Pantalla 2'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: ElevatedButton(
                    onPressed: _abrirPantalla3,
                    child: Text('Pantalla 3'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      'Pantalla 2 => "$userInput $numeroRandom"',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Pantalla 3 => "$textoPantalla3"',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
