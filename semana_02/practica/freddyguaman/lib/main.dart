import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Perfil Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Perfil de Freddy Guaman'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _selectedOption = 'Opción 1';

  void _handleMenuSelection(String value) {
    setState(() {
      _selectedOption = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(widget.title),
        actions: [
          PopupMenuButton<String>(
            onSelected: _handleMenuSelection,
            itemBuilder: (BuildContext context) {
              return {'Opción 1', 'Opción 2', 'Opción 3'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(Icons.account_circle, size: 100, color: Colors.blueAccent),
            const Text(
              'Freddy Guaman',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text('Ingeniero en Sistemas'),
            const Text('Correo: freddy.guaman@email.com'),
            const Text('Teléfono: +593 987654321'),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("ElevatedButton presionado")),
                );
              },
              child: const Text("Presióname"),
            ),
            const SizedBox(height: 20),

            Card(
              margin: const EdgeInsets.all(10),
              color: Colors.lightBlue.shade50,
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('Este es un card adicional con información extra.'),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: null,
    );
  }
}
