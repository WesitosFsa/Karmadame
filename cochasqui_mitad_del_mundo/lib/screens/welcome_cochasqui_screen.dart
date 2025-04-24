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
    "Cochasqui1",
    "Cochasqui2",
    "Cochasqui3",
  ];
  List slidertextosubtitulo =[
    "Cochasqui1sub",
    "Cochasqui2sub",
    "Cochasqui3sub",
  ];
  List slidertexto =[
    "1 assadasdasd a asdasdasdas saxdasdas asdasdasdasd dsadasdasda asdasdsad asdsa dasdas sadasdas",
    "2 assadasdasd a asdasdasdas saxdasdas asdasdasdasd dsadasdasda asdasdsad asdsa dasdas sadasdas",
    "3 assadasdasd a asdasdasdas saxdasdas asdasdasdasd dsadasdasda asdasdsad asdsa dasdas sadasdas",

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
          child:Container(
            margin: const EdgeInsets.only(top: 150 , left: 20,right: 20),
            // Haremos una columna que va mostrar el texto
            child:Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    text_bold(text: slidertextotitulo[index]),
                    text_simple(text: slidertextosubtitulo[index] ,color: Colors.blueGrey,size: 30),
                    //Espacio entre el texto y el otro container
                    SizedBox(height: 20,),
                    Container(
                      width: 250,
                      child: text_simple(text: slidertexto[index]),

                    )
                  ],
                )
              ],
            )
          )
        );
      }),
    );
  }
}