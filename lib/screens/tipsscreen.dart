import 'package:flutter/material.dart';
import '../config/database_helper.dart';
import 'basescreen.dart'; // Importez votre BaseScreen

class TipsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: 'Conseils & Meilleures Pratiques',
      body: TipsPageView(),
    );
  }
}

class TipsPageView extends StatefulWidget {
  @override
  _TipsPageViewState createState() => _TipsPageViewState();
}

class _TipsPageViewState extends State<TipsPageView> {
  final dbHelper = DatabaseHelper();

  Future<List<Map<String, dynamic>>> _loadTips() async {
    return await dbHelper.getAll('tips'); // Récupérer les conseils
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: _loadTips(), // Appel de la méthode pour charger les conseils
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Erreur: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('Aucun conseil disponible.'));
        }

        final tips = snapshot.data!;
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: tips.length > 5
                    ? 5
                    : tips.length, // Afficher 5 conseils par défaut
                itemBuilder: (context, index) {
                  return _buildTipCard(context, tips[index]['title']!,
                      tips[index]['description']!);
                },
              ),
            ),
            if (tips.length > 5) // Afficher le bouton si plus de 5 conseils
              TextButton(
                onPressed: () {
                  // Afficher tous les conseils
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Tous les Conseils'),
                        content: SizedBox(
                          width: double.maxFinite,
                          child: ListView.builder(
                            itemCount: tips.length,
                            itemBuilder: (context, index) {
                              return _buildTipCard(
                                  context,
                                  tips[index]['title']!,
                                  tips[index]['description']!);
                            },
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: Text('Fermer'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text('Afficher tous les conseils'),
              ),
          ],
        );
      },
    );
  }

  Widget _buildTipCard(BuildContext context, String title, String description) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ExpansionTile(
        title: Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              description,
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
          ),
        ],
        trailing: Icon(Icons.expand_more),
      ),
    );
  }
}
