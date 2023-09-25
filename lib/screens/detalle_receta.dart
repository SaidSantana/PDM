import 'package:flutter/material.dart';
import 'package:tarea3_5/widgets/receta_item.dart';
import 'package:provider/provider.dart';
import 'package:tarea3_5/models/favoritos.dart';

class DetalleReceta extends StatelessWidget {
  final RecetaItem receta;

  DetalleReceta({required this.receta});

  @override
  Widget build(BuildContext context) {
    var favoritosModel = Provider.of<FavoritosModel>(context);
    bool esFavorita = favoritosModel.esFavorita(receta.nombre);

    return Scaffold(
      appBar: AppBar(
        title: Text(receta.nombre),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              esFavorita ? Icons.star : Icons.star_border,
            ),
            onPressed: () {
              ScaffoldMessenger.of(context)
                  .removeCurrentSnackBar(); // Remueve el SnackBar actual

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    esFavorita
                        ? 'Receta removida de favoritos'
                        : 'Receta añadida a favoritos',
                  ),
                  backgroundColor: esFavorita ? Colors.red : Colors.green,
                ),
              );
              favoritosModel.toggleFavorito(receta.nombre);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  receta.imagen,
                  height: 200.0,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10.0),
              const Text(
                'Ingredientes:',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 15.0),
              for (var ingrediente in receta.ingredientes)
                Column(
                  children: [
                    Text(
                      ingrediente,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8.0), // Espacio entre ingredientes
                  ],
                ),
              const SizedBox(height: 10.0),
              const Text(
                'Pasos:',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 15.0),
              for (var paso in receta.pasos)
                Column(
                  children: [
                    Text(
                      paso,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 15.0), // Espacio entre pasos
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
