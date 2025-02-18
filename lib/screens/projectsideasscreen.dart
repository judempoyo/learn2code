import 'package:flutter/material.dart';
import 'basescreen.dart';

class ProjectsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: 'Idées de Projets',
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildProjectCard(
              context,
              title: 'Créer un Site Web Personnel',
              description:
                  'Créez un site web personnel pour présenter vos compétences, projets et expériences. Utilisez HTML, CSS et JavaScript ou des frameworks comme React ou Vue.js.',
              imageUrl: 'https://via.placeholder.com/150',
            ),
            _buildProjectCard(
              context,
              title: 'Créer une Application de Liste de Tâches',
              description:
                  'Développez une application de liste de tâches simple mais efficace qui permet aux utilisateurs d\'ajouter, modifier et supprimer des tâches. Envisagez d\'utiliser Flutter pour la compatibilité multiplateforme.',
              imageUrl: 'https://via.placeholder.com/150',
            ),
            _buildProjectCard(
              context,
              title: 'Développer une Application Météo',
              description:
                  'Construisez une application météo qui récupère des données météorologiques en temps réel à partir d\'une API. Affichez les conditions météorologiques actuelles, les prévisions, et plus encore.',
              imageUrl: 'https://via.placeholder.com/150',
            ),
            _buildProjectCard(
              context,
              title: 'Application de Suivi des Habitudes',
              description:
                  'Créez une application qui permet aux utilisateurs de suivre leurs habitudes quotidiennes, comme boire de l\'eau, faire de l\'exercice, ou lire. Incluez des graphiques pour visualiser les progrès.',
              imageUrl: 'https://via.placeholder.com/150',
            ),
            _buildProjectCard(
              context,
              title: 'Application de Gestion de Budget',
              description:
                  'Développez une application qui aide les utilisateurs à gérer leurs finances personnelles. Permettez-leur d\'ajouter des revenus et des dépenses, et de visualiser leurs finances sous forme de graphiques.',
              imageUrl: 'https://via.placeholder.com/150',
            ),
            _buildProjectCard(
              context,
              title: 'Application de Quiz',
              description:
                  'Créez une application de quiz où les utilisateurs peuvent tester leurs connaissances sur divers sujets. Incluez des fonctionnalités pour afficher les résultats et les scores.',
              imageUrl: 'https://via.placeholder.com/150',
            ),
            _buildProjectCard(
              context,
              title: 'Application de Méditation',
              description:
                  'Créez une application qui propose des séances de méditation guidée, des sons relaxants et des conseils de bien-être. Incluez un minuteur pour les séances de méditation.',
              imageUrl: 'https://via.placeholder.com/150',
            ),
            _buildProjectCard(
              context,
              title: 'Application de Gestion de Projets',
              description:
                  'Développez une application qui permet aux utilisateurs de gérer leurs projets, d\'ajouter des tâches, de définir des échéances et de suivre l\'avancement.',
              imageUrl: 'https://via.placeholder.com/150',
            ),
            _buildProjectCard(
              context,
              title: 'Application de Suivi des Livres',
              description:
                  'Créez une application qui permet aux utilisateurs de suivre les livres qu\'ils ont lus, ceux qu\'ils souhaitent lire, et d\'évaluer les livres.',
              imageUrl: 'https://via.placeholder.com/150',
            ),
            _buildProjectCard(
              context,
              title: 'Application de Réservation de Restaurants',
              description:
                  'Créez une application qui permet aux utilisateurs de rechercher des restaurants, de consulter les menus, et de faire des réservations en ligne.',
              imageUrl: 'https://via.placeholder.com/150',
            ),
            _buildProjectCard(
              context,
              title: 'Application de Gestion de Contacts',
              description:
                  'Développez une application qui permet aux utilisateurs de gérer leurs contacts, d\'ajouter des notes, et de définir des rappels pour les anniversaires.',
              imageUrl: 'https://via.placeholder.com/150',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProjectCard(
    BuildContext context, {
    required String title,
    required String description,
    required String imageUrl,
  }) {
    return Card(
      elevation: 8,
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: () {
          // Gérer le tap sur la carte si nécessaire
        },
        borderRadius: BorderRadius.circular(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.network(
                imageUrl,
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    description,
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
