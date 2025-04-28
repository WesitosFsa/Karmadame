import 'package:cochasqui_mitad_del_mundo/screens/login_cochasqui_screen.dart';
import 'package:cochasqui_mitad_del_mundo/widgets/buttonR.dart';
import 'package:cochasqui_mitad_del_mundo/widgets/fonts.dart';
import 'package:cochasqui_mitad_del_mundo/widgets/fonts_bold.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class WelcomeCochasquiScreen extends StatefulWidget {
  const WelcomeCochasquiScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeCochasquiScreen> createState() => _WelcomeCochasquiScreen();
}

class _WelcomeCochasquiScreen extends State<WelcomeCochasquiScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  List slidertextotitulo = [
    "Bienvenido al Parque",
    "Mapa Interactivo",
    "Realidad Aumentada",
  ];
  List slidertextosubtitulo = [
    "Arqueologico Cochasqui",
    "Disfruta del Camino",
    "Experiencia inmersiva",
  ];
  List slidertexto = [
    "Te damos una cordial bienvenida a la aplicacion del parque cochasqui...",
    "Mediante el mapa interactivo podras recorrer cada una de la rutas...",
    "Disfruta de modelos 3d sobre las piramides y los objetos del museo...",
  ];
  List sliderimagenes = [
    "slider1.png",
    "slider2.png",
    "slider3.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.horizontal,
        itemCount: sliderimagenes.length,
        onPageChanged: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        itemBuilder: (_, index) {
          return Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/" + sliderimagenes[index]),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      text_bold(text: slidertextotitulo[index]),
                      text_simple(
                          text: slidertextosubtitulo[index],
                          color: Colors.blueGrey,
                          size: 30),
                      SizedBox(height: 20),
                      Container(
                        width: 250,
                        child: text_simple(text: slidertexto[index]),
                      ),
                      SizedBox(height: 20),
                      ButtonR(
                        width: 120,
                        showIcon: _currentPage < 2,
                        
                        text: _currentPage < 2 ? null : "Empezar",
                        onTap: () {
                          if (_currentPage < 2) {
                            _pageController.animateToPage(
                              _currentPage + 1,
                              duration: Duration(milliseconds: 400),
                              curve: Curves.easeInOut,
                            );
                          } else {
                            // TODO: Navegar a la pantalla de inicio de sesión
                            Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => LoginCochasquiScreen()),
                             );
                          }
                        },
                      ),
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
                          height: _currentPage == indexDots ? 25 : 8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: _currentPage == indexDots
                                ? Colors.black
                                : const Color.fromARGB(158, 48, 48, 48),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
