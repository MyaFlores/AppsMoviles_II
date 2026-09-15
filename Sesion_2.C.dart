// Sesion 2.C - Listas

void main(){
  final numeros = <int>[4,5,6,7,8,9];
  print("Lista de numeros: $numeros");
  print("Longitud: ${numeros.length}");
  print("El valor 0 de la lista es: ${numeros[0]}");
  print("El ultimo valor es ${numeros[numeros.length -1]}");
  
  print("El ultimo valor es: ${numeros.last}");
  print("El primer valor es: ${numeros.first}");
  print("Reversed: ${numeros.reversed}");
  final numerosReversed = numeros.reversed;
  print("Reversed to list: ${numerosReversed.toList()}");
  print("Reversed to sed: ${numerosReversed.toSet()}");
  
  //Uso de filtros
  final numerosGrandes = numeros.where((int numero){
    return numero > 5;
  });
  print("Numeros grandes: $numerosGrandes");
}