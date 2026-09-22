//Sesion05
//Clases, asserts, constructores, constructores nombrados, sobreescritura, setters y getters

void main() {
  // Personaje heroe = Personaje(
  //   clase: "Arquero",
  //   nombre: "Julian",
  //   _vida: -100,
  //   stamina: 100,
  //   escudo: 100,
  // );

  Map<String, dynamic> personajeJson = {
    "clase" : "Hechizero",
    "nombre": "Gandalf",
    "vida": 200,
    "stamina": 300,
    "escudo": 50
  };
  Personaje heroe2 = Personaje.fromJson(personajeJson);
  // print(heroe.nombre);
  // print(heroe.escudo);
  // print(heroe);
  print("Heroe 2\n");
  print(heroe2);
  print(heroe2.vida);
  heroe2.vida = 300;
  print(heroe2.vida);
}

class Personaje {
  final String nombre;
  final String clase;
  int _vida;
  final int stamina;
  final int escudo;


  Personaje.fromJson(Map<String, dynamic> personajeJson):
    nombre = personajeJson["nombre"]??"Sin nombre",
    clase = personajeJson["clase"]??"Sin clase",
    _vida = personajeJson["vida"]??0,
    stamina = personajeJson["stamina"]??0,
    escudo = personajeJson["escudo"]??0;

  // Personaje({
  //   required this.clase,
  //   required this.nombre,
  //   required this._vida,
  //   required this.stamina,
  //   required this.escudo,
  // });

  int get vida => this._vida;

  set vida(int cantidad){
    if (cantidad < 0){
      print("La vidad no puede ser negativa");
      return;
    }
    this._vida = cantidad;
    
  }

  @override
  toString() =>
      "Nombre: " +
      this.nombre +
      "\nClase: " +
      this.clase +
      "\nVida: " +
      this._vida.toString();


}
