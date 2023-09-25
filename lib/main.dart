import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tarea3_5/screens/recetas_list.dart';
import 'package:tarea3_5/widgets/receta_item.dart';
import 'package:tarea3_5/models/favoritos.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => FavoritosModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recetario',
      theme: ThemeData(
        primaryColor: Colors.brown[400],
        scaffoldBackgroundColor: const Color.fromARGB(255, 67, 47, 38),
        textTheme: const TextTheme(
          bodyText2: TextStyle(color: Color.fromARGB(255, 228, 217, 215)),
        ),
        appBarTheme: const AppBarTheme(
          color: Color.fromARGB(255, 21, 14, 12),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: RecetasList(
        recetas: [
          RecetaItem(
            nombre: 'Spaghetti con Albóndigas',
            imagen: 'lib/assets/receta1.jpg',
            tiempo: '30 min',
            dificultad: 'Fácil',
            costo: 'Barata',
            ingredientes: const [
              '- 200g de spaghetti',
              '- 150g de carne molida',
              '- 1 huevo',
              '- 50g de pan rallado',
              '- Salsa de tomate',
              '- Sal y pimienta al gusto',
            ],
            pasos: const [
              '1. Cocina los spaghetti en agua hirviendo con sal hasta que estén al dente.',
              '2. Mezcla la carne molida con el huevo y el pan rallado, forma albóndigas y cocínalas en una sartén hasta que estén doradas.',
              '3. Calienta la salsa de tomate y añade las albóndigas cocinadas.',
              '4. Sirve las albóndigas sobre los spaghetti y disfruta.',
            ],
          ),
          RecetaItem(
            nombre: 'Pollo con Papas al Horno',
            imagen: 'lib/assets/receta2.jpg',
            tiempo: '45 min',
            dificultad: 'Medio',
            costo: 'Barata',
            ingredientes: const [
              '- 4 piezas de muslos de pollo',
              '- 4 papas medianas',
              '- Aceite de oliva',
              '- Sal y pimienta al gusto',
              '- Pimentón dulce al gusto',
              '- Tomillo fresco',
            ],
            pasos: const [
              '1. Precalienta el horno a 200°C.',
              '2. Coloca las piezas de pollo en una bandeja para horno y añade sal, pimienta, pimentón dulce y tomillo al gusto.',
              '3. Pela y corta las papas en gajos, mézclalas con aceite de oliva, sal y pimienta al gusto, y colócalas alrededor del pollo en la bandeja.',
              '4. Hornea por 40-45 minutos o hasta que el pollo esté cocido y las papas estén doradas.',
            ],
          ),
          RecetaItem(
            nombre: 'Ensalada de Atún',
            imagen: 'lib/assets/receta3.jpg',
            tiempo: '15 min',
            dificultad: 'Fácil',
            costo: 'Barata',
            ingredientes: const [
              '- 2 latas de atún en agua',
              '- 1 lata de maíz dulce',
              '- 1 cebolla morada',
              '- 2 tomates',
              '- Aceite de oliva',
              '- Sal y pimienta al gusto',
            ],
            pasos: const [
              '1. Escurre las latas de atún y colócalas en un bol.',
              '2. Añade el maíz escurrido.',
              '3. Corta la cebolla morada y los tomates en trozos pequeños y agrégales al bol.',
              '4. Aliña la ensalada con aceite de oliva, sal y pimienta al gusto.',
            ],
          ),
          RecetaItem(
            nombre: 'Carne Asada con Papas Fritas',
            imagen: 'lib/assets/receta4.jpg',
            tiempo: '50 min',
            dificultad: 'Complicado',
            costo: 'Cara',
            ingredientes: const [
              '- 500g de carne para asar',
              '- 4 papas',
              '- Aceite vegetal',
              '- Sal y pimienta al gusto',
              '- Pimentón dulce al gusto',
              '- Ajo en polvo al gusto',
            ],
            pasos: const [
              '1. Sazona la carne con sal, pimienta, pimentón dulce y ajo en polvo al gusto.',
              '2. Cocina la carne en una parrilla caliente hasta el término de cocción deseado.',
              '3. Pela y corta las papas en tiras para hacer las papas fritas.',
              '4. Fríe las papas en aceite caliente hasta que estén doradas y crujientes.',
            ],
          ),
          RecetaItem(
            nombre: 'Bistec con Arroz',
            imagen: 'lib/assets/receta5.jpg',
            tiempo: '30 min',
            dificultad: 'Fácil',
            costo: 'Barata',
            ingredientes: const [
              '- 4 bistecs de res',
              '- 1 taza de arroz',
              '- 2 tazas de caldo de pollo',
              '- Aceite vegetal',
              '- Sal y pimienta al gusto',
            ],
            pasos: const [
              '1.Sazona los bistecs con sal y pimienta al gusto y cocínalos en una sartén caliente hasta el término de cocción deseado.',
              '2. En una olla, calienta un poco de aceite y agrega el arroz, mezcla por un minuto y luego añade el caldo de pollo caliente.',
              '3. Cocina el arroz a fuego medio hasta que esté tierno y haya absorbido todo el caldo.',
              '4. Sirve los bistecs sobre una porción de arroz.',
            ],
          ),
        ],
      ),
    );
  }
}
