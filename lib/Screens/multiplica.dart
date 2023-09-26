import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/counter_provider.dart';


class Multiplica extends StatefulWidget {
  const Multiplica({super.key});

  @override
  State<Multiplica> createState() => _MultiplicaState();
}




class _MultiplicaState extends State<Multiplica> {

    void _showDialog(BuildContext context, String tipo) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Multiplicación',textAlign: TextAlign.center,),
          content: Text('Multiplicaste por $tipo',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 17),),
          actions: <Widget>[
            Center(
              child: TextButton(
                child: Text('Cerrar',style: TextStyle(fontSize: 15),),
                onPressed: () {
                  Navigator.of(context).pop(); 
                },
              ),
            ),
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Center(

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [

              Expanded(
                flex: 3,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(context.watch<CounterProvider>().counter.toString(), style: const TextStyle(fontSize: 40),),
                )),
              Expanded(
                flex: 3,
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5,14,5,5),
                    child: ElevatedButton(
                      onPressed: (){
                        context.read<CounterProvider>().multiDos();
                        _showDialog(context,"2");
                      },
                      
                      child:  const Text("x2")),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                      onPressed: (){
                        context.read<CounterProvider>().multiTres();
                        _showDialog(context,"3");

                      },
                      
                      child: const Text("x3")),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                      onPressed: (){
                        context.read<CounterProvider>().multiCinco();
                        _showDialog(context,"5");

                      },
                      
                      child: const Text("x5")),
                  ),
                ],),
              ),
            ],
          ),
        ],
      )
    );
  }
}