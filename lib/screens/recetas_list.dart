import 'package:flutter/material.dart';
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
      ),
      body: ListView.builder(
        itemCount: recetas.length,
        itemBuilder: (context, index) => recetas[index],
      ),
    );
  }
}
