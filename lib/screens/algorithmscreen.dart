import 'package:flutter/material.dart';
import '../config/database_helper.dart';
import 'basescreen.dart';
import 'algodetailsscreen.dart'; // Import the ExerciseDetailScreen

class AlgorithmsScreen extends StatefulWidget {
  @override
  _AlgorithmsScreenState createState() => _AlgorithmsScreenState();
}

class _AlgorithmsScreenState extends State<AlgorithmsScreen> {
  final dbHelper = DatabaseHelper();
  List<Map<String, dynamic>> algorithms = [];
  int displayedCount = 5; // Nombre d'algorithmes à afficher par défaut

  @override
  void initState() {
    super.initState();
    _loadAlgorithms();
  }

  Future<void> _loadAlgorithms() async {
    final List<Map<String, dynamic>> loadedAlgorithms =
        await dbHelper.getAll('algorithms');
    setState(() {
      algorithms = loadedAlgorithms;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: 'Algorithms',
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 3,
                ),
                itemCount: displayedCount < algorithms.length
                    ? displayedCount
                    : algorithms.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () {
                        // Navigate to the exercise detail page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AlgoDetailScreen(
                              title: algorithms[index]['title']!,
                              description: algorithms[index]['description']!,
                              answer: algorithms[index]['answer']!,
                              isRead: algorithms[index]['isRead'] ==
                                  1, // Convertir 1 en true et 0 en false
                            ),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Text(
                                algorithms[index]['title']!,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueAccent,
                                ),
                                textAlign: TextAlign.center,
                                overflow: TextOverflow
                                    .ellipsis, // Truncate long titles
                                maxLines: 1, // Limiter à une ligne
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Tap to view details',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[600],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            if (algorithms.length >
                displayedCount) // Afficher le bouton si nécessaire
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    displayedCount =
                        algorithms.length; // Afficher tous les algorithmes
                  });
                },
                child: Text('Afficher tout'),
              ),
          ],
        ),
      ),
    );
  }
}
