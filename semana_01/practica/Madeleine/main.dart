import 'dart:io';

const int totalHorasSemana = 168;

// Clase que representa una actividad semanal
class Actividad {
  String nombre;
  int horas;

  Actividad(this.nombre, this.horas);

  double calcularPorcentaje() {
    return (horas / totalHorasSemana) * 100;
  }
}

// Función para solicitar las actividades al usuario
List<Actividad> solicitarActividades() {
  List<Actividad> actividades = [];

  print('\nIngrese las horas dedicadas a cada actividad:');

  actividades.add(Actividad('Trabajo', solicitarHoras('Trabajo')));
  actividades.add(Actividad('Estudio', solicitarHoras('Estudio')));
  actividades.add(Actividad('Ocio', solicitarHoras('Ocio')));
  actividades.add(Actividad('Sueño', solicitarHoras('Sueño')));

  // Permitir al usuario agregar más actividades si desea
  while (true) {
    stdout.write('\n¿Desea agregar otra actividad? (s/n): ');
    String? respuesta = stdin.readLineSync();
    if (respuesta?.toLowerCase() == 's') {
      stdout.write('Nombre de la actividad: ');
      String? nombre = stdin.readLineSync();
      int horas = solicitarHoras(nombre ?? 'Actividad');
      actividades.add(Actividad(nombre ?? 'Actividad', horas));
    } else {
      break;
    }
  }

  return actividades;
}

// Función para solicitar horas validadas
int solicitarHoras(String nombreActividad) {
  while (true) {
    stdout.write('Horas dedicadas a $nombreActividad: ');
    String? input = stdin.readLineSync();
    if (input != null) {
      int? horas = int.tryParse(input);
      if (horas != null && horas >= 0) {
        return horas;
      }
    }
    print('Por favor, ingrese un número válido.');
  }
}

// Función para analizar las actividades
void analizarActividades(String nombreUsuario, List<Actividad> actividades) {
  print('\n----- Informe Semanal de Productividad para $nombreUsuario -----\n');
  int totalHoras = actividades.fold(0, (sum, act) => sum + act.horas);

  if (totalHoras > totalHorasSemana) {
    print('⚠️ Has registrado más de 168 horas. Revisa los datos ingresados.\n');
  }

  for (var actividad in actividades) {
    double porcentaje = actividad.calcularPorcentaje();
    print('${actividad.nombre}: ${actividad.horas} horas (${porcentaje.toStringAsFixed(2)}%)');

    // Advertencias o sugerencias
    if (actividad.nombre.toLowerCase() == 'trabajo' && actividad.horas > 60) {
      print(' Advertencia: Estás trabajando demasiado. Considera equilibrar tu semana.');
    }
    if (actividad.nombre.toLowerCase() == 'estudio' && actividad.horas > 60) {
      print(' Advertencia: Muchas horas de estudio pueden ser contraproducentes.');
    }
    if (actividad.nombre.toLowerCase() == 'sueño' && actividad.horas < 40) {
      print(' Sugerencia: Dormir menos de 40 horas semanales puede afectar tu salud.');
    }
  }

  print('\nResumen general:');
  if (totalHoras < totalHorasSemana) {
    print(' Tienes ${totalHorasSemana - totalHoras} horas libres esta semana.');
  } else if (totalHoras == totalHorasSemana) {
    print(' Has distribuido exactamente las 168 horas disponibles.');
  } else {
    print(' Has excedido el tiempo disponible. Revisa tu planificación.');
  }
}

void main() {
  print('=== Calculadora de Productividad Semanal ===');
  stdout.write('Ingresa tu nombre: ');
  String? nombreUsuario = stdin.readLineSync();

  if (nombreUsuario == null || nombreUsuario.trim().isEmpty) {
    print('Nombre no válido. Saliendo...');
    return;
  }

  List<Actividad> actividades = solicitarActividades();
  analizarActividades(nombreUsuario.trim(), actividades);
}
