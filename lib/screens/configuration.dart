// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tarea3_5/models/theme.dart';
import 'package:permission_handler/permission_handler.dart';

class ConfiguracionScreen extends StatelessWidget {
  Future<void> _requestStoragePermission(BuildContext context) async {
    PermissionStatus status = await Permission.storage.request();
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    if (status.isGranted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Permiso de almacenamiento concedido'),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Permiso de almacenamiento denegado'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeModel = Provider.of<ThemeModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuración'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Configuración de Temas',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  themeModel.setTheme(originalTheme);
                },
                style: ElevatedButton.styleFrom(
                  primary: originalTheme.primaryColor,
                ),
                child: const Text('Tema Original'),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  themeModel.setTheme(lightTheme);
                },
                style: ElevatedButton.styleFrom(
                  primary: lightTheme.primaryColor,
                ),
                child: const Text('Tema Claro'),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Permisos de la Aplicación',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () => _requestStoragePermission(context),
                child: const Text('Solicitar Permiso de Almacenamiento'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
