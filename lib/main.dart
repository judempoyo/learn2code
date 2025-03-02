import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/algorithmscreen.dart';
import './screens/programminglanguagesscreen.dart';
import './screens/careerpathsscreen.dart';
import './screens/tipsscreen.dart';
import './screens/quizzesscreen.dart';
import './screens/communityforumscreen.dart';
import './screens/resourcescreen.dart';
import './screens/projectsideasscreen.dart';
import 'config/database_helper.dart';
import 'providers/settingsprovider.dart';
import 'screens/homescreen.dart';
import 'screens/settings.dart';
import 'screens/aboutusscreen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dbHelper = DatabaseHelper();
  //dbHelper.supprimerBaseDeDonnees();
  await dbHelper.insertDefaultData();

  await initializeApp();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SettingsProvider()..init()),
      ],
      child: const MyApp(),
    ),
  );
}

Future<void> initializeApp() async {
  await SettingsProvider().init();
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsProvider>(
      builder: (context, settingsProvider, child) {
        return MaterialApp(
          title: 'Learn2code',
          initialRoute: '/',
          routes: _buildRoutes(),
          theme: _buildThemeData(settingsProvider),
          debugShowCheckedModeBanner: false,
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [
            const Locale('en', ''),
            const Locale('fr', ''), 
          ],
          locale: Locale(settingsProvider.selectedLanguage, ''),
          home: HomeScreen(),
        );
      },
    );
  }

  Map<String, WidgetBuilder> _buildRoutes() {
    return {
      '/home': (context) => HomeScreen(),
      '/algorithms': (context) => AlgorithmsScreen(),
      '/languages': (context) => LanguagesScreen(),
      '/careers': (context) => CareersScreen(),
      '/tips': (context) => TipsScreen(),
      '/quizzes': (context) => QuizzesScreen(),
      '/forum': (context) => ForumScreen(),
      '/resources': (context) => ResourcesScreen(),
      '/projects': (context) => ProjectsScreen(),
      '/settings': (context) => SettingsScreen(),
      '/about': (context) => AboutScreen(),
    };
  }

  ThemeData _buildThemeData(SettingsProvider settingsProvider) {
    return ThemeData(
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: settingsProvider.primaryColor,
          side: BorderSide(color: settingsProvider.primaryColor, width: 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0), // Rounded corners
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: settingsProvider.primaryColor,
          side: BorderSide(color: settingsProvider.primaryColor, width: 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0), // Rounded corners
          ),
        ),
      ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(
            fontSize: 16,
            color: settingsProvider.tileManager ? Colors.white : Colors.black),
        bodyMedium: TextStyle(
            fontSize: 14,
            color: settingsProvider.tileManager
                ? Colors.white70
                : Colors.grey[600]),
        displayLarge: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: settingsProvider.primaryColor),
      ),
      appBarTheme: AppBarTheme(
        color: settingsProvider.primaryColor,
        centerTitle: true,
      ),
      cardColor: settingsProvider.tileManager ? Colors.grey[850] : Colors.white,
      scaffoldBackgroundColor:
          settingsProvider.tileManager ? Colors.black : Colors.grey[100],
      brightness:
          settingsProvider.tileManager ? Brightness.dark : Brightness.light,
      primaryColor: settingsProvider.primaryColor,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      hintColor: settingsProvider.accentColor,
    );
  }
}
