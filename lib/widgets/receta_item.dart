import 'package:flutter/material.dart';
import 'package:tarea3_5/screens/detalle_receta.dart';

class RecetaItem extends StatelessWidget {
  final String nombre;
  final String imagen;
  final String tiempo;
  final String dificultad;
  final String costo;
  final List<String> ingredientes;
  final List<String> pasos;

  RecetaItem({
    required this.nombre,
    required this.imagen,
    required this.tiempo,
    required this.dificultad,
    required this.costo,
    required this.ingredientes,
    required this.pasos,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetalleReceta(
              receta: this,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                imagen,
                height: 200.0,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: double.infinity,
              color: Colors.black.withOpacity(0.3),
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    nombre,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.access_time, color: Colors.white),
                      const SizedBox(width: 5.0),
                      Text(tiempo, style: TextStyle(color: Colors.white)),
                      const SizedBox(width: 10.0),
                      const Icon(Icons.star, color: Colors.white),
                      const SizedBox(width: 5.0),
                      Text(dificultad, style: TextStyle(color: Colors.white)),
                      const SizedBox(width: 10.0),
                      const Icon(Icons.attach_money, color: Colors.white),
                      const SizedBox(width: 5.0),
                      Text(costo, style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
