// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:tarea3_5/widgets/food_card.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Asian Recipes'),
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

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.blueGrey,
        title: Center(child: Text(widget.title, style: TextStyle(color: Colors.white))),
      ),
      backgroundColor: Color.fromARGB(255, 211, 231, 243),
      body: SafeArea(
        top: true,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
          child: SingleChildScrollView(
            child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    FoodCard(
                      title: 'Pork & Chive Dumplings',
                      time: '30 mins',
                      serving: '2 people',
                      difficulty: 'Simple', 
                      img: 'assets/images/dumplings.jpg'
                    ),
                    FoodCard(
                      title: 'Japanese Chicken Curry',
                      time: '1 hr 15 mins',
                      serving: '4 people',
                      difficulty: 'Medium', 
                      img: 'assets/images/curry.jpg'
                    ),
                    FoodCard(
                      title: 'Garlic Prawn Udon',
                      time: '15 mins',
                      serving: '2 people',
                      difficulty: 'Simple', 
                      img: 'assets/images/udon.jpg'
                    ),

                    FoodCard(
                      title: 'Fried Rice with Pork',
                      time: '30 mins',
                      serving: '4 people',
                      difficulty: 'Simple', 
                      img: 'assets/images/rice.jpg'
                    ),

                  ],
            ),
          ),
        ),
      ),
    );
  }
}
