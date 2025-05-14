import 'package:cochasqui_mitad_del_mundo/screens/welcome_cochasqui_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cochasqui Desarrollo',
      // Sirve para quitar el debug en en la parte de desarrollo
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WelcomeCochasquiScreen(),
      
    );
  }
}


