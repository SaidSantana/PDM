import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'App Iteso',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _likes = 0;
  int _dislikes = 0;

  void _incrementLikes() {
    setState(() {
      _likes++;
    });
  }

  void _incrementDislikes() {
    setState(() {
      _dislikes++;
    });
  }

  Widget _buildIconColumn(IconData icon, String label, Function onPressed) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 15),
          child: ColorChangingIconButton(
            icon: icon,
            iconSize: 48,
            onPressed: onPressed,
          ),
        ),
        SizedBox(height: 4),
        Text(label, textAlign: TextAlign.center),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Iteso'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image.network(
                "https://cruce.iteso.mx/wp-content/uploads/sites/123/2018/04/Portada-2-e1525031912445.jpg",
              ),
              ListTile(
                title: Text(
                  "El ITESO, Universidad Jesuita de Guadalajara",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "San Pedro Tlaquepaque, Jal",
                  style: TextStyle(fontWeight: FontWeight.w200),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.thumb_up),
                      iconSize: 20,
                      onPressed: _incrementLikes,
                    ),
                    Text(' $_likes  '),
                    IconButton(
                      icon: Icon(Icons.thumb_down),
                      iconSize: 20,
                      onPressed: _incrementDislikes,
                    ),
                    Text('$_dislikes'),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildIconColumn(
                    Icons.restaurant,
                    "Comida",
                    () => _showCustomSnackbar(context, "Comida",
                        "Puedes encontrar comida en sus cafeterías"),
                  ),
                  _buildIconColumn(
                    Icons.info,
                    "Info",
                    () => _showCustomSnackbar(context, "Info",
                        "Puedes pedir información en rectoría"),
                  ),
                  _buildIconColumn(
                    Icons.location_on,
                    "Ubicación",
                    () => _showCustomSnackbar(context, "Ubicación",
                        "Se encuentra ubicado en Periférico Sur 8585"),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildIconColumn(
                    Icons.mail,
                    "Correo",
                    () => _showCustomSnackbar(context, "Correo",
                        "Puedes enviar un correo a iteso@iteso.mx"),
                  ),
                  _buildIconColumn(
                    Icons.phone_in_talk_rounded,
                    "Llamada",
                    () => _showCustomSnackbar(
                        context, "Llamada", "Puedes llamar al 33 3669 3434"),
                  ),
                  _buildIconColumn(
                    Icons.directions,
                    "Ruta",
                    () => _showCustomSnackbar(context, "Ruta",
                        "Link Google Maps para llegar al ITESO: https://goo.gl/maps/4d3e4h2h2"),
                  ),
                ],
              ),
              SizedBox(
                height: 64,
              ),
              Text(
                '''El ITESO, Universidad Jesuita de Guadalajara (Instituto Tecnológico y de Estudios Superiores de Occidente) es una universidad privada ubicada en la Zona Metropolitana de Guadalajara, Jalisco, México, fundada en el año 1957.

La institución forma parte del Sistema Universitario Jesuita (SUJ) que integra a ocho universidades en México. La universidad es nombrada como la Universidad Jesuita de Guadalajara''',
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showCustomSnackbar(BuildContext context, String action, String info) {
    final snackbar = SnackBar(content: Text(' $info'));
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}

class ColorChangingIconButton extends StatefulWidget {
  final IconData icon;
  final double iconSize;
  final Function onPressed;

  const ColorChangingIconButton({
    Key? key,
    required this.icon,
    required this.iconSize,
    required this.onPressed,
  }) : super(key: key);

  @override
  _ColorChangingIconButtonState createState() =>
      _ColorChangingIconButtonState();
}

class _ColorChangingIconButtonState extends State<ColorChangingIconButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        ScaffoldMessenger.of(context)
            .hideCurrentSnackBar(); // Oculta el Snackbar actual

        setState(() {
          _isPressed = !_isPressed;
        });

        if (_isPressed) {
          widget.onPressed();
        }
      },
      icon: Icon(
        widget.icon,
        size: widget.iconSize,
        color: _isPressed ? Colors.indigo : Colors.black,
      ),
    );
  }
}
