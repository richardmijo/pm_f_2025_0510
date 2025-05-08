import 'dart:io';

// Clase para representar una actividad
class Actividad {
  String nombre;
  double horasDedicadas;

  Actividad(this.nombre, this.horasDedicadas);

  // Método para calcular el porcentaje sobre las 168 horas de la semana
  double calcularPorcentaje() {
    return (horasDedicadas / 168) * 100;
  }
}

// Clase para gestionar el análisis de productividad
class AnalizadorProductividad {
  String nombreUsuario;
  List<Actividad> actividades = [];
  
  AnalizadorProductividad(this.nombreUsuario);

  // Método para agregar una actividad a la lista
  void agregarActividad(String nombre, double horas) {
    actividades.add(Actividad(nombre, horas));
  }

  // Método para obtener el total de horas registradas
  double obtenerTotalHoras() {
    double total = 0;
    for (var actividad in actividades) {
      total += actividad.horasDedicadas;
    }
    return total;
  }

  // Método para generar recomendaciones basadas en las horas
  Map<String, String> generarRecomendaciones() {
    Map<String, String> recomendaciones = {};
    
    // Buscar actividades específicas
    double horasTrabajo = 0;
    double horasSueno = 0;
    double horasOcio = 0;
    
    for (var actividad in actividades) {
      switch (actividad.nombre.toLowerCase()) {
        case 'trabajo':
        case 'estudio':
          horasTrabajo += actividad.horasDedicadas;
          break;
        case 'sueño':
        case 'dormir':
          horasSueno += actividad.horasDedicadas;
          break;
        case 'ocio':
        case 'descanso':
        case 'entretenimiento':
          horasOcio += actividad.horasDedicadas;
          break;
      }
    }
    
    // Recomendaciones para trabajo/estudio
    if (horasTrabajo > 60) {
      recomendaciones['trabajo'] = 'ADVERTENCIA: Estás dedicando más de 60 horas a trabajo/estudio. Considera reducir esta carga para evitar el agotamiento.';
    } else if (horasTrabajo < 30) {
      recomendaciones['trabajo'] = 'Estás dedicando menos de 30 horas a trabajo/estudio. ¿Necesitas aumentar tu dedicación a estas actividades?';
    }
    
    // Recomendaciones para sueño
    if (horasSueno < 40) {
      recomendaciones['sueño'] = 'ADVERTENCIA: Duermes menos de 40 horas semanales (menos de 6 horas diarias). El sueño insuficiente puede afectar tu salud y productividad.';
    } else if (horasSueno > 70) {
      recomendaciones['sueño'] = 'Duermes más de 70 horas a la semana (más de 10 horas diarias). Considera si necesitas tanto descanso.';
    }
    
    // Recomendaciones para ocio
    if (horasOcio < 10) {
      recomendaciones['ocio'] = 'Dedicas muy poco tiempo al ocio. Recuerda que el descanso es importante para mantener la productividad.';
    }
    
    // Recomendación general sobre el balance
    double horasRestantes = 168 - obtenerTotalHoras();
    if (horasRestantes.abs() > 5) {
      if (horasRestantes > 0) {
        recomendaciones['balance'] = 'Tienes ${horasRestantes.toStringAsFixed(1)} horas no asignadas a ninguna actividad. Considera si has olvidado registrar alguna actividad.';
      } else {
        recomendaciones['balance'] = 'Has registrado ${horasRestantes.abs().toStringAsFixed(1)} horas más de las 168 horas disponibles en una semana. Revisa tus datos.';
      }
    }
    
    return recomendaciones;
  }

