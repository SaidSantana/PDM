import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tarea3_5/models/theme.dart';
import 'package:permission_handler/permission_handler.dart';

class ConfiguracionScreen extends StatelessWidget {
  Future<void> _requestStoragePermission(BuildContext context) async {
    PermissionStatus status = await Permission.storage.request();
    if (status.isGranted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Permiso de almacenamiento concedido'),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
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
        title: Text('Configuración'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Configuración de Temas',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  themeModel.setTheme(originalTheme);
                },
                style: ElevatedButton.styleFrom(
                  primary: originalTheme.primaryColor,
                ),
                child: Text('Tema Original'),
              ),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  themeModel.setTheme(lightTheme);
                },
                style: ElevatedButton.styleFrom(
                  primary: lightTheme.primaryColor,
                ),
                child: Text('Tema Claro'),
              ),
            ],
          ),
          SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Permisos de la Aplicación',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: () => _requestStoragePermission(context),
                child: Text('Solicitar Permiso de Almacenamiento'),
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
