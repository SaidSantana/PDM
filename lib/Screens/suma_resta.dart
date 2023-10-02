import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_class/Providers/counter_provider.dart';

class SumaResta extends StatefulWidget {
  const SumaResta({super.key});

  @override
  State<SumaResta> createState() => _SumaRestaState();
}

class _SumaRestaState extends State<SumaResta> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Text(
            context.watch<CounterProvider>().counter.toString(),
            style: const TextStyle(fontSize: 40),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                context.read<CounterProvider>().increment();
              },
              child: Icon(Icons.add),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<CounterProvider>().decrement();
              },
              child: Icon(Icons.remove),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<CounterProvider>().reset();
              },
              child: Icon(Icons.refresh),
            ),
          ],
        ),
      ],
    );
  }
}
