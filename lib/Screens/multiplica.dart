import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_class/Providers/counter_provider.dart';

class Multiplica extends StatefulWidget {
  const Multiplica({super.key});

  @override
  State<Multiplica> createState() => _MultiplicaState();
}

class _MultiplicaState extends State<Multiplica> {
  String snackBarMessage = '';

  void showSnackBar(String message) {
    setState(() {
      snackBarMessage = message;
    });
    ScaffoldMessenger.of(context)
        .hideCurrentSnackBar(); // Cierra el SnackBar actual
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          context.watch<CounterProvider>().counter.toString(),
          style: const TextStyle(fontSize: 40),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              onPressed: () {
                context.read<CounterProvider>().multiDos();
                showSnackBar('Multiplicado por 2');
              },
              child: const Text('X2'),
            ),
            SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {
                context.read<CounterProvider>().multiTres();
                showSnackBar('Multiplicado por 3');
              },
              child: const Text('X3'),
            ),
            SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {
                context.read<CounterProvider>().multiCinco();
                showSnackBar('Multiplicado por 5');
              },
              child: const Text('X5'),
            ),
          ],
        ),
      ],
    );
  }
}
