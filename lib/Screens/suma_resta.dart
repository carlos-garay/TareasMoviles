import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/counter_provider.dart';



class SumaResta extends StatefulWidget {
  const SumaResta({super.key});

  @override
  State<SumaResta> createState() => _SumaRestaState();
}

class _SumaRestaState extends State<SumaResta> {
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          //CAMBIO DE JUSTO DEBAJO DEL NÚMERO O HASTA ABAJO DE LA COLUMN
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(context.watch<CounterProvider>().counter.toString(), style: const TextStyle(fontSize: 40),),
            
            Padding(
              padding: const EdgeInsets.fromLTRB(50,0,50,5),
              child: Row(children: [

                ElevatedButton(
                  onPressed: (){
                    context.read<CounterProvider>().increment();
                  },
                  
                  child:  const Icon(Icons.arrow_upward)),
                Expanded(child: Container()),
                ElevatedButton(
                  onPressed: (){
                    context.read<CounterProvider>().decrement();
                  },
                  
                  child: const Icon(Icons.arrow_downward)),
                Expanded(child: Container()),
                ElevatedButton(
                  onPressed: (){
                    context.read<CounterProvider>().reset();
                  },
                  
                  child: const Icon(Icons.refresh)),
              ],),
            )

          ],
        ),
      )
    );
  }
}
