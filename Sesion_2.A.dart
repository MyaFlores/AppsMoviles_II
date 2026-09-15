// Sesion 2.A - Tipos de datos dinamicos

void main() {
  dynamic myVar = "Scott Summers";
  print("El valor de myVar es: $myVar");
  myVar = 5;
  print("El valor de myVar es: $myVar");
  myVar = [1,2,3,4,5,6];
  print("El valor de myVar es: $myVar");
  myVar = ()=>{true};
  print("El valor de myVar es: $myVar");
  myVar = null;
  print("El valor de myVar es: $myVar");

}