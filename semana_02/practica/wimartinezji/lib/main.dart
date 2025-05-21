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
      debugShowCheckedModeBanner: false, // Oculta la etiqueta de "debug" en la esquina superior
      home: Scaffold(
        appBar: MiAppBar(), // AppBar personalizado
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
        backgroundColor: Colors.indigo, // Color de fondo cambiado
        body: Center(
          // Colocamos todo el contenido en el centro
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Centra los widgets verticalmente
            children: <Widget>[
              // Widget para mostrar una imagen circular (avatar)
              const CircleAvatar(
                radius: 60, // Tamaño del círculo
                backgroundImage: NetworkImage(
                  'https://hebbkx1anhila5yf.public.blob.vercel-storage.com/avatar_optimizado-CXfGiouJA5Xd1eWcXhNNtZ25P7UWJ1.png',
                ),
              ),
              const SizedBox(height: 10), // Espacio entre la imagen y el texto
              const Text(
                'Wilson Martínez', // Nombre personalizado
                style: TextStyle(
                  fontFamily: 'Pacifico', // Fuente personalizada (opcional)
                  fontSize: 32, // Tamaño grande
                  color: Colors.white, // Color blanco
                  fontWeight: FontWeight.bold, // Negrita
                ),
              ),
              const Text(
                'ING. En tecnologías de la información', // Profesión personalizada
                style: TextStyle(
                  fontSize: 18,
                  letterSpacing: 2.5, // Espaciado entre letras
                  color: Colors.white70,
                  fontWeight: FontWeight.w400,
                ),
              ),
              // Línea decorativa divisora (Widget extra 1)
              const Divider(
                height: 20,
                thickness: 1,
                indent: 50,
                endIndent: 50,
                color: Colors.amber,
              ),
              // Tarjeta con ícono de teléfono y número
              const Card(
                margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: ListTile(
                  leading: Icon(Icons.phone, color: Colors.indigo),
                  title: Text('+ 593 963787516'), // Teléfono personalizado
                ),
              ),
              // Tarjeta con ícono de email y correo
              const Card(
                margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: ListTile(
                  leading: Icon(Icons.email, color: Colors.indigo),
                  title: Text('wm911m@gmail.com'), // Correo personalizado
                ),
              ),
              // Widget extra 2: ElevatedButton personalizado
              const SizedBox(height: 10),
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.web),
                label: Text('Visitar sitio web'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.amber,
                ),
              ),
              // Widget extra 3: Card con información adicional
              const Card(
                margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                color: Colors.white70,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.location_on, color: Colors.indigo),
                      SizedBox(width: 10),
                      Text('Loja, Ecuador', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// AppBar personalizado
class MiAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.amber, // Color de fondo diferente
      title: Row(
        children: [
          Icon(Icons.person_pin), // Icono personalizado
          SizedBox(width: 10),
          Text('Mi Perfil Profesional'), // Título personalizado
        ],
      ),
      actions: [
        // Menú desplegable con PopupMenuButton
        PopupMenuButton<String>(
          onSelected: (value) {
            // Muestra un SnackBar cuando se selecciona una opción
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Seleccionaste: $value')),
            );
          },
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: 'imprimir',
              child: Row(
                children: [
                  Icon(Icons.print, color: Colors.indigo),
                  SizedBox(width: 10),
                  Text('Imprimir tarjeta'),
                ],
              ),
            ),
            const PopupMenuItem(
              value: 'compartir',
              child: Row(
                children: [
                  Icon(Icons.share, color: Colors.indigo),
                  SizedBox(width: 10),
                  Text('Compartir perfil'),
                ],
              ),
            ),
            // Opción extra para mostrar un diálogo (extra opcional)
            const PopupMenuItem(
              value: 'info',
              child: Row(
                children: [
                  Icon(Icons.info_outline, color: Colors.indigo),
                  SizedBox(width: 10),
                  Text('Información'),
                ],
              ),
            ),
          ],
          // Cuando se selecciona "info", muestra un diálogo
          onCanceled: () {},
        ),
      ],
    );
  }
}