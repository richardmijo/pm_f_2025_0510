import 'package:flutter/material.dart';

void main() {
  runApp(const MiTarjetaApp());
}

class MiTarjetaApp extends StatelessWidget {
  const MiTarjetaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cristina Lisbeth Orellana Esparza',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
        backgroundColor: const Color.fromARGB(
          255,
          200,
          191,
          202,
        ), // Fondo diferente
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              // Imprime en consola la opción seleccionada
              print('Seleccionaste: $value');

              // Muestra un diálogo cuando se selecciona la opción "Información"
              if (value == 'info') {
                showDialog(
                  context: context,
                  builder:
                      (context) => AlertDialog(
                        title: const Text('Información'),
                        content: const Text(
                          'Esta es una aplicación de ejemplo para la actividad.',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Cerrar'),
                          ),
                        ],
                      ),
                );
              }

              // Muestra un Snackbar cuando se selecciona la opción "Configuración"
              if (value == 'settings') {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Configuración seleccionada'),
                    duration: Duration(seconds: 2),
                  ),
                );
              }
            },
            itemBuilder:
                (context) => [
                  const PopupMenuItem<String>(
                    value: 'info',
                    child: Text('Información'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'settings',
                    child: Text('Configuración'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'logout',
                    child: Text('Cerrar sesión'),
                  ),
                ],
            icon: const Icon(Icons.menu),
          ),
          // Logo personalizado en el AppBar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 16,
              child: Icon(Icons.person, color: Colors.purple, size: 20),
            ),
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(
        255,
        230,
        225,
        236,
      ), // Color lila claro
      // Widget nuevo 1: ElevatedButton
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text('Agregar'),
        icon: const Icon(Icons.add),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
            ),
            const SizedBox(height: 10),
            const Text(
              'Cristina Orellana',
              style: TextStyle(
                fontFamily: 'Pacifico',
                fontSize: 32,
                color: Color.fromARGB(255, 17, 8, 8),
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'ESTUDIANTE',
              style: TextStyle(
                fontSize: 18,
                letterSpacing: 2.5,
                color: Colors.white70,
                fontWeight: FontWeight.w400,
              ),
            ),
            // Widget nuevo 2: Divider
            const Divider(
              height: 20,
              thickness: 1,
              indent: 50,
              endIndent: 50,
              color: Color.fromARGB(77, 255, 70, 70),
            ),
            const Card(
              margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: ListTile(
                leading: Icon(Icons.phone, color: Colors.teal),
                title: Text('0979559304'),
              ),
            ),
            const Card(
              margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: ListTile(
                leading: Icon(Icons.email, color: Colors.teal),
                title: Text('crorellanaes@uide.edu.ec'),
              ),
            ),
            // Widget nuevo 3: Card extra
            const Card(
              margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: ListTile(
                leading: Icon(Icons.school, color: Colors.teal),
                title: Text('Universidad UIDE'),
              ),
            ),
            // Widget nuevo 4: Icon widget
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star, color: Colors.yellow, size: 30),
                  SizedBox(width: 10),
                  Icon(Icons.star, color: Colors.yellow, size: 30),
                  SizedBox(width: 10),
                  Icon(Icons.star, color: Colors.yellow, size: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
