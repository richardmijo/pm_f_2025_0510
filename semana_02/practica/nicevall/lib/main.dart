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
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MiTarjetaHomePage(),
    );
  }
}

class MiTarjetaHomePage extends StatelessWidget {
  const MiTarjetaHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Freeze APP",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.indigo,
        leading: const Icon(Icons.ac_unit),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'Contactos') {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Contactos'),
                      content: const Text(
                        'Lista de contactos será mostrada aquí.',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Cerrar'),
                        ),
                      ],
                    );
                  },
                );
              } else if (value == 'Mensaje') {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Función de mensajería seleccionada'),
                    duration: Duration(seconds: 2),
                  ),
                );
              }
            },
            itemBuilder: (BuildContext context) {
              return {'Contactos', 'Mensaje'}.map((String choice) {
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
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Botón de acción rápida presionado'),
              duration: Duration(seconds: 2),
            ),
          );
        },
        backgroundColor: Colors.indigo,
        child: const Icon(Icons.add),
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
                'https://www.facebook.com/plantsvszombiszombatar/?locale=id_ID',
              ),
            ),
            const SizedBox(height: 10), // Espacio entre la imagen y el texto
            const Text(
              'Nicolas Cevallos', // Nombre
              style: TextStyle(
                fontFamily: 'Pacifico', // Fuente personalizada (opcional)
                fontSize: 32, // Tamaño grande
                color: Colors.white, // Color blanco
                fontWeight: FontWeight.bold, // Negrita
              ),
            ),
            const Text(
              'Ing TICs', // Descripción
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
              color: Colors.white70,
            ),
            // Tarjeta con ícono de teléfono y número
            const Card(
              margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: ListTile(
                leading: Icon(Icons.phone, color: Colors.teal),
                title: Text('0967632984'),
              ),
            ),
            // Tarjeta con ícono de email y correo
            const Card(
              margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: ListTile(
                leading: Icon(Icons.email, color: Colors.teal),
                title: Text('nicevall@uide.edu.ec'),
              ),
            ),

            ElevatedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Botón presionado'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              icon: const Icon(Icons.thumb_up),
              label: const Text('Me gusta'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
              ),
            ),

            const SizedBox(height: 10),

            const Card(
              margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.location_on, color: Colors.indigo),
                    SizedBox(width: 10),
                    Text('Quito, Ecuador'),
                  ],
                ),
              ),
            ),

            GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Icono presionado'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              child: const Icon(Icons.favorite, color: Colors.red, size: 40),
            ),
          ],
        ),
      ),
    );
  }
}
