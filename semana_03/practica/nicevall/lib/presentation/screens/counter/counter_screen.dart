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
          Center(
            child: Text(
              getClickText(clickCounter), // Aquí usas la función
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          clickCounter++;
          setState(() {});
        },
        child: Icon(Icons.plus_one),
      ), //FloatingActionButton
    );
  }
}

String getClickText(int clickCounter) {
  return clickCounter <= 1 ? "click" : "clicks";
}
