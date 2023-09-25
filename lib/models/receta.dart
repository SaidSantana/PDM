class Receta {
  final String nombre;
  final String imagen;
  final String tiempo;
  final String dificultad;
  final String costo;
  final List<String> ingredientes;
  final List<String> pasos;

  Receta({
    required this.nombre,
    required this.imagen,
    required this.tiempo,
    required this.dificultad,
    required this.costo,
    required this.ingredientes,
    required this.pasos,
  });
}
