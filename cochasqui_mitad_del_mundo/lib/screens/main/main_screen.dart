import 'package:cochasqui_mitad_del_mundo/screens/main/home_screen.dart';
import 'package:cochasqui_mitad_del_mundo/screens/main/map_screen.dart';
import 'package:cochasqui_mitad_del_mundo/screens/main/museum_screen.dart';
import 'package:cochasqui_mitad_del_mundo/screens/main/profile_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> {
  List  screens = [
    HomeScreen(),
    MuseumScreen(),
    MapScreen(),
    ProfileScreen()
  ];
  int currentIndex=0;
  void onTap(int index){
    setState(() {
      currentIndex = index;
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: screens[currentIndex],
      backgroundColor: Color(0xFFECEBE9),
      bottomNavigationBar: BottomNavigationBar(

        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: const Color.fromARGB(185, 109, 109, 109),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        items:[
          BottomNavigationBarItem(label: "Menu",icon: Icon(Icons.dashboard_customize)),
          BottomNavigationBarItem(label: "MuseoAR",icon: Icon(Icons.view_in_ar)),
          BottomNavigationBarItem(label: "Mapa",icon: Icon(Icons.map)),
          BottomNavigationBarItem(label: "Perfil",icon: Icon(Icons.person)),
        ]

      ),
    );
  }
}