import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math';
import 'dart:ui'; // Importer pour utiliser BackdropFilter
import 'dart:async'; // Importer pour utiliser Timer

import '../providers/settingsprovider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController _triangleController;
  late Animation<double> _triangleAnimation;
  List<Offset> _positions = [];
  List<bool> _visible = [];
  List<Offset> _trianglePositions = [];
  List<double> _sizes = []; // Pour stocker les tailles des figures

  @override
  void initState() {
    super.initState();
    _initializeFigures();

    _triangleController = AnimationController(
      duration: const Duration(seconds: 120),
      vsync: this,
    )..repeat(reverse: true);

    _triangleAnimation =
        Tween<double>(begin: 0, end: 10).animate(_triangleController)
          ..addListener(() {
            setState(() {
              for (int i = 0; i < _trianglePositions.length; i++) {
                _trianglePositions[i] = Offset(
                  _trianglePositions[i].dx,
                  _trianglePositions[i].dy +
                      (_triangleAnimation.value * (i % 2 == 0 ? 1 : -1)),
                );
              }

              for (int i = 0; i < _positions.length; i++) {
                _positions[i] = Offset(
                  _positions[i].dx,
                  _positions[i].dy +
                      (_triangleAnimation.value * (i % 2 == 0 ? 1 : -1)),
                );
              }
            });
          });
  }

  void _initializeFigures() {
    for (int i = 0; i < 10; i++) {
      _positions.add(
          Offset(Random().nextDouble() * 300, Random().nextDouble() * 600));
      _visible.add(true);
      _sizes.add(50.0); // Taille initiale des figures
    }

    for (int i = 0; i < 5; i++) {
      _trianglePositions.add(
          Offset(Random().nextDouble() * 300, Random().nextDouble() * 600));
    }
  }

  void _removeFigure(int index) {
    setState(() {
      _visible[index] = false;
    });

    // Réapparaître après 2 secondes
    Timer(Duration(seconds: 2), () {
      setState(() {
        _visible[index] = true; // Réactive la figure
        _sizes[index] = 50.0; // Réinitialiser la taille
      });
    });
  }

  @override
  void dispose() {
    _triangleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final settingsProvider = Provider.of<SettingsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Page d\'Accueil'),
        backgroundColor: settingsProvider.primaryColor,
      ),
      body: Stack(
        children: [
          // Arrière-plan avec dégradé linéaire et transparence
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  settingsProvider.primaryColor
                      .withOpacity(0.7), // Couleur avec transparence
                  settingsProvider.accentColor
                      .withOpacity(0.7), // Couleur avec transparence
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          // Triangles
          for (int i = 0; i < _trianglePositions.length; i++)
            Positioned(
              left: _trianglePositions[i].dx,
              top: _trianglePositions[i].dy,
              child: CustomPaint(
                size: Size(0, 0),
                painter: TrianglePainter(
                  color: settingsProvider.primaryColor.withOpacity(0.1),
                ),
              ),
            ),
          // Cercles visibles avec transparence
          for (int i = 0; i < _positions.length; i++)
            if (_visible[i])
              Positioned(
                left: _positions[i].dx,
                top: _positions[i].dy,
                child: GestureDetector(
                  onTap: () => _removeFigure(i),
                  child: Container(
                    width: _sizes[i], // Utiliser la taille dynamique
                    height: _sizes[i], // Utiliser la taille dynamique
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: settingsProvider.accentColor
                          .withOpacity(0.5), // Ajout de transparence
                    ),
                  ),
                ),
              ),
          Align(
            alignment: Alignment.topRight,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Container(
                padding: EdgeInsets.all(8),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.settings, size: 40),
                      onPressed: () {
                        Navigator.pushNamed(context, "/settings");
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.info, size: 40),
                      onPressed: () {
                        Navigator.pushNamed(context, "/about");
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width:
                  MediaQuery.of(context).size.width * 0.75, // 75% de la largeur
              padding: EdgeInsets.only(top: 20, bottom: 20), // Padding vertical
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 150, // Agrandir la taille de l'image
                    height: 150, // Agrandir la taille de l'image
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/images/judepic.png'),
                        fit: BoxFit.cover,
                      ),
                      border: Border.all(color: Colors.white, width: 4),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => GridPage()),
                      );
                    },
                    child: Text('Ouvrir'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      backgroundColor:
                          settingsProvider.primaryColor, // Couleur du texte
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GridPage extends StatelessWidget {
  final List<String> pages = [
    'Page 1',
    'Page 2',
    'Page 3',
    'Page 4',
    'Page 5',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2,
        ),
        itemCount: pages.length,
        itemBuilder: (context, index) {
          return Card(
            child: Center(
              child: Text(
                pages[index],
                style: TextStyle(fontSize: 20),
              ),
            ),
          );
        },
      ),
    );
  }
}

// CustomPainter for drawing a triangle
class TrianglePainter extends CustomPainter {
  final Color color;

  TrianglePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(20, 40);
    path.lineTo(-20, 40);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
