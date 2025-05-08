import 'dart:io';

// Clase para representar una actividad
class Actividad {
  String nombre;
  double horas;

  Actividad(this.nombre, this.horas);

  // Calcular el porcentaje de tiempo semanal
  double calcularPorcentaje() {
    return (horas / 168) * 100;
  }
}

// Clase principal para la calculadora de productividad
class CalculadoraProductividad {
  String nombreUsuario;
  List<Actividad> actividades = [];

  // Constructor
  CalculadoraProductividad(this.nombreUsuario);

  // Método para agregar una actividad
  void agregarActividad(String nombre, double horas) {
    actividades.add(Actividad(nombre, horas));
  }

  // Método para verificar si hay desequilibrios
  Map<String, String> verificarDesequilibrios() {
    Map<String, String> mensajes = {};

    // Calcular horas de trabajo/estudio
    double horasTrabajo = 0;
    double horasSueno = 0;

    for (var actividad in actividades) {
      if (actividad.nombre.toLowerCase().contains('trabajo') ||
          actividad.nombre.toLowerCase().contains('estudio')) {
        horasTrabajo += actividad.horas;
      } else if (actividad.nombre.toLowerCase().contains('sueño') ||
          actividad.nombre.toLowerCase().contains('dormir')) {
        horasSueno += actividad.horas;
      }
    }

    // Verificar desequilibrios
    if (horasTrabajo > 60) {
      mensajes['trabajo'] =
          "⚠️ Advertencia: Dedicas más de 60 horas a trabajo/estudio. Considera reducir esta carga para evitar agotamiento.";
    }

    if (horasSueno < 40) {
      mensajes['sueño'] =
          "😴 Sugerencia: Estás durmiendo menos de 40 horas semanales. Se recomienda al menos 49 horas (7 horas diarias).";
    }

    // Verificar balance general
    double horasOcio = 0;
    for (var actividad in actividades) {
      if (actividad.nombre.toLowerCase().contains('ocio') ||
          actividad.nombre.toLowerCase().contains('descanso') ||
          actividad.nombre.toLowerCase().contains('recreación')) {
        horasOcio += actividad.horas;
      }
    }

    if (horasOcio < 14) {
      mensajes['ocio'] =
          "🎭 Sugerencia: Dedicas menos de 14 horas semanales a ocio. Considera aumentar este tiempo para mejorar tu bienestar.";
    }

    return mensajes;
  }

  // Método para generar informe
  void generarInforme() {
    double totalHoras = 0;

    for (var actividad in actividades) {
      totalHoras += actividad.horas;
    }

    print("\n" + "=" * 60);
    print("📊 INFORME DE PRODUCTIVIDAD PARA: $nombreUsuario");
    print("=" * 60);

    print("\nDISTRIBUCIÓN DE TIEMPO SEMANAL:");
    print("-" * 60);

    // Ordenar actividades por tiempo dedicado (de mayor a menor)
    actividades.sort((a, b) => b.horas.compareTo(a.horas));

    for (var actividad in actividades) {
      double porcentaje = actividad.calcularPorcentaje();
      String barraProgreso = generarBarraProgreso(porcentaje);

      print(
        "${actividad.nombre}: ${actividad.horas.toStringAsFixed(1)} horas (${porcentaje.toStringAsFixed(1)}%)",
      );
      print("$barraProgreso\n");
    }

    // Verificar si se han registrado 168 horas
    if (totalHoras < 168) {
      print(
        "⚠️ Has registrado ${totalHoras.toStringAsFixed(1)} horas de 168 posibles.",
      );
      print(
        "   Faltan ${(168 - totalHoras).toStringAsFixed(1)} horas por asignar.\n",
      );
    } else if (totalHoras > 168) {
      print(
        "⚠️ Has registrado ${totalHoras.toStringAsFixed(1)} horas, lo cual excede las 168 horas semanales.",
      );
      print(
        "   Hay un exceso de ${(totalHoras - 168).toStringAsFixed(1)} horas.\n",
      );
    }

    print("RECOMENDACIONES PERSONALIZADAS:");
    print("-" * 60);

    Map<String, String> mensajes = verificarDesequilibrios();

    if (mensajes.isEmpty) {
      print("✅ ¡Felicitaciones! Tu distribución de tiempo parece equilibrada.");
    } else {
      mensajes.forEach((key, value) {
        print(value);
      });
    }

    print("\nRESUMEN GENERAL:");
    print("-" * 60);

    // Calcular índice de productividad (fórmula simplificada para ejemplo)
    double indiceProductividad = calcularIndiceProductividad();

    print(
      "Tu índice de productividad es: ${indiceProductividad.toStringAsFixed(1)}/10",
    );

    if (indiceProductividad >= 8) {
      print("¡Excelente balance! Mantienes una buena distribución de tiempo.");
    } else if (indiceProductividad >= 6) {
      print("Buen balance, aunque hay aspectos que podrías mejorar.");
    } else {
      print(
        "Tu distribución de tiempo podría mejorarse para aumentar tu bienestar y productividad.",
      );
    }

    print("\n" + "=" * 60);
  }

