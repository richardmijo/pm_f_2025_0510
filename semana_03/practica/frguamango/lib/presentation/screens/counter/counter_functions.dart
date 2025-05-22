import 'package:flutter/material.dart';

class CounterFunctionsScreen extends StatefulWidget {
  const CounterFunctionsScreen({super.key});

  @override
  State<CounterFunctionsScreen> createState() => _CounterFunctionsScreenState();
}

class _CounterFunctionsScreenState extends State<CounterFunctionsScreen> {
  int clickCounter = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contador con funciones"),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                clickCounter = 0;
              });
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              '$clickCounter',
              style: const TextStyle(fontSize: 160, fontWeight: FontWeight.w300),
            ),
          ),
          Center(
            child: Text(
              clickCounter == 1 ? "Click" : "Clicks",
              style: const TextStyle(fontSize: 50, fontWeight: FontWeight.w100),
            ),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              setState(() {
                clickCounter++;
              });
            },
            child: const Icon(Icons.plus_one),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                if (clickCounter > 0) clickCounter--;
              });
            },
            child: const Icon(Icons.exposure_minus_1),
          ),
        ],
      ),
    );
  }
}
