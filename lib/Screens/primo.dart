import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/counter_provider.dart';



class Primo extends StatefulWidget {
  const Primo({super.key});

  @override
  State<Primo> createState() => _PrimoState();
}

class _PrimoState extends State<Primo> {

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            context.watch<CounterProvider>().isPrime? "Es primo": "No es primo", 
           
            style:  context.watch<CounterProvider>().isPrime? 
              const TextStyle(
              fontSize: 40,
              color:  Colors.green):
              
              const TextStyle(
              fontSize: 40,
              color:  Colors.blue)
          )
        ]),
    );
  }
  
}