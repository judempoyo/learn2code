import 'package:flutter/material.dart';
import 'basescreen.dart';

class QuizzesScreen extends StatefulWidget {
  @override
  _QuizzesScreenState createState() => _QuizzesScreenState();
}

class _QuizzesScreenState extends State<QuizzesScreen> {
  String? selectedDifficulty;
  String? selectedLanguage;
  String? selectedCategory;

  final List<Map<String, dynamic>> quizzes = [
    {
      'title': 'Bases de Python',
      'language': 'Python',
      'difficulty': 'Facile',
      'category': 'Science des données',
      'questions': [
        {
          'question':
              'Quelle est la fonction pour afficher du texte en Python?',
          'options': ['print()', 'echo()', 'display()', 'show()'],
          'answer': 'print()',
        },
        {
          'question': 'Comment déclare-t-on une variable en Python?',
          'options': ['var x = 10', 'x := 10', 'x = 10', 'let x = 10'],
          'answer': 'x = 10',
        },
        {
          'question':
              'Quelle méthode est utilisée pour ajouter un élément à une liste?',
          'options': ['add()', 'append()', 'insert()', 'push()'],
          'answer': 'append()',
        },
        {
          'question': 'Quel mot-clé est utilisé pour définir une fonction?',
          'options': ['function', 'def', 'func', 'declare'],
          'answer': 'def',
        },
        {
          'question': 'Comment importer une bibliothèque en Python?',
          'options': [
            'import library',
            'include library',
            'require library',
            'using library'
          ],
          'answer': 'import library',
        },
        {
          'question': 'Quelle est la syntaxe correcte pour une boucle for?',
          'options': [
            'for i in range(10):',
            'for (i = 0; i < 10; i++)',
            'foreach i in range(10)',
            'for i: 0 to 10'
          ],
          'answer': 'for i in range(10):',
        },
        {
          'question': 'Comment gérer les exceptions en Python?',
          'options': [
            'try...catch',
            'try...except',
            'handle...error',
            'catch...try'
          ],
          'answer': 'try...except',
        },
        {
          'question': 'Quelle fonction est utilisée pour lire un fichier?',
          'options': ['readFile()', 'open()', 'load()', 'get()'],
          'answer': 'open()',
        },
        {
          'question':
              'Quel est le type de données pour une séquence de caractères?',
          'options': ['String', 'Char', 'Text', 'Array'],
          'answer': 'String',
        },
        {
          'question': 'Comment afficher une liste en Python?',
          'options': [
            'print(list)',
            'show(list)',
            'display(list)',
            'echo(list)'
          ],
          'answer': 'print(list)',
        },
      ],
    },
    {
      'title': 'Fondamentaux de Java',
      'language': 'Java',
      'difficulty': 'Moyen',
      'category': 'Développement Web',
      'questions': [
        {
          'question': 'Quel est le mot-clé pour créer une classe en Java?',
          'options': ['class', 'create', 'new', 'def'],
          'answer': 'class',
        },
        {
          'question': 'Comment déclare-t-on une variable entière en Java?',
          'options': ['int x;', 'integer x;', 'x int;', 'var x: Int;'],
          'answer': 'int x;',
        },
        {
          'question':
              'Quelle méthode est utilisée pour démarrer un thread en Java?',
          'options': ['start()', 'run()', 'execute()', 'begin()'],
          'answer': 'start()',
        },
        {
          'question':
              'Quel est le type de données pour une valeur booléenne en Java?',
          'options': ['boolean', 'bool', 'true/false', 'int'],
          'answer': 'boolean',
        },
        {
          'question': 'Comment créer un tableau en Java?',
          'options': [
            'int[] arr = new int[10];',
            'int arr[10];',
            'array int arr = new int(10);',
            'int arr = new int[10];'
          ],
          'answer': 'int[] arr = new int[10];',
        },
        {
          'question':
              'Quelle méthode est utilisée pour ajouter un élément à une ArrayList ?',
          'options': ['add()', 'insert()', 'append()', 'push()'],
          'answer': 'add()',
        },
        {
          'question':
              'Quel mot-clé est utilisé pour hériter d\'une classe en Java?',
          'options': ['extends', 'inherits', 'implements', 'derives'],
          'answer': 'extends',
        },
        {
          'question': 'Comment déclarer une méthode abstraite en Java?',
          'options': [
            'abstract void myMethod();',
            'void myMethod() abstract;',
            'myMethod() abstract void;',
            'abstract myMethod();'
          ],
          'answer': 'abstract void myMethod();',
        },
        {
          'question':
              'Quelle annotation est utilisée pour indiquer une méthode principale en Java?',
          'options': ['@Main', '@Start', '@Entry', '@Override'],
          'answer': '@Override',
        },
        {
          'question': 'Comment gérer les exceptions en Java?',
          'options': [
            'try...catch',
            'handle...error',
            'try...except',
            'catch...try'
          ],
          'answer': 'try...catch',
        },
      ],
    },
    {
      'title': 'Essentiels de JavaScript',
      'language': 'JavaScript',
      'difficulty': 'Difficile',
      'category': 'Développement Web',
      'questions': [
        {
          'question': 'Comment déclare-t-on une variable en JavaScript?',
          'options': [
            'var x;',
            'let x;',
            'const x;',
            'Toutes les réponses ci-dessus'
          ],
          'answer': 'Toutes les réponses ci-dessus',
        },
        {
          'question':
              'Quelle méthode est utilisée pour ajouter un élément à un tableau?',
          'options': ['add()', 'append()', 'push()', 'insert()'],
          'answer': 'push()',
        },
        {
          'question': 'Comment créer une fonction en JavaScript?',
          'options': [
            'function myFunction() {}',
            'myFunction() {}',
            'create myFunction() {}',
            'def myFunction() {}'
          ],
          'answer': 'function myFunction() {}',
        },
        {
          'question':
              'Quel est le type de données pour une valeur non définie?',
          'options': ['undefined', 'null', 'NaN', 'void'],
          'answer': 'undefined',
        },
        {
          'question': 'Comment ajouter un événement à un élément?',
          'options': [
            'element.addEvent()',
            'element.onClick()',
            'element.addEventListener()',
            'element.event()'
          ],
          'answer': 'element.addEventListener()',
        },
        {
          'question':
              'Quelle méthode est utilisée pour convertir une chaîne en nombre?',
          'options': ['parseInt()', 'toNumber()', 'convert()', 'Number()'],
          'answer': 'parseInt()',
        },
        {
          'question': 'Comment créer un tableau en JavaScript?',
          'options': [
            'var arr = []',
            'var arr = new Array()',
            'var arr = Array()',
            'Toutes les réponses ci-dessus'
          ],
          'answer': 'Toutes les réponses ci-dessus',
        },
        {
          'question': 'Comment vérifier si une variable est un tableau?',
          'options': [
            'Array.isArray()',
            'isArray()',
            'instanceof Array',
            'typeof array'
          ],
          'answer': 'Array.isArray()',
        },
        {
          'question': 'Comment déclarer une fonction fléchée?',
          'options': [
            'const myFunction = () => {}',
            'function myFunction() {}',
            'myFunction() => {}',
            'const myFunction = function() {}'
          ],
          'answer': 'const myFunction = () => {}',
        },
        {
          'question':
              'Quelle méthode est utilisée pour supprimer le dernier élément d\'un tableau?',
          'options': ['pop()', 'remove()', 'delete()', 'shift()'],
          'answer': 'pop()',
        },
      ],
    },
    {
      'title': 'Introduction à PHP',
      'language': 'PHP',
      'difficulty': 'Moyen',
      'category': 'Développement Web',
      'questions': [
        {
          'question': 'Quel est le bon moyen de déclarer une variable en PHP?',
          'options': ['var x;', '\$x;', 'int x;', 'declare x;'],
          'answer': '\$x;',
        },
        {
          'question': 'Comment inclure un fichier en PHP?',
          'options': ['include()', 'require()', 'import()', 'load()'],
          'answer': 'include()',
        },
        // Ajoutez d'autres questions pour PHP
      ],
    },
    {
      'title': 'Fondamentaux de C++',
      'language': 'C++',
      'difficulty': 'Difficile',
      'category': 'Développement logiciel',
      'questions': [
        {
          'question': 'Quel mot-clé est utilisé pour créer une classe en C++?',
          'options': ['class', 'struct', 'object', 'define'],
          'answer': 'class',
        },
        {
          'question': 'Comment déclarer un pointeur en C++?',
          'options': ['int* p;', 'int p*;', 'pointer int p;', 'int p;'],
          'answer': 'int* p;',
        },
        // Ajoutez d'autres questions pour C++
      ],
    },
    {
      'title': 'Algorithmes de Base',
      'language': 'Algorithmes',
      'difficulty': 'Facile',
      'category': 'Mathématiques',
      'questions': [
        {
          'question': 'Quel est l\'algorithme de tri le plus simple?',
          'options': [
            'Tri à bulles',
            'Tri rapide',
            'Tri par insertion',
            'Tri par sélection'
          ],
          'answer': 'Tri à bulles',
        },
        {
          'question': 'Quel est le temps de complexité du tri par insertion?',
          'options': ['O(n)', 'O(n log n)', 'O(n^2)', 'O(log n)'],
          'answer': 'O(n^2)',
        },
        // Ajoutez d'autres questions pour les algorithmes
      ],
    },
    // Ajoutez d'autres quiz si nécessaire
  ];

