import 'package:cochasqui_mitad_del_mundo/widgets/fonts_bold.dart';
import 'package:flutter/material.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final GlobalKey _imageKey = GlobalKey();
  final TransformationController _transformationController = TransformationController();
  bool _showNote = true; // mostrar la nota al iniciar
  //ubicaciones
  List<Map<String, dynamic>> piramides = [
    {"x": 0.75, "y": 0.27, "nombre": "Pirámide 1", "color": Colors.blue},
    {"x": 0.55, "y": 0.38, "nombre": "Pirámide 2", "color": Colors.red},
    {"x": 0.37, "y": 0.50, "nombre": "Pirámide 3", "color": Colors.black},
    {"x": 0.29, "y": 0.29, "nombre": "Pirámide 4", "color": Colors.purple},
  ];

  void expandZoom() {
    setState(() {
      _transformationController.value = Matrix4.identity()..scale(2.0);
    });
  }
  void resetZoom() {
    setState(() {
      _transformationController.value = Matrix4.identity();
    });
  }
  void reloadMap() {
    setState(() {
      _transformationController.value = Matrix4.identity();
      _showNote = false; // cerrar la nota al recargar
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Stack(
        children: [
          
          Container( 
            padding: EdgeInsets.only(left: 80,top: 50),
            child: text_bold(text: 'Mapa Cochasqui') ),
          Center(
            child: InteractiveViewer(
              transformationController: _transformationController,
              maxScale: 5.0,
              minScale: 1.0,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Stack(
                    children: [
                      Image.asset(
                        "assets/images/mapa2.png",
                        key: _imageKey,
                        fit: BoxFit.contain,
                      ),
                      ...piramides.map((pir) {
                        return FutureBuilder(
                          future: Future.delayed(Duration.zero, () {
                            final RenderBox renderBox = _imageKey.currentContext?.findRenderObject() as RenderBox;
                            return renderBox.size;
                          }),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) return const SizedBox.shrink();
                            final Size imageSize = snapshot.data as Size;
                            final left = imageSize.width * pir['x'];
                            final top = imageSize.height * pir['y'];

                            return Positioned(
                              left: left,
                              top: top,
                              child: GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (_) => AlertDialog(
                                      content: Text(pir['nombre']),
                                    ),
                                  );
                                },
                                child: Icon(Icons.terrain, size: 30, color: pir['color']),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ],
                  );
                },
              ),
            ),
          ),
          if (_showNote)
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.6,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      child: SingleChildScrollView(
                        child: Text(
                          "Información importante sobre el mapa:\n\n"
                          "Este mapa muestra las pirámides de Cochasquí con sus ubicaciones aproximadas. "
                          "Puedes hacer zoom para ver más detalles o tocar cada pirámide para obtener información específica.\n\n"
                          "Las coordenadas están basadas en estudios arqueológicos recientes.",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: reloadMap,
                      child: const Text('Cerrar y Ver mapa'),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FloatingActionButton(
                onPressed: resetZoom,
                child: const Icon(Icons.zoom_out_map),
                heroTag: 'resetZoom',
              ),
              const SizedBox(width: 10),
              FloatingActionButton(
                onPressed: expandZoom,
                child: const Icon(Icons.zoom_in_map),
                heroTag: 'expandZoom',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
