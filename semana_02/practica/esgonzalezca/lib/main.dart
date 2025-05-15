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
      title: 'Mi Perfil Personal',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const PerfilPersonal(),
    );
  }
}

class PerfilPersonal extends StatelessWidget {
  const PerfilPersonal({super.key});

  void _mostrarDialogo(BuildContext context, String opcion) {
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: const Text("Opción seleccionada"),
            content: Text("Elegiste: $opcion"),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Cerrar"),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mi Perfil Personal"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.person),
          onPressed: () => _mostrarDialogo(context, "Perfil"),
        ),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) => _mostrarDialogo(context, value),
            itemBuilder:
                (BuildContext context) => const [
                  PopupMenuItem(
                    value: "Mostrar Alerta",
                    child: Text("Mostrar Alerta"),
                  ),
                  PopupMenuItem(
                    value: "Otra opción",
                    child: Text("Otra opción"),
                  ),
                ],
          ),
        ],
      ),
      backgroundColor: Colors.teal.shade100,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              const CircleAvatar(
                radius: 70,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 65,
                  backgroundImage: NetworkImage('https://i.pravatar.cc/301'),
                ),
              ),
              const SizedBox(height: 15),
              Text(
                'Estalin Ismael Gonzalez Castro',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Pacifico',
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 5),
              Text(
                'En proceso.....',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  letterSpacing: 2.5,
                  color: Colors.teal.shade800,
                ),
              ),
              const Divider(
                height: 30,
                thickness: 1,
                indent: 50,
                endIndent: 50,
                color: Colors.teal,
              ),
              _buildInfoCard(
                icon: Icons.phone,
                text: '+5939392558',
                context: context,
              ),
              _buildInfoCard(
                icon: Icons.email,
                text: 'esgonzalezca@gmail.com',
                context: context,
              ),
              _buildInfoCard(
                icon: Icons.location_city,
                text: 'Loja, Ecuador',
                context: context,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _mostrarDialogo(context, "Botón principal"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 12,
                  ),
                ),
                child: const Text('Contactar'),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String text,
    required BuildContext context,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Icon(icon, color: Colors.deepPurple, size: 28),
            const SizedBox(width: 15),
            Expanded(
              child: Text(text, style: Theme.of(context).textTheme.titleMedium),
            ),
          ],
        ),
      ),
    );
  }
}
