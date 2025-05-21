// Simula un formulario simple donde se puede o no llenar toda la información

void main22() {
  print('=== REGISTRO DE USUARIO ===\n');

  // Variable obligatoria, pero inicializada más adelante
  late String nombre;

  // Variables que pueden ser nulas
  String? correo;
  int? edad;
  String? telefono;

  // Simulación de entrada de datos
  nombre = obtenerNombre(); // Debe ser inicializado antes de usarse
  correo = obtenerCorreo();
  edad = obtenerEdad();
  telefono = obtenerTelefono();

  print('\nResumen del registro:');
  print('Nombre: $nombre');

  // Uso del operador "?" para evitar errores si es null
  print('Correo: ${correo ?? "No proporcionado"}');
  print('Edad: ${edad ?? "No ingresada"}');
  print('Teléfono: ${telefono ?? "No ingresado"}');

  // Uso del operador "!" (null assertion): solo si estás 100% seguro de que NO es null
  if (correo != null) {
    print('Dominio del correo: ${correo.split('@').last}');
  }

  // ¡Error si se usa nombre sin inicializar! Pero como usamos `late`, Dart lo permite con seguridad.
}

// Simula que el usuario siempre proporciona un nombre
String obtenerNombre() {
  return 'Ana Pérez';
}

// Simula que el usuario a veces deja vacío el correo
String? obtenerCorreo() {
  return null; // simula que no se ingresó correo
}

// Simula que el usuario ingresa la edad correctamente
int? obtenerEdad() {
  return 28;
}

// Simula que el usuario no llenó el teléfono
String? obtenerTelefono() {
  return null;
}

late String saludo;

void main() {
  //saludo = 'Hola, mundo';
  print(saludo); // Imprime: Hola, mundo
}


/**
 * ¿Qué es late en Dart?
  En Dart, cuando activas null safety, todas las variables deben ser inicializadas obligatoriamente 
  al momento de su declaración, o declararse como nullable (?).

Pero, ¿qué pasa si sabes que una variable sí se va a inicializar, pero no inmediatamente?
  Para eso existe late.

Concepto clave de late:
  late le dice al compilador de Dart: 
  "Confía en mí, esta variable se inicializará antes de que la use, aunque no la inicialice ahora mismo".

  Se usa con variables no nulas (no llevan ?)
  El compilador no te exige inicializarla al declararla
  Pero si la usas sin haberla inicializado, el programa falla en tiempo de ejecución (no en compilación)
 */