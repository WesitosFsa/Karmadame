import 'package:cochasqui_mitad_del_mundo/widgets/buttonR.dart';
import 'package:cochasqui_mitad_del_mundo/widgets/fonts.dart';
import 'package:cochasqui_mitad_del_mundo/widgets/fonts_bold.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class WelcomeCochasquiScreen extends StatefulWidget {
  const WelcomeCochasquiScreen({Key? key}) : super(key:key);
  @override
  State<WelcomeCochasquiScreen> createState() => _WelcomeCochasquiScreen();
}

class _WelcomeCochasquiScreen extends State<WelcomeCochasquiScreen> {
  //Creamos el slider de bienvenida de la pagina
  List slidertextotitulo =[
    "Bienvenido al Parque",
    "Mapa Interactivo",
    "Realidad Aumentada",
  ];
  List slidertextosubtitulo =[
    "Arqueologico Cochasqui",
    "Disfruta del Camino",
    "Experiencia inmersiva",
  ];
  List slidertexto =[
    "Te damos una cordial bienvenida a la aplicacion del parque cochasqui en esta aplicacion podras hacer las siguientes actividades",
    "Mediante el mapa interactivo podras recorrer cada una de la rutas y mirar cada una de estas piramides e informate sobre la cultura caranqui",
    "Disfruta de modelos 3d sobre las piramides y los objetos del museo para interactuar y ver informacion de estos",

  ];
  List sliderimagenes =[
    "slider1.png",
    "slider2.png",
    "slider3.png",

  ];
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        //Direccion dde el slider en este caso horizontal
        scrollDirection: Axis.horizontal,
        //Cuantos items vamos a tener en nuestro slider
        itemCount: sliderimagenes.length,
        // se ejeecutara desde 0 y recorrera la lista de imagenes
        itemBuilder: (_, index){
        //lOS ELEMENTOS Y EL ALTO Y MAXIMO DE LA PANTALLA
        return Container(
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                    "assets/images/"+sliderimagenes[index]
               
              ),
              //cubra toda la pantalla
              fit: BoxFit.cover
              )
          ),
          //Texto en mi imagen
          child: Stack(
          children: [
              Container(
                margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    text_bold(text: slidertextotitulo[index]),
                    text_simple(text: slidertextosubtitulo[index], color: Colors.blueGrey, size: 30),
                    SizedBox(height: 20),
                    Container(
                      width: 250,
                      child: text_simple(text: slidertexto[index]),
                    ),
                    SizedBox(height: 20),
                    ButtonR(width: 120),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(3, (indexDots) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: 8,
                        height: index == indexDots ? 25 : 8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: index == indexDots
                              ? Colors.white
                              : const Color.fromARGB(158, 255, 255, 255),
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ],
          ),

        );
      }),
    );
  }
}