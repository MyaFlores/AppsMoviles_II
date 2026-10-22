import 'package:flutter/material.dart';

class Counterscreen extends StatefulWidget {
  
  const Counterscreen({super.key});

  @override
  State<Counterscreen> createState() => _CounterscreenState();
}

class _CounterscreenState extends State<Counterscreen> {
  int clickCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: Center(child: const Text("Pantalla del contador")),
        actions: [
        IconButton(
          onPressed: (){
            setState(() {
            clickCounter = 0;
            });
          },
          icon: Icon(Icons.refresh_rounded)
        ),
      ],
    ),
      body: Center(
        child: Column(
          //Propiedad de la colum para centrar el texto de pantalla
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$clickCounter', style: const TextStyle(fontSize: 160, fontWeight: FontWeight.bold),),
            Text("Click${clickCounter == 1? '':'s'}", style: const TextStyle(fontSize: 25),)
          ],
        )
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton( //Boton para decrementar el contador
          shape:  const StadiumBorder(),
            onPressed: clickCounter > 0 
            ? () {
              setState(() {
                clickCounter--;
              });
            }
            : null,
            child: const Icon(Icons.exposure_minus_1),
          ),  
              const SizedBox(height: 15,),
              
          FloatingActionButton( //Boton para incrementar el contador
          shape:  const StadiumBorder(),
            onPressed: (){
              setState(() {
                clickCounter++;
              });
            },
            child: const Icon(Icons.plus_one),
              ),
        ],
      ),
   );
 }
}