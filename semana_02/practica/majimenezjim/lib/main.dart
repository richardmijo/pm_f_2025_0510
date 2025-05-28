// Importamos los paquetes necesarios de Flutter
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
      debugShowCheckedModeBanner: false, // Oculta la etiqueta de "debug" en la esquina superior
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MiPaginaPrincipal(),
    );
  }
}

class MiPaginaPrincipal extends StatelessWidget {
  const MiPaginaPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar personalizado (requisito 3)
      appBar: AppBar(
        title: const Text("Mi Perfil", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: const Color.fromARGB(255, 106, 170, 200), // Color de fondo diferente
        elevation: 8,
        leading: IconButton(
          icon: const Icon(Icons.person_outline),
          onPressed: () {},
        ),
        actions: [
          // PopupMenuButton con al menos 2 opciones (requisito 3.3)
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert),
            onSelected: (value) {
              // Imprime en consola según requisito
              if (value == 'opcion1') {
                print('Seleccionaste la opción 1');
              } else if (value == 'opcion2') {
                print('Seleccionaste la opción 2');
              } else if (value == 'mostrar_alerta') {
                // Extra: Mostrar alerta (showDialog)
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Alerta'),
                    content: const Text('¡Esta es una alerta personalizada!'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Cerrar'),
                      ),
                    ],
                  ),
                );
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'opcion1',
                child: Text('Editar perfil'),
              ),
              const PopupMenuItem(
                value: 'opcion2',
                child: Text('Configuración'),
              ),
              const PopupMenuItem(
                value: 'mostrar_alerta',
                child: Text('Mostrar alerta'),
              ),
            ],
          ),
        ],
      ),
      // Widget 1 adicional: FloatingActionButton personalizado (con ElevatedButton)
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('¡Acción completada!'),
              duration: Duration(seconds: 2),
            ),
          );
        },
        label: const Text('Contactar'),
        icon: const Icon(Icons.chat),
        backgroundColor: Colors.deepPurple,
      ),
      backgroundColor: Colors.blueGrey[100], // Color de fondo cambiado
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 20),
              // Widget 2 adicional: Card con efecto de elevación
              Card(
                elevation: 10,
                margin: const EdgeInsets.all(15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      // Imagen de perfil modificada
                      const CircleAvatar(
                        radius: 60,
                        backgroundImage: NetworkImage(
                          'https://i.pravatar.cc/300?img=12', // Imagen de avatar (cambiada)
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Información personal modificada (requisito 1)
                      const Text(
                        'Marjorie Jimenez', 
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 32,
                          color: Colors.indigo,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        'Estudiante', 
                        style: TextStyle(
                          fontSize: 18,
                          letterSpacing: 1.5,
                          color: Colors.black54,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              
              // Widget 3 adicional: Divider personalizado
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: const Row(
                  children: [
                    Expanded(child: Divider(thickness: 2, color: Colors.indigo)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Icon(Icons.star, color: Colors.indigo),
                    ),
                    Expanded(child: Divider(thickness: 2, color: Colors.indigo)),
                  ],
                ),
              ),
              
              // Información de contacto modificada
              Card(
                margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: const ListTile(
                  leading: Icon(Icons.phone, color: Colors.indigo),
                  title: Text('+593 988928358'), // Cambia este número por el tuyo
                ),
              ),
              
              Card(
                margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: const ListTile(
                  leading: Icon(Icons.email, color: Colors.indigo),
                  title: Text('majimenezjim@uide.edu.ec'), // Cambia este email por el tuyo
                ),
              ),
              
              // Widget 4 adicional: Icon con badge
              Container(
                margin: const EdgeInsets.all(15),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    const Icon(
                      Icons.verified_user,
                      size: 50,
                      color: Colors.green,
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        child: const Text(
                          '1',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}