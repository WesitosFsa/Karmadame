import 'package:flutter/material.dart';

class text_simple extends StatelessWidget {
  //Tamaño del texto
  double size;
  final String text;
  final Color color;

  text_simple({Key? key, 
  this.size=16,
  required this.text,
  this.color=const Color.fromARGB(73, 0, 0, 0)}) : super(key:key);
  
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: color,
      ),
    );
  }
}