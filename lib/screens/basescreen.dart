import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/settingsprovider.dart';

class BaseScreen extends StatelessWidget {
  final String title;
  final Widget body;

  const BaseScreen({Key? key, required this.title, required this.body})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final settingsProvider = Provider.of<SettingsProvider>(context);
    // Get the screen size
    final screenSize = MediaQuery.of(context).size;

    // Define fixed font sizes for larger screens
    final double fixedTitleFontSize = 24; // Fixed size for title
    final double fixedDrawerItemFontSize = 16; // Fixed size for drawer items

    // Calculate responsive font sizes for smaller screens
    final double responsiveTitleFontSize =
        screenSize.width < 600 ? screenSize.width * 0.05 : fixedTitleFontSize;
    final double responsiveDrawerItemFontSize = screenSize.width < 600
        ? screenSize.width * 0.04
        : fixedDrawerItemFontSize;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style:
              TextStyle(fontSize: responsiveTitleFontSize, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: settingsProvider.primaryColor,
      ),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              child: Text(
                'Programming Hub',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: responsiveTitleFontSize *
                      1.2, // Slightly larger for header
                  fontWeight: FontWeight.bold,
                ),
              ),
              decoration: BoxDecoration(
                color: settingsProvider.primaryColor,
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  _createDrawerItem(
                    context: context,
                    title: 'Accueil',
                    icon: Icons.home,
                    route: '/home',
                    fontSize: responsiveDrawerItemFontSize,
                  ),
                  _createDrawerItem(
                    context: context,
                    title: 'Algo',
                    icon: Icons.code,
                    route: '/algorithms',
                    fontSize: responsiveDrawerItemFontSize,
                  ),
                  _createDrawerItem(
                    context: context,
                    title: 'Langages de programmation',
                    icon: Icons.language,
                    route: '/languages',
                    fontSize: responsiveDrawerItemFontSize,
                  ),
                  _createDrawerItem(
                    context: context,
                    title: 'Metiers',
                    icon: Icons.work,
                    route: '/careers',
                    fontSize: responsiveDrawerItemFontSize,
                  ),
                  _createDrawerItem(
                    context: context,
                    title: 'Conseils',
                    icon: Icons.lightbulb,
                    route: '/tips',
                    fontSize: responsiveDrawerItemFontSize,
                  ),
                  _createDrawerItem(
                    context: context,
                    title: 'Exercices',
                    icon: Icons.assignment,
                    route: '/quizzes',
                    fontSize: responsiveDrawerItemFontSize,
                  ),
                  _createDrawerItem(
                    context: context,
                    title: 'Forum',
                    icon: Icons.forum,
                    route: '/forum',
                    fontSize: responsiveDrawerItemFontSize,
                  ),
                  _createDrawerItem(
                    context: context,
                    title: 'Ressources',
                    icon: Icons.library_books,
                    route: '/resources',
                    fontSize: responsiveDrawerItemFontSize,
                  ),
                  _createDrawerItem(
                    context: context,
                    title: 'Idées de projet',
                    icon: Icons.lightbulb_outline,
                    route: '/projects',
                    fontSize: responsiveDrawerItemFontSize,
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.arrow_back,
                color: settingsProvider.primaryColor,
              ),
              title: Text(
                'Retour',
                style: TextStyle(
                  fontSize: responsiveDrawerItemFontSize,
                  color: settingsProvider.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.of(context).pop(); // Close the drawer
              },
            ),
          ],
        ),
      ),
      body: body,

      // The body of the screen will be passed in
    );
  }

  Widget _createDrawerItem({
    required BuildContext context,
    required String title,
    required IconData icon,
    required String route,
    required double fontSize,
  }) {
    final settingsProvider = Provider.of<SettingsProvider>(context);

    return ListTile(
      leading: Icon(icon, color: settingsProvider.primaryColor),
      title: Text(
        title,
        style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w500),
      ),
      onTap: () {
        Navigator.pushNamed(context, route);
      },
    );
  }
}
