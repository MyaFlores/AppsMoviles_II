// Sesion 2.B - Mapas

void main() {
  final Map <String, dynamic> persona = {
    "edad": 25, 
    "nombre": "Emma Forst",
    "peso": 62.5,
    "mutante": true,
    "academias": {
      0: "Academia Massachussets",
      1: "Academia X-men"
    },
    "poderes": <String>["Control mental", "Ilusiones", "Ataques psiquicos"]
  };
  print("Persona es: $persona");
  print("Edad: ${persona["edad"]}");
  print("Nombre: ${persona["nombre"]}");
  print("Academia 1: ${persona["academias"][0]}");
  print("Academia 2: ${persona["academias"][1]}");
  print("Poder 1: ${persona["poderes"][0]}");
  print("Poder 2: ${persona["poderes"][1]}");
  print("Poder 3: ${persona["poderes"][2]}");

}
