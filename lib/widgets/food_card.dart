// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'icon_text.dart';
import '../screens/second_screen.dart';

class FoodCard extends StatelessWidget {
  final String title;
  final String time;
  final String serving;
  final String difficulty;
  final String img;
  bool fav = false;


  FoodCard({
    super.key,
    required this.title,
    required this.time,
    required this.serving,
    required this.difficulty,
    required this.img
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: Colors.grey,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          children: [
            //Para cortar la imagen en la card
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: 
              Image.asset(
                img, 
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover),
            ),
    
            Positioned(
              bottom: 0, //alinearlo hasta abajo del stack
              left: 0,
              right: 0,
              child: Container(
                color: Color.fromRGBO(60, 86, 99, 0.7),
                height: 80, 
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          title,
                          style: TextStyle(color: Colors.white,fontSize: 20 ),
                        )
                    ],),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(child:
                          Center(
                            child: IconTextWidget(
                              icon: Icons.timer, 
                              text: time
                            ),
                          ),
                        ),
    
                        Expanded(child:
                          Center(
                            child: IconTextWidget(
                              icon: Icons.people, 
                              text: serving
                            ),
                          ),
                        ),
    
                        Expanded(child:
                          Center(
                              child: IconTextWidget(
                              icon: Icons.work, 
                              text: difficulty
                            ),
                          ),
                        )
                        
                    ],)
                  ],)
              ),
            ),
            
          ],
        ),
      ),
      onTap: () async {
        fav = await Navigator.push(
          context,
          MaterialPageRoute(
            builder:((context)=> SecondScreen(receta: title, img: img, fav: fav)))
        );
      },


    );
  }
}