  // Método para generar y mostrar el informe completo
  void mostrarInforme() {
    print('\n=============================================');
    print('INFORME DE PRODUCTIVIDAD PARA: $nombreUsuario');
    print('=============================================');
    
    print('\nDISTRIBUCIÓN DE HORAS SEMANALES:');
    print('---------------------------------------------');
    
    // Mostrar cada actividad con su porcentaje
    for (var actividad in actividades) {
      double porcentaje = actividad.calcularPorcentaje();
      print('${actividad.nombre}: ${actividad.horasDedicadas.toStringAsFixed(1)} horas (${porcentaje.toStringAsFixed(1)}%)');
    }
    
    // Mostrar total de horas
    double totalHoras = obtenerTotalHoras();
    print('\nTotal de horas registradas: ${totalHoras.toStringAsFixed(1)} de 168 horas (${(totalHoras/168*100).toStringAsFixed(1)}%)');
    
    // Mostrar recomendaciones
    print('\nRECOMENDACIONES:');
    print('---------------------------------------------');
    Map<String, String> recomendaciones = generarRecomendaciones();
    
    if (recomendaciones.isEmpty) {
      print('¡Felicidades! Tu distribución de tiempo parece equilibrada.');
    } else {
      recomendaciones.forEach((categoria, mensaje) {
        print('- $mensaje');
      });
    }
    
    // Mostrar conclusión
    print('\nCONCLUSIÓN:');
    print('---------------------------------------------');
    
    // Determinar nivel de equilibrio
    if (recomendaciones.isEmpty) {
      print('Tu distribución de tiempo está bien equilibrada.');
    } else if (recomendaciones.length <= 2) {
      print('Tu distribución de tiempo necesita algunos ajustes menores.');
    } else {
      print('Tu distribución de tiempo necesita una revisión importante para mejorar tu productividad y bienestar.');
    }
    
    print('\n=============================================\n');
  }
}

// Función para solicitar y validar un número
double solicitarNumero(String mensaje) {
  while (true) {
    stdout.write('$mensaje: ');
    String? entrada = stdin.readLineSync();
    
    if (entrada == null || entrada.isEmpty) {
      print('Por favor, ingresa un valor.');
      continue;
    }
    
    try {
      double valor = double.parse(entrada);
      if (valor < 0) {
        print('Por favor, ingresa un valor positivo.');
        continue;
      }
      return valor;
    } catch (e) {
      print('Por favor, ingresa un número válido.');
    }
  }
}

// Función principal
void main() {
  // Dar la bienvenida al usuario
  print('\n¡Bienvenido a la Calculadora de Productividad Personal!');
  print('Esta aplicación te ayudará a analizar cómo distribuyes tu tiempo en la semana.\n');
  
  // Solicitar el nombre del usuario
  stdout.write('Por favor, ingresa tu nombre: ');
  String? nombre = stdin.readLineSync();
  nombre = nombre?.trim() ?? 'Usuario';
  
  // Crear el analizador de productividad
  AnalizadorProductividad analizador = AnalizadorProductividad(nombre);
  
  // Lista de actividades comunes para sugerir
  List<String> actividadesSugeridas = ['Trabajo', 'Estudio', 'Sueño', 'Ocio', 'Ejercicio', 'Alimentación', 'Otra'];
  
  // Solicitar datos de las actividades
  print('\nVamos a registrar tus actividades semanales.');
  print('Actividades disponibles: ${actividadesSugeridas.join(', ')}');
  
  bool seguirAgregando = true;
  while (seguirAgregando) {
    // Mostrar opciones
    print('\nSelecciona una actividad:');
    for (int i = 0; i < actividadesSugeridas.length; i++) {
      print('${i+1}. ${actividadesSugeridas[i]}');
    }
    
    stdout.write('Ingresa el número de la actividad (o 0 para terminar): ');
    String? opcion = stdin.readLineSync();
    
    if (opcion == '0') {
      seguirAgregando = false;
      continue;
    }
    
    try {
      int indice = int.parse(opcion ?? '0') - 1;
      if (indice < 0 || indice >= actividadesSugeridas.length) {
        print('Opción no válida. Inténtalo de nuevo.');
        continue;
      }
      
      String nombreActividad = actividadesSugeridas[indice];
      
      // Si es "Otra", solicitar el nombre específico
      if (nombreActividad == 'Otra') {
        stdout.write('Ingresa el nombre de la actividad: ');
        String? nombreEspecifico = stdin.readLineSync();
        if (nombreEspecifico == null || nombreEspecifico.isEmpty) {
          print('Nombre no válido. Inténtalo de nuevo.');
          continue;
        }
        nombreActividad = nombreEspecifico;
      }
      
      // Solicitar horas dedicadas
      double horas = solicitarNumero('¿Cuántas horas a la semana dedicas a $nombreActividad?');
      
      // Agregar la actividad
      analizador.agregarActividad(nombreActividad, horas);
      
      print('Actividad registrada: $nombreActividad - $horas horas');
      
    } catch (e) {
      print('Entrada no válida. Por favor ingresa un número.');
    }
  }
  
  // Generar y mostrar el informe
  if (analizador.actividades.isNotEmpty) {
    analizador.mostrarInforme();
  } else {
    print('\nNo has registrado ninguna actividad. No se puede generar un informe.');
  }
}