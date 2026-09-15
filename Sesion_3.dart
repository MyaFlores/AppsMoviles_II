// Sesion 3 - Estructuras de control y el calculo de la media, mediana y moda
void main() {
  // ============================================
  // PARTE 1: ESTRUCTURAS DE CONTROL
  // ============================================

  final int edad = 8;
  print("La edad es de: $edad");

  // Lista de valores (la de la actividad)
  final List<int> numeros = [1, 2, 3, 8, 5, 2];
  print("El numero 0: ${numeros[0]}");

  final int opcion = 0;
  int bandera = 3;

  // IF
  if (edad > 18) {
    print("Es mayor de edad, su edad es de $edad años");
  }

  // IF-ELSE
  if (edad > 18) {
    print("Es mayor de edad, su edad es de $edad años");
  } else {
    print("Es menor de edad, su edad es de $edad años");
  }
  print("${edad > 18 ? 'SI' : 'NO'} es mayor de edad");

  // SWITCH
  switch (opcion) {
    case 0:
      print("La opcion es 0");
      break;
    case 1:
      print("La opcion es 1");
      break;
    default:
      print("No esta la opcion seleccionada");
      break;
  }

  // FOR
  for (int i = 0; i < numeros.length; i++) {
    print("El elemento $i es ${numeros[i]}");
  }

  // FOR-IN
  for (int numero in numeros) {
    print("El numero es $numero");
  }

  // WHILE
  while (bandera > 0) {
    print("La bandera es igual a: $bandera");
    bandera--;
  }

  // DO-WHILE
  int contador = 0;
  do {
    print("Do-while: contador = $contador");
    contador++;
  } while (contador < 3);

  // ============================================
  // PARTE 2: ACTIVIDAD - MEDIA, MEDIANA Y MODA
  // ============================================

  print("\n--- ESTADÍSTICAS ---");

  // Mostrar los valores originales
  print("Los valores fueron: $numeros");

  // Ordenar una copia para mostrar y calcular la mediana
  final List<int> ordenada = List.from(numeros)..sort();
  print(ordenada.join(", "));

  // Cantidad de muestras
  print("Cantidad de muestras: ${numeros.length}");

  // Calcular y mostrar media, mediana y moda
  print("Media: ${media(numeros)}");
  print("Mediana: ${mediana(numeros)}");
  print("Moda: ${moda(numeros)}");
}

// ============================================
// FUNCIONES AUXILIARES
// ============================================

// --- FUNCIÓN MEDIA ---
// Suma todos los valores y divide entre la cantidad de muestras
double media(List<int> lista) {
  if (lista.isEmpty) return 0;

  int suma = 0;
  for (int n in lista) {
    suma += n;
  }
  return suma / lista.length;
}

// --- FUNCIÓN MEDIANA ---
// Ordena la lista y toma el valor central. Si la cantidad es par, promedia los dos valores del centro.
double mediana(List<int> lista) {
  if (lista.isEmpty) return 0;

  final List<int> ordenada = List.from(lista)..sort();
  final int medio = ordenada.length ~/ 2; // División entera

  if (ordenada.length % 2 == 0) {
    // Cantidad par: promedio de los dos del centro
    return (ordenada[medio - 1] + ordenada[medio]) / 2;
  } else {
    // Cantidad impar: el valor del centro
    return ordenada[medio].toDouble();
  }
}

// --- FUNCIÓN MODA ---
// Cuenta cuántas veces aparece cada valor y devuelve el que más se repite.
int moda(List<int> lista) {
  if (lista.isEmpty) return 0;

  // Mapa para contar frecuencias: valor -> veces que aparece
  final Map<int, int> frecuencias = {};
  for (int n in lista) {
    frecuencias[n] = (frecuencias[n] ?? 0) + 1;
  }

  // Buscar el valor con mayor frecuencia
  int valorModa = lista[0];
  int maxFrecuencia = 0;

  frecuencias.forEach((valor, frecuencia) {
    if (frecuencia > maxFrecuencia) {
      maxFrecuencia = frecuencia;
      valorModa = valor;
    }
  });

  return valorModa;
}