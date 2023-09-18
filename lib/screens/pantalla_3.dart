import 'package:flutter/material.dart';

class Pantalla3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pantalla 3'),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.grey,
              onPrimary: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context, '😊');
            },
            child: Text('😊', style: TextStyle(fontSize: 24)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.black,
              onPrimary: Colors.grey,
            ),
            onPressed: () {
              Navigator.pop(context, '🚀');
            },
            child: Text('🚀', style: TextStyle(fontSize: 24)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.grey,
              onPrimary: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context, '🌍');
            },
            child: Text('🌍', style: TextStyle(fontSize: 24)),
          ),
        ],
      ),
    );
  }
}
