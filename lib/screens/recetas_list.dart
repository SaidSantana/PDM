import 'package:flutter/material.dart';
import 'package:tarea3_5/screens/configuration.dart';
import 'package:tarea3_5/widgets/receta_item.dart';

class RecetasList extends StatelessWidget {
  final List<RecetaItem> recetas;

  RecetasList({required this.recetas});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quick & Easy'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ConfiguracionScreen()),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: recetas.length,
        itemBuilder: (context, index) => recetas[index],
      ),
    );
  }
}
