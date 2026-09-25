//Sesion 6.A - Future
void main(){
  print("Inicio del programa");
  getHttpRequest("https://www.cesun.edu.mx").then((value) {
    print(value);
  });
  print("Fin del programa");
}


Future getHttpRequest(String url){
  return Future.delayed( Duration(seconds: 1), (){
    return "Promesa asincrona finalizada";
  } );

}


