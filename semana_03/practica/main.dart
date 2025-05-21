import 'package:flutter/material.dart';
import 'package:flutter_counter2/presentation/screens/counter/counter_functions_screen.dart';
//import 'package:flutter_counter2/presentation/screens/counter/counter_screen.dart';

void main() {
  // print("Hola");
  runApp(MyApp());
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
