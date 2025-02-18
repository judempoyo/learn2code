// settings_provider.dart
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../screens/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class SettingsProvider with ChangeNotifier {
/*   bool _isDarkMode = false;
  Color _primaryColor = Colors.blue;
  Color _accentColor = Colors.blueAccent; */

  bool _tileManager = false;
  RadioButtonOptions _initialRadioChoice = RadioButtonOptions.op2;
  bool _checkBoxManager = true;
  Color _primaryColor = Colors.blue;
  Color _accentColor = Colors.greenAccent;
  String _selectedLanguage = 'en';
  bool _slowMotion = false;

  bool get tileManager => _tileManager;
  RadioButtonOptions get initialRadioChoice => _initialRadioChoice;
  bool get checkBoxManager => _checkBoxManager;
  Color get primaryColor => _primaryColor;
  Color get accentColor => _accentColor;
  String get selectedLanguage => _selectedLanguage;
  bool get slowMotion => _slowMotion;

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> init() async {
    await _loadSettings();
    notifyListeners();
  }

  Future<void> _loadSettings() async {
    final prefs = await _prefs;

    //_isDarkMode = prefs.getBool('isDarkMode') ?? false;
    _tileManager = prefs.getBool('tileManager') ?? false;
    _checkBoxManager = prefs.getBool('checkBoxManager') ?? true;
    _primaryColor = Color(prefs.getInt('primaryColor') ?? 0xFF0000FF);
    _accentColor = Color(prefs.getInt('accentColor') ?? 0xFF03A9F4);
    _selectedLanguage = prefs.getString('selectedLanguage') ?? 'en';

    if (kDebugMode) {
      print('chargement des parametres');
      print('\nmode sombre:$_tileManager');
      print('\nRalentir les animations:$_checkBoxManager');
      print('\ncouleur principale:$_primaryColor');
      print('\ncouleur d\'accentuation:$_accentColor');
      print('\nlangue:$_selectedLanguage');
    }
  }

  Future<void> _saveSettings() async {
    final prefs = await _prefs;
    //prefs.setBool('isDarkMode', _isDarkMode);
    prefs.setBool('tileManager', _tileManager);
    prefs.setBool('checkBoxManager', _checkBoxManager);
    prefs.setInt('primaryColor', _primaryColor.value);
    prefs.setInt('accentColor', _accentColor.value);
    prefs.setString('selectedLanguage', _selectedLanguage);

    if (kDebugMode) {
      print('sauvegarde des parametres');
      print('\nmode sombre:$_tileManager');
      print('\nRalentir les animations:$_checkBoxManager');
      print('\ncouleur principale:$_primaryColor');
      print('\ncouleur d\'accentuation:$_accentColor');
      print('\nlangue:$_selectedLanguage');
    }
  }

  // ignore: avoid_positional_boolean_parameters
  Future<void> toggleDarkMode(bool value) async {
    _tileManager = value;
    notifyListeners();
    _saveSettings();
  }

  // ignore: avoid_positional_boolean_parameters
  void onCheckChanged(bool? value) {
    _checkBoxManager = value ?? true;
    notifyListeners();
    _saveSettings();
  }

  void toggleSlowMotion(bool value) {
    if (value) {
      timeDilation = 5.0; // Enable slow motion
    } else {
      timeDilation = 1.0; // Disable slow motion
    }
    _slowMotion = value;
    notifyListeners();
  }

  void onRadioChanged(RadioButtonOptions? value) {
    if (value != null) {
      _initialRadioChoice = value;
    }
    notifyListeners();
    _saveSettings();
  }

  void onPrimaryColorChange(Color value) {
    _primaryColor = value;
    notifyListeners();
    _saveSettings();
  }

  void onAccentColorChange(Color value) {
    _accentColor = value;
    notifyListeners();
    _saveSettings();
  }

  void onLanguageChanged(String value) {
    _selectedLanguage = value;
    notifyListeners();
    _saveSettings();
  }
}
