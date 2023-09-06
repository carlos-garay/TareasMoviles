
import 'package:flutter/material.dart';

class ItemActividad extends StatelessWidget {
  final String day;
  final String place;
  final String img;

  ItemActividad({super.key,required  this.day,required  this.place, required this.img});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              color: Colors.purple,
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(img),
                fit: BoxFit.fill,
              )
            ),
          ),
          Text(day, style: TextStyle(fontSize: 11)),
          Text(place),
        ],
      ),
    );
  }
}
