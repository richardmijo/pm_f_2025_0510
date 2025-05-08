# Calculadora de Productividad Personal

Este programa permite al usuario calcular su índice de productividad semanal en base a las actividades realizadas, mostrando un análisis detallado y recomendaciones personalizadas.

## ¿Qué hace el programa?

Esta aplicación de consola en Dart:

1. Solicita el nombre del usuario
2. Permite registrar múltiples actividades (trabajo, estudio, sueño, ocio, etc.) con las horas dedicadas a cada una
3. Calcula el porcentaje de tiempo dedicado a cada actividad sobre las 168 horas de la semana
4. Genera un informe completo que incluye:
   - Distribución de horas semanales
   - Porcentaje de tiempo por actividad
   - Recomendaciones personalizadas según los datos
   - Detección de desequilibrios (ejemplo: demasiadas horas de trabajo, poco sueño)
   - Conclusión general sobre la distribución del tiempo

## Aprendizajes sobre Dart

Durante el desarrollo de este programa, he aprendido:

1. **Sintaxis básica de Dart**: Declaración de variables, funciones y estructuras de control.
2. **Programación Orientada a Objetos en Dart**: Creación y uso de clases, métodos y propiedades.
3. **Estructuras de datos**: Manejo de listas y mapas para almacenar y procesar información.
4. **Entrada/Salida por consola**: Uso de `stdin` y `stdout` para interactuar con el usuario.
5. **Manejo de excepciones**: Uso de bloques `try-catch` para manejar errores de entrada.
6. **Formateo de texto**: Uso de métodos como `toStringAsFixed()` para formatear números.
7. **Funciones de alto nivel**: Implementación de funciones reutilizables.

## Cómo ejecutar el programa

1. Asegúrate de tener Dart SDK instalado en tu sistema.
2. Abre una terminal en el directorio donde se encuentra el archivo `main.dart`.
3. Ejecuta el siguiente comando:

```bash
dart main.dart
```

4. Sigue las instrucciones que aparecen en la consola:
   - Ingresa tu nombre
   - Selecciona actividades de la lista o agrega personalizadas
   - Ingresa las horas dedicadas a cada actividad
   - Revisa el informe de productividad generado

## Estructura del código

- **Clase `Actividad`**: Representa cada actividad con su nombre y horas dedicadas.
- **Clase `AnalizadorProductividad`**: Gestiona la lista de actividades y genera el análisis.
- **Función `solicitarNumero`**: Función auxiliar para validar entradas numéricas.
- **Función `main`**: Orquesta la interacción con el usuario y el flujo del programa.

El programa utiliza conceptos de programación orientada a objetos para organizar la lógica de negocio y mantener el código limpio y mantenible.