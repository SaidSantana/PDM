import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tarea3_5/models/theme.dart';

class ConfiguracionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeModel = Provider.of<ThemeModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Configuración'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                themeModel.setTheme(originalTheme);
              },
              style: ElevatedButton.styleFrom(
                primary: originalTheme.primaryColor,
              ),
              child: Text('Tema Original'),
            ),
            SizedBox(height: 16),
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
      ),
    );
  }
}
