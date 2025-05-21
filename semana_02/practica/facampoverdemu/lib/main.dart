// Importamos el paquete principal de Flutter
import 'package:flutter/material.dart';

// Función principal: punto de entrada de la app
void main() {
  runApp(const MiTarjetaApp()); // Ejecuta nuestra app personalizada
}

// Creamos una clase que extiende StatelessWidget, ya que no usaremos estado por ahora
class MiTarjetaApp extends StatelessWidget {
  const MiTarjetaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:
          false, // Oculta la etiqueta de "debug" en la esquina superior
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Mi Tarjeta Personal",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: const Color.fromARGB(255, 63, 149, 31),
          actions: [
            PopupMenuButton<String>(
              onSelected: (value) {
                // Aquí puedes manejar lo que pasa al seleccionar una opción
                print("Seleccionaste: $value");
              },
              itemBuilder: (BuildContext context) {
                return {'Perfil', 'Configuración', 'Cerrar sesión'}
                    .map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
        backgroundColor: const Color.fromARGB(255, 53, 106, 41), // Color de fondo de toda la pantalla
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Imagen circular (avatar)
              const CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
              ),
              const SizedBox(height: 10),
              const Text(
                'Fabian Campoverde',
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 32,
                  color: Color.fromARGB(255, 17, 8, 8),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Mini Ingeniero',
                style: TextStyle(
                  fontSize: 18,
                  letterSpacing: 2.5,
                  color: Colors.white70,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Divider(
                height: 20,
                thickness: 1,
                indent: 50,
                endIndent: 50,
                color: Color.fromARGB(77, 255, 70, 70),
              ),
              // Teléfono
              const Card(
                margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: ListTile(
                  leading: Icon(Icons.phone, color: Colors.teal),
                  title: Text('+593 964 099 885'),
                ),
              ),
              // Email
              const Card(
                margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: ListTile(
                  leading: Icon(Icons.email, color: Colors.teal),
                  title: Text('facampoverdemu@uide.edu.ec'),
                ),
              ),
              // Card adicional con ubicación
              const Card(
                margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: ListTile(
                  leading: Icon(Icons.location_on, color: Colors.teal),
                  title: Text('Ecuador'),
                ),
              ),
              // Línea decorativa con ícono en el centro
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Divider(
                        color: Colors.white70,
                        thickness: 1,
                        indent: 20,
                        endIndent: 10,
                      ),
                    ),
                    Icon(Icons.star, color: Colors.white),
                    Expanded(
                      child: Divider(
                        color: Colors.white70,
                        thickness: 1,
                        indent: 10,
                        endIndent: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