  List<String> difficulties = ['Tous', 'Facile', 'Moyen', 'Difficile'];
  List<String> languages = [
    'Tous',
    'Python',
    'Java',
    'JavaScript',
    'PHP',
    'C++',
    'Algorithmes',
    'N/A'
  ];
  List<String> categories = [
    'Tous',
    'Science des données',
    'Développement Web',
    'Algorithmes',
    'Développement logiciel'
  ];

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: 'Quiz',
      body: Column(
        children: [
          _buildFilterSection(),
          Expanded(
            child: _buildQuizList(),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: _buildDropdown(
                      label: 'Difficulté',
                      value: selectedDifficulty ?? 'Tous',
                      items: difficulties,
                      onChanged: (value) {
                        setState(() {
                          selectedDifficulty = value == 'Tous' ? null : value;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildDropdown(
                      label: 'Langue',
                      value: selectedLanguage ?? 'Tous',
                      items: languages,
                      onChanged: (value) {
                        setState(() {
                          selectedLanguage = value == 'Tous' ? null : value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              _buildDropdown(
                label: 'Catégorie',
                value: selectedCategory ?? 'Tous',
                items: categories,
                onChanged: (value) {
                  setState(() {
                    selectedCategory = value == 'Tous' ? null : value;
                  });
                },
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildDropdown({
    required String label,
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        filled: true,
        fillColor: Colors.white,
      ),
      value: value,
      items: items.map((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }

  Widget _buildQuizList() {
    List<Map<String, dynamic>> filteredQuizzes = quizzes.where((quiz) {
      final matchesDifficulty = selectedDifficulty == null ||
          quiz['difficulty'] == selectedDifficulty;
      final matchesLanguage =
          selectedLanguage == null || quiz['language'] == selectedLanguage;
      final matchesCategory =
          selectedCategory == null || quiz['category'] == selectedCategory;
      return matchesDifficulty && matchesLanguage && matchesCategory;
    }).toList();

    if (filteredQuizzes.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Aucun quiz disponible pour les critères sélectionnés.',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black54),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    return ListView.builder(
      itemCount: filteredQuizzes.length,
      itemBuilder: (context, index) {
        return _buildQuizCard(filteredQuizzes[index]);
      },
    );
  }

  Widget _buildQuizCard(Map<String, dynamic> quiz) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        title: Text(quiz['title']!),
        subtitle: Text(
            'Langue: ${quiz['language']} | Catégorie: ${quiz['category']}'),
        trailing: _buildDifficultyBadge(quiz['difficulty']!),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => QuizDetailScreen(quiz: quiz),
            ),
          );
        },
      ),
    );
  }

  Widget _buildDifficultyBadge(String difficulty) {
    Color badgeColor;

    switch (difficulty) {
      case 'Facile':
        badgeColor = Colors.green;
        break;
      case 'Moyen':
        badgeColor = Colors.orange;
        break;
      case 'Difficile':
        badgeColor = Colors.red;
        break;
      default:
        badgeColor = Colors.grey;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: badgeColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        difficulty,
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class QuizDetailScreen extends StatefulWidget {
  final Map<String, dynamic> quiz;

  QuizDetailScreen({required this.quiz});

  @override
  _QuizDetailScreenState createState() => _QuizDetailScreenState();
}

class _QuizDetailScreenState extends State<QuizDetailScreen> {
  String? selectedAnswer;
  int correctAnswers = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.quiz['title']),
      ),
      body: ListView.builder(
        itemCount: widget.quiz['questions'].length,
        itemBuilder: (context, index) {
          final question = widget.quiz['questions'][index];
          return Card(
            margin: const EdgeInsets.all(16.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    question['question'],
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  ...question['options'].map<Widget>((option) {
                    return RadioListTile(
                      title: Text(option),
                      value: option,
                      groupValue: selectedAnswer,
                      onChanged: (value) {
                        setState(() {
                          selectedAnswer = value as String?;
                          if (selectedAnswer == question['answer']) {
                            correctAnswers++;
                          }
                        });
                      },
                    );
                  }).toList(),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final totalQuestions = widget.quiz['questions'].length;
          final percentage = (correctAnswers / totalQuestions) * 100;
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Résultat du Quiz'),
                content:
                    Text('Vous avez obtenu $percentage% de bonnes réponses.'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('OK'),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.check),
      ),
    );
  }
}
