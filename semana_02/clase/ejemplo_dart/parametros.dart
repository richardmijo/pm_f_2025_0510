// Función con parámetros posicionales obligatorios
void registrarProducto(String nombre, double precio) {
  print('Producto registrado: $nombre, precio: \$${precio.toStringAsFixed(2)}');
}

// Función con parámetros por nombre (named parameters)
// Los parámetros con nombre se encierran entre llaves {}
void registrarProductoConDetalles({
  required String nombre,
  required double precio,
  String? categoria,  // este es opcional
  int stock = 0,       // con valor por defecto
}) {
  print('Producto: $nombre');
  print('Precio: \$${precio.toStringAsFixed(2)}');
  print('Categoría: ${categoria ?? "General"}');
  print('Stock disponible: $stock unidades\n');
}

// Función con parámetros posicionales opcionales (entre [ ])
void registrarProductoOpcional(String nombre, [String? descripcion, bool destacado = false]) {
  print('Nombre del producto: $nombre');
  print('Descripción: ${descripcion ?? "Sin descripción"}');
  print('¿Destacado?: ${destacado ? "Sí" : "No"}\n');
}

void main() {
  print('=== PARÁMETROS POSICIONALES OBLIGATORIOS ===');
  registrarProducto('Teclado', 25.5);

  print('=== PARÁMETROS POR NOMBRE ===');
  registrarProductoConDetalles(
    
    precio: 18.99,
    stock: 15,
    nombre: 'Mouse inalámbrico',
  );

  print('=== PARÁMETROS POR NOMBRE CON VALORES POR DEFECTO Y OPCIONALES ===');
  registrarProductoConDetalles(
    nombre: 'Cable HDMI',
    precio: 7.5,
    // categoría no se pasa → será null
    // stock no se pasa → tomará 0
  );

  print('=== PARÁMETROS POSICIONALES OPCIONALES ===');
  registrarProductoOpcional('Laptop');
  registrarProductoOpcional('Tablet', 'Tablet de 10 pulgadas');
  registrarProductoOpcional('Monitor', 'Monitor LED', true);
}
