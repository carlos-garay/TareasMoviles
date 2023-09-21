import 'package:flutter/material.dart';

//Widget que incluye un icono junto a un texto
class IconTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final double iconSize;
  final TextStyle textStyle;

  const IconTextWidget({
    required this.icon,
    required this.text,
    this.iconSize = 20.0,
    this.textStyle = const TextStyle(color: Colors.white),

  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: iconSize,
          color: Colors.white,
        ),
        SizedBox(width: 8), // Add spacing between the icon and text
        Text(
          text,
          style: textStyle,
        ),
      ],
    );
  }
}