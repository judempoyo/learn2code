import 'package:flutter/material.dart';
import 'basescreen.dart'; // Importez votre BaseScreen

class LanguagesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: 'Langages de Programmation',
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          _buildLanguageCard(
              context,
              'Python',
              'Un langage de programmation de haut niveau connu pour sa lisibilité et sa polyvalence.',
              'Créé à la fin des années 1980 par Guido van Rossum.',
              'Facile à apprendre, polyvalent, grande communauté.',
              'Plus lent que certains langages compilés, pas idéal pour le développement mobile.',
              'Développement web, science des données, automatisation, IA.',
              'Django, Flask, Pandas, NumPy',
              'print("Hello, World!")'),
          _buildLanguageCard(
              context,
              'Java',
              'Un langage de programmation orienté objet largement utilisé, conçu pour avoir le moins de dépendances d\'implémentation possible.',
              'Développé par Sun Microsystems en 1995.',
              'Indépendant de la plateforme, fort soutien communautaire.',
              'Syntaxe verbeuse, plus lent que les langages natifs.',
              'Applications d\'entreprise, développement Android.',
              'Spring, Hibernate, JavaFX',
              'System.out.println("Hello, World!");'),
          _buildLanguageCard(
              context,
              'JavaScript',
              'Un langage de programmation de haut niveau, dynamique, non typé et interprété, couramment utilisé pour le développement web.',
              'Créé en 1995 par Brendan Eich.',
              'Polyvalent, s\'exécute dans le navigateur, grand écosystème.',
              'Peut être difficile à déboguer, incohérent entre les navigateurs.',
              'Développement web, scripting côté serveur.',
              'React, Angular, Vue.js',
              'console.log("Hello, World!");'),
          _buildLanguageCard(
              context,
              'Dart',
              'Un langage de programmation optimisé pour les applications sur plusieurs plateformes, développé par Google.',
              'Introduit par Google en 2011.',
              'Optimisé pour l\'interface utilisateur, typage fort, bonne performance.',
              'Gagne encore en popularité, communauté plus petite que d\'autres.',
              'Applications mobiles, applications web, applications côté serveur.',
              'Flutter, AngularDart',
              'void main() { print("Hello, World!"); }'),
          _buildLanguageCard(
              context,
              'PHP',
              'Un langage de script côté serveur principalement utilisé pour le développement web.',
              'Créé en 1994 par Rasmus Lerdorf.',
              'Facile à apprendre, intégré dans HTML, large adoption.',
              'Peut être moins performant que d\'autres langages, sécurité parfois négligée.',
              'Développement web, systèmes de gestion de contenu.',
              'Laravel, Symfony, CodeIgniter',
              '<?php echo "Hello, World!"; ?>'),
          _buildLanguageCard(
              context,
              'C++',
              'Un langage de programmation généraliste qui est une extension du langage C.',
              'Développé par Bjarne Stroustrup à partir de 1979.',
              'Performant, contrôle bas niveau, support de la programmation orientée objet.',
              'Complexité, courbe d\'apprentissage abrupte.',
              'Développement de systèmes, jeux vidéo, applications embarquées.',
              'Qt, Boost, Cinder',
              '#include <iostream>\nint main() { std::cout << "Hello, World!"; return 0; }'),
          _buildLanguageCard(
              context,
              'Go (Golang)',
              'Un langage de programmation statiquement typé et compilé, développé par Google.',
              'Introduit en 2009 par Robert Griesemer, Rob Pike et Ken Thompson.',
              'Simplicité, performance, excellent support de la concurrence.',
              'Moins de bibliothèques que d\'autres langages, gestion des erreurs parfois verbeuse.',
              'Développement de systèmes, applications cloud, microservices.',
              'Gin, Beego, Revel',
              'package main\nimport "fmt"\nfunc main() { fmt.Println("Hello, World!") }'),
          _buildLanguageCard(
              context,
              'Ruby',
              'Un langage de programmation dynamique et orienté objet, connu pour sa simplicité.',
              'Créé par Yukihiro Matsumoto en 1995.',
              'Syntaxe élégante, grande communauté, productivité.',
              'Performance parfois inférieure, moins utilisé pour les applications à grande échelle.',
              'Développement web, scripts, automatisation.',
              'Ruby on Rails, Sinatra',
              'puts "Hello, World!"'),
          _buildLanguageCard(
              context,
              'C#',
              'Un langage de programmation orienté objet développé par Microsoft.',
              'Introduit en 2000 dans le cadre de la plateforme .NET.',
              'Intégration avec Windows, riche écosystème, bon support pour le développement de jeux.',
              'Dépendance à l\'écosystème Microsoft, moins utilisé en dehors de celui-ci.',
              'Développement d\'applications Windows, jeux vidéo, applications web.',
              'ASP.NET, Unity, Xamarin',
              'Console.WriteLine("Hello, World!");'),
          // Ajoutez d'autres langages ici avec leurs exemples de code...
        ],
      ),
    );
  }

  Widget _buildLanguageCard(
      BuildContext context,
      String language,
      String description,
      String history,
      String advantages,
      String disadvantages,
      String domains,
      String frameworks,
      String codeExample) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          // Naviguer vers l'écran de détails avec le langage et la description
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LanguageDetailScreen(
                language: language,
                description: description,
                history: history,
                advantages: advantages,
                disadvantages: disadvantages,
                domains: domains,
                frameworks: frameworks,
                codeExample: codeExample, // Passer l'exemple de code
              ),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                language,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                description,
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LanguageDetailScreen extends StatelessWidget {
  final String language;
  final String description;
  final String history;
  final String advantages;
  final String disadvantages;
  final String domains;
  final String frameworks;
  final String codeExample; // New property for code example

  const LanguageDetailScreen({
    Key? key,
    required this.language,
    required this.description,
    required this.history,
    required this.advantages,
    required this.disadvantages,
    required this.domains,
    required this.frameworks,
    required this.codeExample, // Initialize the code example
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(language),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.grey[100]!],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                language,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              SizedBox(height: 16),
              _buildSectionTitle('Description'),
              _buildSectionContent(description),
              _buildSectionTitle('Historique'),
              _buildSectionContent(history),
              _buildSectionTitle('Avantages'),
              _buildSectionContent(advantages),
              _buildSectionTitle('Inconvénients'),
              _buildSectionContent(disadvantages),
              _buildSectionTitle('Domaines d\'utilisation'),
              _buildSectionContent(domains),
              _buildSectionTitle('Frameworks populaires'),
              _buildSectionContent(frameworks),
              _buildSectionTitle('Exemple de code'),
              SizedBox(height: 8),
              _buildCodeExample(codeExample),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.blueAccent,
        ),
      ),
    );
  }

  Widget _buildSectionContent(String content) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(
          content,
          style: TextStyle(fontSize: 16, height: 1.5),
        ),
      ),
    );
  }

  Widget _buildCodeExample(String code) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[400]!),
      ),
      child: SelectableText(
        code,
        style: TextStyle(
            fontSize: 16, fontFamily: 'Courier', color: Colors.black87),
      ),
    );
  }
}
