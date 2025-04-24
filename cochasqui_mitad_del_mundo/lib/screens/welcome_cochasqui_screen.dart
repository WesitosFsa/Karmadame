import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class WelcomeCochasquiScreen extends StatefulWidget {
  const WelcomeCochasquiScreen({Key? key}) : super(key:key);
  @override
  State<WelcomeCochasquiScreen> createState() => _WelcomeCochasquiScreen();
}

class _WelcomeCochasquiScreen extends State<WelcomeCochasquiScreen> {
  //Creamos el slider de bienvenida de la pagina
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
        );
      }),
    );
  }
}