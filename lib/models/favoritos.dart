import 'package:flutter/foundation.dart';

class FavoritosModel with ChangeNotifier {
  List<String> _favoritos = [];

  bool esFavorita(String nombre) {
    return _favoritos.contains(nombre);
  }

  void toggleFavorito(String nombre) {
    if (_favoritos.contains(nombre)) {
      _favoritos.remove(nombre);
    } else {
      _favoritos.add(nombre);
    }
    notifyListeners();
  }
}
