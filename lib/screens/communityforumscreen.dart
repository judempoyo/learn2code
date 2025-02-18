import 'package:flutter/material.dart';

class BaseScreen extends StatelessWidget {
  final String title;
  final Widget body;

  BaseScreen({required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Implement search functionality
            },
          ),
        ],
      ),
      body: body,
    );
  }
}

class ForumScreen extends StatefulWidget {
  @override
  _ForumScreenState createState() => _ForumScreenState();
}

class _ForumScreenState extends State<ForumScreen> {
  String _searchQuery = '';
  final List<Map<String, dynamic>> _categories = [
    {
      'title': 'Discussion Générale',
      'posts': [
        'Quelles sont vos attentes pour cette communauté?',
        'Comment avez-vous commencé votre projet?',
        'Partagez vos astuces de productivité!',
      ],
    },
    {
      'title': 'Aide & Support',
      'posts': [
        'Comment résoudre une erreur de compilation?',
        'Besoin d’aide pour configurer mon environnement.',
        'Questions fréquentes sur l’utilisation de l’application.',
      ],
    },
    {
      'title': 'Vitrine de Projets',
      'posts': [
        'Découvrez mon projet de gestion de tâches!',
        'Partagez vos projets et obtenez des retours.',
        'Comment j’ai créé mon application de recettes.',
      ],
    },
    {
      'title': 'Annonces',
      'posts': [
        'Mise à jour de la version 2.0 de l’application.',
        'Prochain événement de la communauté!',
        'Nouveau partenariat avec XYZ.',
      ],
    },
    {
      'title': 'Événements',
      'posts': [
        'Rejoignez-nous pour notre prochain webinaire!',
        'Atelier de développement mobile le 15 juin.',
        'Conférence annuelle sur la technologie.',
      ],
    },
    {
      'title': 'Feedback',
      'posts': [
        'Vos retours sur la dernière mise à jour.',
        'Comment améliorer l’expérience utilisateur?',
        'Suggestions pour de nouvelles fonctionnalités.',
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: 'Forum Communautaire',
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildSearchBar(),
            SizedBox(height: 16),
            Expanded(
              child: _buildForumCategories(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      onChanged: (query) {
        setState(() {
          _searchQuery = query.toLowerCase();
        });
      },
      decoration: InputDecoration(
        hintText: 'Rechercher dans le forum...',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(color: Colors.grey),
        ),
        prefixIcon: Icon(Icons.search),
      ),
    );
  }

  Widget _buildForumCategories() {
    final filteredCategories = _categories.where((category) {
      // Check if the category title matches the search query
      if (category['title'].toLowerCase().contains(_searchQuery)) {
        return true;
      }
      // Check if any post in the category matches the search query
      return category['posts']
          .any((post) => (post as String).toLowerCase().contains(_searchQuery));
    }).toList();

    return ListView.builder(
      itemCount: filteredCategories.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 4,
          margin: EdgeInsets.symmetric(vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ExpansionTile(
            title: Text(
              filteredCategories[index]['title'],
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            leading: Icon(Icons.forum, color: Colors.blue),
            children: filteredCategories[index]['posts']
                .where((post) =>
                    (post as String).toLowerCase().contains(_searchQuery))
                .map<Widget>((post) {
              return ListTile(
                title: Text(post),
                onTap: () {
                  // Navigate to the selected post's discussion
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
