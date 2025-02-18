import 'package:flutter/material.dart';
import 'package:learn2code/screens/settings.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../providers/settingsprovider.dart';
import 'basescreen.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final settingsProvider = Provider.of<SettingsProvider>(context);
    return BaseScreen(
      title: 'Resource Library',
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'À propos de cette application',
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: settingsProvider.primaryColor),
              ),
              const SizedBox(height: 20),
              const Text(
                'Programming Hub est votre application de référence pour apprendre les langages de programmation, les algorithmes, et plus encore. Notre objectif est de vous fournir les meilleures ressources et outils pour améliorer vos compétences en codage.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              const SizedBox(height: 20),
              const Divider(),
              const SizedBox(height: 20),
              const Text(
                'Version : 1.0.0',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 10),
              const Text(
                'Développé par : Jude MPOYO',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 10),
              const Text(
                'Contact : mpoyojude0@gmail.com',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 20),
              const Divider(),
              const SizedBox(height: 20),
              const Text(
                'Suivez-nous',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: FaIcon(
                      FontAwesomeIcons.github,
                      color: settingsProvider.primaryColor,
                    ),
                    onPressed: () => _launchURL('https://github.com/judempoyo'),
                  ),
                  IconButton(
                    icon: FaIcon(
                      FontAwesomeIcons.whatsapp,
                      color: settingsProvider.primaryColor,
                    ),
                    onPressed: () => _launchURL('https://wa.me/243975889135'),
                  ),
                  IconButton(
                    icon: FaIcon(
                      FontAwesomeIcons.linkedin,
                      color: settingsProvider.primaryColor,
                    ),
                    onPressed: () =>
                        _launchURL('https://linkedin.com/in/your_profile'),
                  ),
                  IconButton(
                    icon: FaIcon(
                      FontAwesomeIcons.twitter,
                      color: settingsProvider.primaryColor,
                    ),
                    onPressed: () => _launchURL('https://twitter.com'),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.facebook,
                      color: settingsProvider.primaryColor,
                    ),
                    onPressed: () => _launchURL('https://facebook.com'),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Divider(),
              const SizedBox(height: 20),
              const Text(
                'Retour d\'information',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'Nous aimerions connaître votre avis ! Veuillez nous envoyer vos commentaires ou suggestions.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // Implémentez la fonctionnalité de retour d'information
                },
                child: const Text(
                  'Envoyer des commentaires',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: settingsProvider.primaryColor,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }
}
