// Uso de librerías estándar para entrada/salida.
import 'dart:io';

// Lista global para almacenar las tareas
List<String> tareas = [];

// Función principal que actúa como punto de entrada del programa
void main() {
  print('===== GESTOR DE TAREAS =====');

  while (true) {
    print('\nOpciones:');
    print('1. Agregar tarea');
    print('2. Ver tareas');
    print('3. Eliminar tarea');
    print('4. Salir');
    stdout.write('Selecciona una opción (1-4): ');
    String? opcion = stdin.readLineSync();

    switch (opcion) {
      case '1':
        agregarTarea();
        break;
      case '2':
        mostrarTareas();
        break;
      case '3':
        eliminarTarea();
        break;
      case '4':
        print('Gracias por usar el gestor de tareas. ¡Hasta pronto!');
        return; // Sale del programa
      default:
        print('Opción no válida. Intenta nuevamente.');
    }
  }
}

// Función para agregar una tarea a la lista
void agregarTarea() {
  stdout.write('Escribe la nueva tarea: ');
  String? nuevaTarea = stdin.readLineSync();
  if (nuevaTarea != null && nuevaTarea.trim().isNotEmpty) {
    tareas.add(nuevaTarea.trim());
    print('✅ Tarea agregada con éxito.');
  } else {
    print('❌ La tarea no puede estar vacía.');
  }
}

// Función para mostrar todas las tareas
void mostrarTareas() {
  if (tareas.isEmpty) {
    print('📭 No hay tareas registradas.');
  } else {
    print('\n📝 Lista de tareas:');
    for (int i = 0; i < tareas.length; i++) {
      print('${i + 1}. ${tareas[i]}');
    }
  }
}

// Función para eliminar una tarea por su número
void eliminarTarea() {
  mostrarTareas();
  if (tareas.isEmpty) return;

  stdout.write('\nEscribe el número de la tarea a eliminar: ');
  String? entrada = stdin.readLineSync();

  int? indice = int.tryParse(entrada ?? '');
  if (indice == null || indice < 1 || indice > tareas.length) {
    print('❌ Número inválido.');
  } else {
    String eliminada = tareas.removeAt(indice - 1);
    print('🗑️ Tarea "$eliminada" eliminada.');
  }
}
