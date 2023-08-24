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
      home: const MyHomePage(title: 'McFlutter'),
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

    bool status1 = true;
    bool status2 = true;
    bool status3 = true;
    bool status4 = true;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(


        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title, style: const TextStyle(color: Colors.white),),
      ),
      body: Center(

        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                padding:  EdgeInsets.all(5),
        
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child:  Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget> [

                    //Primera fila, ícono, columna nombre y título
                    Row(
                      children:  <Widget> [
                        Flexible(flex: 2, child:
                          Container(alignment:Alignment.centerRight,
                            child: Icon(Icons.account_circle,size:50)),
                        ),
                        Flexible(flex:4,child: 
                          Column(
                            children: <Widget>[                              
                              Text(
                                "Flutter McFlutter",
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
                              ),
                              Text(
                                "Experienced App Developer",
                                style: TextStyle(fontSize: 12)
                              )
                            ],
                          ),
                        )
                        
                      ],
                    ),
                
                    //Segunda fila, dirección y número
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerLeft, 
                            child: Text(
                              "123 Main Street",
                              style: TextStyle(fontSize: 12)
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerRight, 
                            child: Text(
                              "(415) 555-0198",
                              style: TextStyle(fontSize: 12)
                            ),
                          ),
                        )
                      ],
                    ),

                    //Tercera fila IconButtons
                    Row(
                      children: [

                        Expanded(
                          child: IconButton(
                            icon: Icon(Icons.accessibility_new,color: status1?Colors.black:Colors.indigo),
                            tooltip: 'Cambiar color',
                            onPressed: () {
                              setState(() {
                                status1 = !status1;
                              });

                              final snackBar = SnackBar(
                                content: const Text('Botón persona'),
                                action: SnackBarAction(
                                  label: 'Cerrar',
                                  onPressed: () {
                                  },
                                ),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            },
                          ),
                        ),

                        Expanded(
                          child: IconButton(
                            icon: Icon(Icons.timer,color: status2?Colors.black:Colors.indigo),
                            tooltip: 'Cambiar color',
                            onPressed: () {
                              setState(() {
                                status2 = !status2;
                              });
                              final snackBar = SnackBar(
                                content: const Text('Botón timer'),
                                action: SnackBarAction(
                                  label: 'Cerrar',
                                  onPressed: () {
                                  },
                                ),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            },
                          ),
                        ),

                        Expanded(
                          child: IconButton(
                            icon: Icon(Icons.phone_android,color: status3?Colors.black:Colors.indigo),
                            tooltip: 'Cambiar color',
                            onPressed: () {
                              setState(() {
                                status3 = !status3;
                              });

                              final snackBar = SnackBar(
                                content: const Text('Botón celular'),
                                action: SnackBarAction(
                                  label: 'Cerrar',
                                  onPressed: () {
                                  },
                                ),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);

                            },
                          ),
                        ),

                        Expanded(
                          child: IconButton(
                            icon: Icon(Icons.local_phone,color: status4?Colors.black:Colors.indigo),
                            tooltip: 'Cambiar color',
                            onPressed: () {
                              setState(() {
                                status4 = !status4;
                              });

                              final snackBar = SnackBar(
                                content: const Text('Botón telefono'),
                                action: SnackBarAction(
                                  label: 'Cerrar',
                                  onPressed: () {
                                  },
                                ),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);

                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
