//Seción 2 - Continuacion de tipos de datos

void main() {
  final int edad = 28;
  final double peso = 5.5;
  final String nombre = "Emma Frost";
  final bool esAlumno = true;

  // final materias = ["Patrones de diseño", "Aplicaciones moviles I", "Aplicaciones moviles II"];
  final List<String> materias = [
    "Patrones de diseño",
    "Aplicaciones moviles I",
    "Aplicaciones moviles II",
  ];

  // final materias = <String>["Patrones de diseño", "Aplicaciones moviles I", "Aplicaciones moviles II"];

  print("""
  Edad: $edad
  Peso: $peso
  Nombre: $nombre
  Es alumno : $esAlumno
  """);
  print("Materias: $materias");
  print("Materia: ${materias[0]}");
  print("Materia: ${materias[1]}");
  print("Materia: ${materias[2]}");
  print("Materia: ${materias[3]}");
}
