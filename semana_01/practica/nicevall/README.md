# Calculadora de Productividad Personal

## ¿Qué hace el programa?

Este programa en Dart permite al usuario calcular su índice de productividad semanal basado en las horas dedicadas a diferentes actividades. Funciona de la siguiente manera:

1. Solicita al usuario su nombre y la cantidad de horas que dedica semanalmente a diferentes actividades (trabajo, estudio, ocio, sueño, etc.)
2. Permite agregar actividades personalizadas además de las predefinidas
3. Calcula el porcentaje de tiempo dedicado a cada actividad respecto a las 168 horas semanales disponibles
4. Detecta posibles desequilibrios, como exceso de trabajo o falta de sueño
5. Genera un informe detallado con:
   - Distribución de tiempo por actividad (con barras de progreso visual)
   - Recomendaciones personalizadas según los datos
   - Índice de productividad calculado en base al equilibrio de actividades
   - Resumen general con sugerencias de mejora

## Lo que aprendí de Dart

Durante el desarrollo de este programa, aprendí varios aspectos fundamentales del lenguaje Dart:

- **Sintaxis y estructura básica**: Dart tiene una sintaxis clara y familiar similar a lenguajes como Java y JavaScript, lo que facilita su aprendizaje.
- **Programación orientada a objetos**: Implementé clases (`Actividad` y `CalculadoraProductividad`) con propiedades y métodos.
- **Colecciones**: Utilicé `List<Actividad>` para almacenar las actividades y `Map<String, String>` para los mensajes de desequilibrio.
- **Entrada/salida por consola**: Aprendí a usar `stdin.readLineSync()` para leer entrada del usuario y `stdout.write()` para mostrar mensajes sin salto de línea.
- **Manejo de cadenas**: Manipulación de strings para formatear la salida, crear barras de progreso visuales y capitalizar texto.
- **Control de flujo**: Implementé estructuras condicionales (`if/else`) y bucles (`for`, `while`).
- **Funciones y métodos**: Creé funciones como `leerNumero()` para encapsular la lógica de validación de entrada.
- **Gestión de errores**: Implementé un bloque `try/catch` para manejar errores en la conversión de tipos.
- **Formato y presentación de datos**: Aprendí a formatear números con `toStringAsFixed()` y a crear interfaces de texto claras y organizadas.

Dart me ha parecido un lenguaje potente y elegante, ideal como base para el framework Flutter. Su enfoque en la creación de aplicaciones de alto rendimiento y su compatibilidad tanto para aplicaciones de consola como móviles lo hace muy versátil.

## Cómo ejecutar el programa

### Requisitos previos

- Tener instalado Dart SDK
- Tener instalado Flutter (aunque este programa solo usa Dart puro)

### Pasos para ejecutar

1. **Desde Visual Studio Code**:

   - Abrir el archivo `main.dart` en VS Code
   - Asegurarse de tener la extensión de Dart instalada
   - Pulsar F5 o usar el botón de "Run" para ejecutar

2. **Desde la terminal**:

   - Navegar hasta el directorio donde se encuentra el archivo
   - Ejecutar el comando: `dart main.dart`

3. **Interactuando con el programa**:
   - Seguir las instrucciones en pantalla
   - Ingresar tu nombre
   - Proporcionar las horas dedicadas a cada actividad
   - Agregar actividades adicionales si lo deseas
   - Revisar el informe generado
