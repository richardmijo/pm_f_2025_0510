import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int clickCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              '$clickCounter',
              style: TextStyle(fontSize: 160, fontWeight: FontWeight.w300),
            ),
          ),
          Text(
            'Click${clickCounter == 1 ? '' : 's'}',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            clickCounter++;
          });
        },
        child: Icon(Icons.plus_one),
      ),
    );
  }
}
