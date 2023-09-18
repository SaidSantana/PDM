import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Pantalla2 extends StatefulWidget {
  final String datoIngresado;

  Pantalla2({required this.datoIngresado});

  @override
  _Pantalla2State createState() => _Pantalla2State();
}

class _Pantalla2State extends State<Pantalla2> {
  int numeroAleatorio = 0;

  void _generarNumeroAleatorio() {
    setState(() {
      numeroAleatorio =
          (1 + DateTime.now().millisecondsSinceEpoch % 100).toInt();
    });
  }

  void _guardarYRegresar() {
    String resultado =
        '${widget.datoIngresado}, Número Aleatorio: $numeroAleatorio';
    Navigator.pop(context, resultado);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pantalla 2'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.purple],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                widget.datoIngresado,
                style: GoogleFonts.sairaCondensed(
                  textStyle: TextStyle(fontSize: 30),
                  color: Color.fromARGB(255, 243, 2, 247),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Número Aleatorio: $numeroAleatorio',
                style: GoogleFonts.sairaCondensed(
                  textStyle: TextStyle(fontSize: 30),
                  color: Color.fromARGB(255, 2, 247, 149),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _generarNumeroAleatorio,
                child: Text('Generar Número Aleatorio'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _guardarYRegresar,
                child: Text('Guardar y Regresar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
