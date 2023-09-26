import 'package:flutter/material.dart';
import 'package:provider_test/Screens/suma_resta.dart';
import 'package:provider/provider.dart';
import '../Providers/counter_provider.dart';


import 'Screens/multiplica.dart';
import 'Screens/primo.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedPage = 0;

  final List<Widget> _pages = [
    const SumaResta(),
    const Multiplica(),
    const Primo()
  ];
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: _pages[_selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPage,
        onTap: (int index){
          setState(() {
            _selectedPage = index;
            context.read<CounterProvider>().prime();
          });
        }, 
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.one_k), label: "Suma"),
          BottomNavigationBarItem(icon: Icon(Icons.one_k), label: "Multiplica"),
          BottomNavigationBarItem(icon: Icon(Icons.one_k), label: "Primo"),

        ]
        ),

    );
  }
}


