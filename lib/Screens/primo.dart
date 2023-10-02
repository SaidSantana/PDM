import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_class/Providers/counter_provider.dart';

class Primo extends StatelessWidget {
  const Primo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer<CounterProvider>(
        builder: (context, counterProvider, child) {
          int numero = counterProvider.counter;

          Color textColor = Colors.blue;

          if (counterProvider.esPrimo(numero)) {
            textColor = Colors.green;
          }

          return Text(
            'El número $numero es ${counterProvider.esPrimo(numero) ? "primo" : "no primo"}',
            style: TextStyle(color: textColor),
          );
        },
      ),
    );
  }
}
