import 'package:flutter/material.dart';
import 'basescreen.dart'; // Importez votre BaseScreen

class CareersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: 'Carrières en Programmation',
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          _buildCareerCard(context, 'Développeur Frontend',
              'Responsable de la mise en œuvre des éléments visuels que les utilisateurs voient et avec lesquels ils interagissent dans une application web.',
              skills: ['HTML', 'CSS', 'JavaScript', 'React', 'Vue.js'],
              salary: '50,000 USD/an',
              jobOutlook: '16% de croissance d\'ici 2032'),
          _buildCareerCard(context, 'Développeur Backend',
              'Se concentre sur le développement côté serveur, la gestion de la base de données et l\'assurance que l\'application fonctionne correctement.',
              skills: ['Node.js', 'Python', 'Java', 'Ruby', 'PHP'],
              salary: '60,000 USD/an',
              jobOutlook: '8% de croissance d\'ici 2032'),
          _buildCareerCard(context, 'Développeur Full Stack',
              'Travaille à la fois sur le front-end et le back-end des applications, comblant le fossé entre l\'expérience utilisateur et la logique côté serveur.',
              skills: ['HTML', 'CSS', 'JavaScript', 'Node.js', 'React'],
              salary: '70,000 USD/an',
              jobOutlook: '22% de croissance d\'ici 2032'),
          _buildCareerCard(context, 'Data Scientist',
              'Analyse et interprète des données complexes pour aider les organisations à prendre des décisions éclairées.',
              skills: [
                'Python',
                'R',
                'SQL',
                'Machine Learning',
                'Statistiques'
              ],
              salary: '80,000 USD/an',
              jobOutlook: '31% de croissance d\'ici 2032'),
          _buildCareerCard(context, 'Ingénieur DevOps',
              'Combine le développement logiciel et les opérations informatiques pour raccourcir le cycle de développement et livrer des logiciels de haute qualité.',
              skills: ['Docker', 'Kubernetes', 'CI/CD', 'AWS', 'Linux'],
              salary: '90,000 USD/an',
              jobOutlook: '24% de croissance d\'ici 2032'),
          _buildCareerCard(context, 'Ingénieur en Sécurité Informatique',
              'Responsable de la protection des systèmes informatiques et des réseaux contre les cybermenaces.',
              skills: [
                'Sécurité des réseaux',
                'Cryptographie',
                'Analyse des vulnérabilités'
              ],
              salary: '85,000 USD/an',
              jobOutlook: '28% de croissance d\'ici 2032'),
          _buildCareerCard(context, 'Analyste de Données',
              'Examine et interprète les données pour aider les entreprises à comprendre leurs performances et à prendre des décisions stratégiques.',
              skills: ['Excel', 'SQL', 'Python', 'Visualisation de données'],
              salary: '55,000 USD/an',
              jobOutlook: '11% de croissance d\'ici 2032'),
          _buildCareerCard(context, 'Développeur Mobile',
              'Conçoit et développe des applications pour les appareils mobiles, comme les smartphones et les tablettes.',
              skills: ['Flutter', 'React Native', 'Swift', 'Kotlin'],
              salary: '75,000 USD/an',
              jobOutlook: '20% de croissance d\'ici 2032'),
          _buildCareerCard(context, 'Architecte Logiciel',
              'Conçoit l\'architecture des systèmes logiciels et supervise le développement pour garantir la qualité et la performance.',
              skills: [
                'Conception de systèmes',
                'Modélisation UML',
                'Gestion de projet'
              ],
              salary: '100,000 USD/an',
              jobOutlook: '10% de croissance d\'ici 2032'),
          _buildCareerCard(
              context,
              'Consultant en Technologie de l\'Information',
              'Fournit des conseils aux entreprises sur l\'utilisation de la technologie pour atteindre leurs objectifs.',
              skills: [
                'Gestion de projet',
                'Analyse des besoins',
                'Communication'
              ],
              salary: '70,000 USD/an',
              jobOutlook: '12% de croissance d\'ici 2032'),
        ],
      ),
    );
  }

  Widget _buildCareerCard(
      BuildContext context, String career, String description,
      {required List<String> skills,
      required String salary,
      required String jobOutlook}) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CareerDetailScreen(
                career: career,
                description: description,
                skills: skills,
                salary: salary,
                jobOutlook: jobOutlook,
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
                career,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                description,
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 8),
              Text(
                'Salaire moyen: $salary',
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
              Text(
                'Perspectives d\'emploi: $jobOutlook',
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CareerDetailScreen extends StatelessWidget {
  final String career;
  final String description;
  final List<String> skills;
  final String salary;
  final String jobOutlook;

  const CareerDetailScreen({
    Key? key,
    required this.career,
    required this.description,
    required this.skills,
    required this.salary,
    required this.jobOutlook,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(career),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              career,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              description,
              style: TextStyle(fontSize: 18, height: 1.5),
            ),
            SizedBox(height: 16),
            Text(
              'Compétences requises:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ...skills.map((skill) => Text('• $skill')).toList(),
            SizedBox(height: 16),
            Text(
              'Salaire moyen: $salary',
              style: TextStyle(fontSize: 18, color: Colors.grey[600]),
            ),
            SizedBox(height: 8),
            Text(
              'Perspectives d\'emploi: $jobOutlook',
              style: TextStyle(fontSize: 18, color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }
}
