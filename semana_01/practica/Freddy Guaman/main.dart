import 'dart:io';

class Actividad {
  String nombre;
  double horas;

  Actividad(this.nombre, this.horas);

  double calcularPorcentaje() {
    return (horas / 168) * 100;
  }
}

void mostrarMensajePersonalizado(List<Actividad> actividades) {
  for (var actividad in actividades) {
    if ((actividad.nombre.toLowerCase() == 'trabajo' || actividad.nombre.toLowerCase() == 'estudio') && actividad.horas > 60) {
      print("⚠️ Advertencia: Dedicando muchas horas a ${actividad.nombre.toLowerCase()} (${actividad.horas}h). Considera equilibrar tu tiempo.");
    }
    if (actividad.nombre.toLowerCase() == 'sueño' && actividad.horas < 40) {
      print("😴 Sugerencia: Dormir menos de 40 horas a la semana puede afectar tu salud.");
    }
  }
}

void mostrarInforme(List<Actividad> actividades) {
  print("\n📊 Informe de Productividad Semanal:");
  double totalHoras = actividades.fold(0, (sum, act) => sum + act.horas);

  for (var actividad in actividades) {
    double porcentaje = actividad.calcularPorcentaje();
    print("- ${actividad.nombre}: ${actividad.horas} horas (${porcentaje.toStringAsFixed(2)}%)");
  }

  print("\nResumen general:");

  if (totalHoras > 168) {
    print("⚠️ Has ingresado más de 168 horas. Revisa tus datos.");
  } else {
    print("✅ Todo en orden con las 168 horas disponibles.");
  }

  mostrarMensajePersonalizado(actividades);
}

void main() {
  stdout.write("👤 Ingresa tu nombre: ");
  String nombre = stdin.readLineSync() ?? "Usuario";

  print("\nHola $nombre, vamos a registrar tus actividades semanales.");
  List<Actividad> actividades = [];

  while (true) {
    stdout.write("\nNombre de la actividad (escribe 'fin' para terminar): ");
    String nombreActividad = stdin.readLineSync() ?? "";
    if (nombreActividad.toLowerCase() == 'fin') break;

    stdout.write("Horas dedicadas a $nombreActividad: ");
    double horas = double.tryParse(stdin.readLineSync() ?? "0") ?? 0;

    actividades.add(Actividad(nombreActividad, horas));
  }

  mostrarInforme(actividades);
}
