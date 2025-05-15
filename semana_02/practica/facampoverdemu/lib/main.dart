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
          title: Text("appbar"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
        backgroundColor: Colors.teal, // Color de fondo de toda la pantalla
        body: Center(
          // Colocamos todo el contenido en el centro
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // Centra los widgets verticalmente
            children: <Widget>[
              // Widget para mostrar una imagen circular (avatar)
              const CircleAvatar(
                radius: 60, // Tamaño del círculo
                backgroundImage: NetworkImage(
                  'https://i.pravatar.cc/300', // Imagen aleatoria desde internet
                ),
              ),
              const SizedBox(height: 10), // Espacio entre la imagen y el texto
              const Text(
                'Richard Armijos', // Nombre
                style: TextStyle(
                  fontFamily: 'Pacifico', // Fuente personalizada (opcional)
                  fontSize: 32, // Tamaño grande
                  color: Color.fromARGB(255, 17, 8, 8), // Color blanco
                  fontWeight: FontWeight.bold, // Negrita
                ),
              ),
              const Text(
                'FLUTTER', // Descripción
                style: TextStyle(
                  fontSize: 18,
                  letterSpacing: 2.5, // Espaciado entre letras
                  color: Colors.white70,
                  fontWeight: FontWeight.w400,
                ),
              ),
              // Línea decorativa divisora
              const Divider(
                height: 20,
                thickness: 1,
                indent: 50,
                endIndent: 50,
                color: Color.fromARGB(77, 255, 70, 70),
              ),
              // Tarjeta con ícono de teléfono y número
              const Card(
                margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: ListTile(
                  leading: Icon(Icons.phone, color: Colors.teal),
                  title: Text('+593 999 999 999'),
                ),
              ),
              // Tarjeta con ícono de email y correo
              const Card(
                margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: ListTile(
                  leading: Icon(Icons.email, color: Colors.teal),
                  title: Text('richard@universidad.edu.ec'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}