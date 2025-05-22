import 'package:flutter/material.dart';
import 'package:majimenezgao/presentation/screens/counter/counter_functions_screen.dart';
//import 'package:majimenezgao/presentation/screens/counter/counter_screen.dart';

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
        colorSchemeSeed: const Color.fromARGB(255, 118, 243, 201)
      ),
      home: CounterFunctionsScreen(),
    );
  }
}