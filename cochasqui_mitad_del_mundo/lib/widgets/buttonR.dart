import 'package:flutter/material.dart';

class ButtonR extends StatelessWidget {
  bool? isResponsive;
  //Esto es opcional puede que se eapruebe o no se pone estos parametros porque vamos a utilizar el boton en varias partes de la app
  double? width;
  ButtonR({Key? key
  ,this.width, this.isResponsive=false}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(186, 83, 157, 226)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/icono.png")
        ],
      ),
    );
  }
}