import 'package:cochasqui_mitad_del_mundo/widgets/fonts.dart';
import 'package:cochasqui_mitad_del_mundo/widgets/fonts_bold.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> with TickerProviderStateMixin{
  var imagenes = {
      "slider1.png" : "slider1",
      "slider2.png" : "slider2",
      "slider3.png" : "slider3",
      "icono.png" : "icono"
  };
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 60, left: 20),
            child: Row(
              children: [
                Icon(Icons.menu, size: 30, color: Colors.black),
                Expanded(child: Container()),
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey
                    
                  ),
                )
              ],
            ),
          ),
          SizedBox(height:30),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: 
            text_bold(text:'Bienvenido'),

          ),
          SizedBox(height:20),
           // tab bar
           Container(
            child: TabBar(
              controller: _tabController,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              isScrollable: true,
              dividerHeight: 0,
              indicatorColor: Colors.blueGrey,
              tabs: const [
                Tab(text: 'Piramides'),
                Tab(text: 'Informacion'),
                Tab(text: 'Camping'),
              ],
            ),

           ),
           Container(
            padding: const EdgeInsets.only(left: 20),
            height: 300,
            width: double.maxFinite,
            child: TabBarView(
            controller: _tabController,
            children: [
              ListView.builder(
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context,int index) {
                return 
                Container(
                  margin: const EdgeInsets.only(right: 15, top: 10) ,
                  width: 200,
                  height: 300,
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  image: DecorationImage(
                    image: AssetImage('assets/images/slider2.png'),
                    fit:BoxFit.cover
                  ),
                  
                ),
              );
              },
              
              ),
              //
              // Piramides
              
              // Informacion
              Center(child: Text("Contenido de Información")),
              
              // Camping
              Center(child: Text("Contenido de Camping")),
            ],
          )

            
           ),
           SizedBox(height: 30),
           Container(
            margin: const EdgeInsets.only(left: 20,right: 20),
             child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              text_bold(text: 'Mas opciones', size: 20),
              text_simple(text: 'Ver todo', color: Colors.deepPurple,)
              ],
           )
           ),
           SizedBox(height: 10),
           Container(
            height: 120,
            width: double.maxFinite,
            margin: const EdgeInsets.only(left: 20),
            child: ListView.builder(
              
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (_,index){
              return Container(
                margin: const EdgeInsets.only(right: 30),

                child: Column(
                
                children: [
                  
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    image: DecorationImage(
                      image: AssetImage('assets/images/'+imagenes.keys.elementAt(index)),
                      fit:BoxFit.cover
                    ),
                  
                    ),
                  ),
                  SizedBox(height: 5,),
                  Container(
                    child: text_simple(text: imagenes.values.elementAt(index),color:Colors.grey)
                  )
                ],
              )
              );
            }),
           )
        ],

      ),

    );
}
}

