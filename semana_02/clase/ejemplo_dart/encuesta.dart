import 'dart:io';

void main() {
  // Mapa que asocia nombres de personas con su preferencia (bool)
  Map<String, bool> respuestas = {};

  print('=== ENCUESTA DE PELÍCULAS ===');
  print('¿Te gusta ver películas de ciencia ficción? (sí/no)');

  // Repetimos el ingreso hasta que el usuario diga que ya no desea continuar
  bool continuar = true;

  do {
    stdout.write('\nNombre de la persona: ');
    String? nombre = stdin.readLineSync();

    if (nombre == null || nombre.trim().isEmpty) {
      print('❌ Nombre inválido. Intenta de nuevo.');
      continue;
    }

    stdout.write('¿Le gusta la ciencia ficción (sí/no)? ');
    String? respuesta = stdin.readLineSync();

    // Convertimos a minúscula para comparar
    bool gusto = (respuesta?.toLowerCase() == 'sí' || respuesta?.toLowerCase() == 'si');

    // Guardamos en el mapa
    respuestas[nombre.trim()] = gusto;

    stdout.write('¿Deseas ingresar otra persona? (sí/no): ');
    String? otra = stdin.readLineSync();
    if (otra == null || otra.toLowerCase() != 'sí' && otra.toLowerCase() != 'si') {
      continuar = false;
    }

  } while (continuar);

  print('\n=== RESULTADOS DE LA ENCUESTA ===');

  // Convertimos las claves del mapa en una lista
  List<String> participantes = respuestas.keys.toList();

  // Contadores
  int totalSi = 0;
  int totalNo = 0;

  // Recorremos usando FOR
  for (int i = 0; i < participantes.length; i++) {
    String nombre = participantes[i];
    bool leGusta = respuestas[nombre]!;
    print('$nombre: ${leGusta ? "Sí le gusta" : "No le gusta"}');

    if (leGusta) {
      totalSi++;
    } else {
      totalNo++;
    }
  }

  // Estadísticas usando WHILE
  int indice = 0;
  print('\nNombres de los que SÍ disfrutan ciencia ficción (while loop):');
  while (indice < participantes.length) {
    String nombre = participantes[indice];
    if (respuestas[nombre] == true) {
      print('- $nombre');
    }
    indice++;
  }

  // Mostrar resumen con DO-WHILE
  int mostrar = 0;
  do {
    if (mostrar == 0) {
      print('\nResumen final:');
      print('Total de encuestados: ${respuestas.length}');
      print('Les gusta la ciencia ficción: $totalSi');
      print('No les gusta la ciencia ficción: $totalNo');
    }
    mostrar++;
  } while (mostrar < 1);
}
