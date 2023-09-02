import 'package:flutter/material.dart';

void main() {
  runApp(TipTimeApp());
}

class TipTimeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 32, 112, 12)),
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          // Color del fondo del AppBar
          backgroundColor: Theme.of(context).primaryColor,
        ),
      ),
      home: TipCalculator(),
    );
  }
}

class TipCalculator extends StatefulWidget {
  @override
  _TipCalculatorState createState() => _TipCalculatorState();
}

class _TipCalculatorState extends State<TipCalculator> {
  double billAmount = 0.0;
  bool roundTotal = false;
  double tipPercentage = 0.15;
  double totalAmount = 0.0;

  void calculateTip() {
    if (billAmount <= 0.0) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Warning'),
            content: Text(
                'Bill amount must be greater than zero! Please try again.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      setState(() {
        totalAmount = billAmount * (1 + tipPercentage);
        if (roundTotal) {
          totalAmount = totalAmount.roundToDouble();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tip Time',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(Icons.attach_money),
                  SizedBox(width: 10.0),
                  Container(
                    width: 200.0,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Cost of Bill',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        setState(() {
                          billAmount = double.tryParse(value) ?? 0.0;
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Row(
                children: <Widget>[
                  Icon(Icons.quiz_rounded),
                  SizedBox(width: 10.0),
                  Text('How was the service?'),
                ],
              ),
              Column(
                children: <Widget>[
                  RadioListTile(
                    value: 0.20,
                    groupValue: tipPercentage,
                    onChanged: (value) {
                      setState(() {
                        tipPercentage = value!;
                      });
                    },
                    title: Text('Amazing (20%)'),
                  ),
                  RadioListTile(
                    value: 0.18,
                    groupValue: tipPercentage,
                    onChanged: (value) {
                      setState(() {
                        tipPercentage = value!;
                      });
                    },
                    title: Text('Good (18%)'),
                  ),
                  RadioListTile(
                    value: 0.15,
                    groupValue: tipPercentage,
                    onChanged: (value) {
                      setState(() {
                        tipPercentage = value!;
                      });
                    },
                    title: Text('Okay (15%)'),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Row(
                children: <Widget>[
                  Icon(Icons.toll_rounded),
                  SizedBox(width: 10.0),
                  Text('Round Up Tip?'),
                  Switch(
                    value: roundTotal,
                    onChanged: (value) {
                      setState(() {
                        roundTotal = value;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: calculateTip,
                  child: Text('Calculate Tip'),
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                alignment: Alignment.centerRight,
                child: Text(
                  'Tip Amount: \$${totalAmount.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
