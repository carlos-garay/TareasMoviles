// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, avoid_print, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:tarea2_5/my_textfield.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Tip Time'),
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
  final myController = TextEditingController();
  
  double _serviceCost = 0;
  double _tipPercent = 0;
  double _tipAmount = 0;
  bool _switch = false;
  int _value = 1;
  String _tipDisplayed = "0";

  calculateTip(){
    setState(() {
      _serviceCost = double.parse(myController.text);
      if(_value == 1){
        _tipPercent = 0.20;
      }else if (_value == 2){
        _tipPercent = 0.18;
      }else{
        _tipPercent = 0.15;
      }

      _tipAmount = _serviceCost * _tipPercent;
      
      if(_switch){
        _tipAmount = _tipAmount.ceil().toDouble() ;
      }

      //Mostrar solo dos decimales
      _tipDisplayed = _tipAmount.toStringAsFixed(2);

    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title, style:TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(children: [
            //Row con text field para agregar costo del servicio
            Row(children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Icon(Icons.store_mall_directory,color: Colors.green,),
              ),
                //Text field decorado que acepta el controllador para leer el input
              MyTextField(myController: myController) 
            ],),
      
            //Row con texto servicio
            Row(children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Icon(Icons.room_service, color: Colors.green),
              ),
              Text("How was the service?", style: TextStyle(fontSize: 17),),
            ],),
        
            //Row con radio buttons para agregar propina
            Row(children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RadioListTile(
                        value: 1,
                        groupValue: _value,
                        onChanged: (val){
                          setState(() {
                            _value = val!;
                          });
                        },
                        activeColor: Colors.blue,
                        title: Text("Amazing (20%)"),
                      ),
              
                      RadioListTile(
                        value: 2,
                        groupValue: _value,
                        onChanged: (val){
                          setState(() {
                            _value = val!;
                          });
                        },
                        activeColor: Colors.blue,
                        title: Text("Good (18%)"),
                      ),
              
                      RadioListTile(
                        value: 3,
                        groupValue: _value,
                        onChanged: (val){
                          setState(() {
                            _value = val!;
                          });
                        },
                        activeColor: Colors.blue,
                        title: Text("Okay (15%)"),
                      )
                    ]
                  ),
                ),
              )
            ],),
      
            //Switch redondeo
            Row(children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Icon(Icons.north_east, color: Colors.green),
              ),
              Text("Round up tip?", style:TextStyle(fontSize: 17)),
              Expanded(child: Container()),
      
              Switch(
                value: _switch,
                activeColor: Colors.blue,
                onChanged: (bool value) {
                  setState(() {
                    _switch = value;
                  });
                },
              ),
              SizedBox(width: 30,),
            ],),
      
            //Boton calcular
            SizedBox(height:30),
            Row(children: [
              Expanded(child: Container()),
              SizedBox(
                width: 300,
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20, color:Colors.white),
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero
                  )
                ),
                onPressed: () {
                  calculateTip();
                },
                child: const Text('CALCULATE',style: TextStyle(fontSize: 17, color:Colors.white)),
                ),
              ),
              Expanded(child: Container()),
            ],),
      
            SizedBox(height:30),

            //Row el valor de la propina 
            Row(children: [
              Expanded(child:Container()),
              Text("Tip Amount: \$$_tipDisplayed"),
              SizedBox(width: 30,)
            ],),
          ],),
        ),
      ),
    );
  }
}
