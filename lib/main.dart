// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, avoid_print, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'App ITESO'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 100;
  bool liked = false;
  bool disliked = false;
  bool status1 = true;
  bool status2 = true;
  bool status3 = true;

  void _like() {
    setState(() {
      if(liked) { // si ya le habías dado like se quita
        _counter--;
        liked = false;
      }else if(disliked) {  // si estaba en dislike se quita el dislike y se pone un like, osea se suman dos al contador
        _counter += 2;
        liked = true;
        disliked = false;
      }else{ // si no había ningun boton seleccionado  
        _counter ++;
        liked = true;
      }
    });
  }

  void _dislike() {
    setState(() {
      if(disliked) { // si ya le habías dado dislike se quita
        _counter++;
        disliked = false;
      }else if(liked) {  // si estaba en like se quita el like y se pone un dislikelike, osea se restan dos al contador
        _counter -= 2;
        disliked = true;
        liked = false;
      }else{ // si no había ningun botón seleccionado  
        _counter--;
        disliked = true;
      }
    });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      
      appBar: AppBar(


        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title, style: const TextStyle(color: Colors.white),),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Image.network('https://pbs.twimg.com/media/DburBCaVQAAM_2g.jpg:large'),
          Container(
            padding:  EdgeInsets.only(left: 15, right: 15, bottom: 15, top:25),
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [

                //Primera fila, nombre de la universidad, likes/dislikes
                Row(
                  children:  <Widget> [
                    Flexible(flex: 4, child:
                     Column(
                      
                        children: <Widget>[                              
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "El ITESO, Universidad Jesuita de Guadalajara",
                              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)
                            ),
                          ),
                          Container(
                            alignment:  Alignment.centerLeft,
                            child: Text(
                              "San Pedro, Tlaquepaque, Jal.",
                              style: TextStyle(fontSize: 10)
                            ),
                          )
                        ],
                      ),
                    ),
                    Flexible(flex:2,child: 
                       Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.thumb_up, color: liked?Colors.blueAccent:Colors.black),
                              tooltip: 'Like',
                              onPressed: () {
                                _like();
                              }
                            ),
                            IconButton(
                              icon: Icon(Icons.thumb_down, color: disliked?Colors.blueAccent:Colors.black),
                              tooltip: 'Dislike',
                              onPressed: () {
                                _dislike();
                              }
                            ),
                            Text('$_counter',
                              style: TextStyle(fontSize: 12)
                            )
                          ]
                        ),
                    )
                    
                  ],
                ),
            
                //Segunda fila botones correo, llamada, ruta
                Container(
                  padding: EdgeInsets.all(40),
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                
                      Expanded(
                
                        child: Column(
                          children: [
                            IconButton(
                              icon: Icon(Icons.mail, size:50, color: status1?Colors.black:Colors.indigo),
                              tooltip: 'Cambiar color',
                              onPressed: () {
                                setState(() {
                                  status1 = !status1;
                                });
                
                                final snackBar = SnackBar(
                                  content: const Text('Puedes encontrar comida en sus cafeterías'),
                                );
                                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              },
                            ),
                            Text("Correo",
                            style: TextStyle(fontSize: 12))
                          ],
                        ),
                      ),

                      Expanded(
                        child: Column(
                          children: [
                            IconButton(
                              icon: Icon(Icons.add_ic_call, size:50, color: status2?Colors.black:Colors.indigo),
                              tooltip: 'Cambiar color',
                              onPressed: () {
                                setState(() {
                                  status2 = !status2;
                                });
                                final snackBar = SnackBar(
                                  content: const Text('Puedes pedir información en rectoría'),
                                );
                                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              },
                            ),
                            Text("Llamada",
                            style: TextStyle(fontSize: 12))
                          ],
                        ),
                      ),
                
                      Expanded(
                        child: Column(
                          children: [
                            IconButton(
                              icon: Icon(Icons.directions, size:50, color: status3?Colors.black:Colors.indigo),
                              tooltip: 'Cambiar color',
                              onPressed: () {
                                setState(() {
                                  status3 = !status3;
                                });
                
                                final snackBar = SnackBar(
                                  content: const Text('Se encuentra ubicado en Periférico Sur 8585')
                                );
                
                                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              },
                            ),
                            Text("Ruta",
                            style: TextStyle(fontSize: 12))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // Row con el texto del ITESO
                Row(
                  children: [
                    Expanded(

                      child: Padding(
                        padding: const EdgeInsets.all(10.0),

                        child: Text(
                          "El ITESO, Universidad Jesuita de Guadalajara es una universidad privada ubicada en la Zona Metropolitana de Guadalajara, "
                          "Jalisco, México, fundada en el año 1957.La institución forma parte del Sistema Universitario Jesuita (SUJ) que integra a " 
                          "ocho universidades en México. Fundada en el año de 1957 por el ingeniero José Fernandez del Valle y Ancira, entre otros, "
                          "la universidad ha tenido una larga trayectoria.",
                        style: TextStyle(fontSize: 12),
                        textAlign: TextAlign.justify,
                        ),
                      )),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
