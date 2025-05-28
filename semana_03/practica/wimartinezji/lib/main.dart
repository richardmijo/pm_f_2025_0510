import 'package:flutter/material.dart';
import 'package:wimartinezji/presentation/CounterFunctionsScreen.dart';

//import 'package:riarmijosme_c/presentation/screens/counter/counter_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.grey
      ),
      home: CounterFunctionsScreen(),
    );
  }
}