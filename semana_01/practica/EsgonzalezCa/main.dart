import 'dart:io';

class Actividad {
  String nombre;
  int horas;

  Actividad(this.nombre, this.horas);

  double calcularPorcentaje() {
    return (horas / 168) * 100; // 168 horas en una semana
  }
}

void mostrarRecomendaciones(Map<String, Actividad> actividades) {
  final trabajo = actividades["Trabajo"]?.horas ?? 0;
  final estudio = actividades["Estudio"]?.horas ?? 0;
  final sueno = actividades["Sueño"]?.horas ?? 0;
  
  if (trabajo > 60) {
    print("\n🔴 Alerta: Trabajas ${trabajo} horas semanales (recomendado <60)");
    print("   - El exceso de trabajo puede causar estrés y burnout");
  }
  
  if (estudio > 60) {
    print("\n🔴 Alerta: Estudias ${estudio} horas semanales (recomendado <60)");
    print("   - El aprendizaje efectivo requiere descansos adecuados");
  }
  
  if (sueno < 40) {
    print("\n🟠 Precaución: Solo duermes ${sueno} horas esta semana");
    print("   - Lo ideal es dormir 49-63 horas semanales (7-9 horas diarias)");
  }
  
  if (trabajo + estudio > 100) {
    print("\n🟡 Nota: Tienes muchas horas de obligaciones (${trabajo + estudio}h)");
    print("   - Considera reservar tiempo para descanso y autocuidado");
  }
}

void mostrarResumen(String nombre, Map<String, Actividad> actividades) {
  print("\n🌟 Resumen Semanal de ${nombre} 🌟");
  print("---------------------------------");
  
  actividades.forEach((key, actividad) {
    double porcentaje = actividad.calcularPorcentaje();
    print("${actividad.nombre.padRight(8)}: ${actividad.horas.toString().padLeft(3)} horas | ${porcentaje.toStringAsFixed(1).padLeft(5)}%");
  });
  
  int total = actividades.values.fold(0, (sum, a) => sum + a.horas);
  double porcentajeTotal = (total / 168) * 100;
  print("\nTotal registrado: ${total}h (${porcentajeTotal.toStringAsFixed(1)}% de tu semana)");
  
  if (total < 168) {
    print("\n🟢 Tienes ${168 - total} horas libres esta semana - ¡Aprovéchalas bien!");
  } else if (total > 168) {
    print("\n🔴 ¡Has registrado más horas de las que tiene una semana! Revisa tus datos");
  }
}

void main() {
  print("✨ Bienvenido al Analizador de Tiempo Semanal ✨");
  print("\nPor favor, ingresa tu nombre:");
  String nombre = stdin.readLineSync()!.trim();
  
  List<String> categorias = ["Trabajo", "Estudio", "Ocio", "Sueño", "Ejercicio", "Familia"];
  Map<String, Actividad> actividades = {};
  
  print("\n📝 Vamos a registrar cómo distribuyes tu tiempo esta semana");
  print("(Ingresa el número de horas para cada categoría)\n");
  
  for (var categoria in categorias) {
    while (true) {
      try {
        print("⏳ Horas dedicadas a ${categoria}:");
        int horas = int.parse(stdin.readLineSync()!);
        if (horas >= 0 && horas <= 168) {
          actividades[categoria] = Actividad(categoria, horas);
          break;
        } else {
          print("Por favor ingresa un número entre 0 y 168");
        }
      } catch (e) {
        print("Entrada inválida. Por favor ingresa un número entero.");
      }
    }
  }
  
  mostrarResumen(nombre, actividades);
  mostrarRecomendaciones(actividades);
  
  print("\n💭 Reflexión: ¿Cómo te sientes con esta distribución de tiempo?");
  print("Gracias por usar el Analizador de Tiempo. ¡Que tengas una semana equilibrada! 😊");
}