  // Método para generar una barra de progreso visual
  String generarBarraProgreso(double porcentaje) {
    int longitud = 30;
    int caracteresFillenos = (porcentaje / 100 * longitud).round();

    return "[" +
        "#" * caracteresFillenos +
        " " * (longitud - caracteresFillenos) +
        "]";
  }

  // Método para calcular un índice de productividad (ejemplo simplificado)
  double calcularIndiceProductividad() {
    double indice = 10.0; // Valor base
    Map<String, String> desequilibrios = verificarDesequilibrios();

    // Reducir índice por cada desequilibrio
    indice -= desequilibrios.length * 1.5;

    // Asegurar que el índice esté entre 0 y 10
    if (indice < 0) indice = 0;
    if (indice > 10) indice = 10;

    return indice;
  }
}

// Función para leer entrada numérica con validación
double leerNumero(String mensaje) {
  while (true) {
    stdout.write(mensaje);
    String? input = stdin.readLineSync();

    try {
      return double.parse(input!);
    } catch (e) {
      print("⚠️ Por favor, ingresa un número válido.");
    }
  }
}

// Función principal
void main() {
  print("\n" + "=" * 60);
  print("🚀 CALCULADORA DE PRODUCTIVIDAD PERSONAL");
  print("=" * 60);

  stdout.write("\nPor favor, ingresa tu nombre: ");
  String nombre = stdin.readLineSync() ?? "Usuario";

  // Crear instancia de la calculadora
  CalculadoraProductividad calculadora = CalculadoraProductividad(nombre);

  // Solicitar actividades predefinidas
  Map<String, String> actividadesPredefinidas = {
    'trabajo': "Horas de trabajo: ",
    'estudio': "Horas de estudio: ",
    'sueño': "Horas de sueño: ",
    'ocio': "Horas de ocio: ",
    'ejercicio': "Horas de ejercicio: ",
    'comidas': "Horas para comidas: ",
  };

  print(
    "\nVamos a registrar tus actividades semanales (horas totales en la semana):",
  );

  // Solicitar horas para actividades predefinidas
  actividadesPredefinidas.forEach((key, mensaje) {
    double horas = leerNumero(mensaje);
    calculadora.agregarActividad(
      key.substring(0, 1).toUpperCase() + key.substring(1),
      horas,
    );
  });

  // Preguntar si quiere agregar actividades adicionales
  print("\n¿Deseas agregar más actividades? (s/n)");
  String respuesta = stdin.readLineSync()?.toLowerCase() ?? "n";

  while (respuesta == "s") {
    stdout.write("Nombre de la actividad: ");
    String nombreActividad = stdin.readLineSync() ?? "Actividad";

    double horasActividad = leerNumero("Horas dedicadas a $nombreActividad: ");
    calculadora.agregarActividad(nombreActividad, horasActividad);

    print("¿Deseas agregar otra actividad? (s/n)");
    respuesta = stdin.readLineSync()?.toLowerCase() ?? "n";
  }

  // Generar y mostrar el informe
  calculadora.generarInforme();
}
