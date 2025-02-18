import 'package:flutter/material.dart';
import 'package:keepsettings/keepsettings.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';

//import '../component/colorpicker.dart';
import '../component/colorpicker.dart';
import '../providers/settingsprovider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  void initState() {
    super.initState();
    SettingsProvider().init();
  }

  @override
  Widget build(BuildContext context) {
    final settingsProvider = Provider.of<SettingsProvider>(context);
    //Color _primaryColor = settingsProvider.primaryColor;
    //Color _accentColor = settingsProvider.accentColor;

    return Consumer<SettingsProvider>(
      builder: (context, settingsProvider, child) {
        //primaryColor = settingsProvider.primaryColor;
        //_accentColor = settingsProvider.accentColor;
        return MaterialApp(
          theme: settingsProvider.tileManager
              ? ThemeData.dark()
              : ThemeData.light(),
          home: Scaffold(
            appBar: AppBar(
              title: const Center(child: Text('Parametres')),
              backgroundColor: settingsProvider.primaryColor,
            ),
            body: SafeArea(
              child: settingsList(),
            ),
          ),
        );
      },
    );
  }

  Widget settingsList() {
    final settingsProvider = Provider.of<SettingsProvider>(context);
    return SettingsList(
      sections: [
        TilesSection(
          title: 'Parametres',
          tiles: [
            SettingsTile(
              title: 'Langue',
              leading: const Icon(Icons.language),
              trailing: PopupMenuButton(
                icon: Icon(Icons.arrow_drop_down,
                    color: settingsProvider.accentColor),
                iconSize: 30,
                itemBuilder: (_) => supportedLanguages
                    .map(
                      (e) => PopupMenuItem(
                        value: e.languageCode,
                        child: Text(e.name),
                      ),
                    )
                    .toList(),
                onSelected: settingsProvider.onLanguageChanged,
              ),
            ),
            /* SettingsTile(
              trailing: const Icon(
                CupertinoIcons.forward,
              ),
              title: 'Couleur principale',
              leading: const Icon(
                Icons.color_lens_outlined,
              ),
              onPressed: (_) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return ColorPicker(
                      primaryColors,
                      settingsProvider.onPrimaryColorChange,
                      pickerColor: Colors.blue,
                      onColorChanged: (Color value) {},
                      availableColors: const [],
                    );
                  },
                );
              },
            ),
            SettingsTile(
              trailing: const Icon(
                CupertinoIcons.forward,
              ),
              title: ' Couleur d\'accentuation',
              leading: const Icon(
                Icons.color_lens_outlined,
              ),
              onPressed: (_) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return ColorPicker(
                      primaryColors,
                      settingsProvider
                          .onAccentColorChange, // Use onAccentColorChange here
                      pickerColor: Colors.blue,
                      onColorChanged: (Color value) {},
                      availableColors: const [],
                    );
                  },
                );
              },
            ), */
            SettingsTile(
              trailing: const Icon(
                CupertinoIcons.forward,
              ),
              title: 'Couleur principale',
              leading: const Icon(Icons.color_lens_outlined),
              onPressed: (_) {
                colorPicker(
                    primaryColors,
                    settingsProvider.onPrimaryColorChange,
                    settingsProvider.primaryColor);

                /* ColorPicker(
                  primaryColors,
                  settingsProvider.onPrimaryColorChange,
                  pickerColor: Colors.blue,
                  onColorChanged: (Color value) {},
                  availableColors: const [],
                ); */
              },
            ),
            SettingsTile(
              trailing: const Icon(
                CupertinoIcons.forward,
              ),
              title: ' Couleur d\'accentuation',
              leading: const Icon(
                Icons.color_lens_outlined,
              ),
              onPressed: (_) {
                colorPicker(accentColors, settingsProvider.onAccentColorChange,
                    settingsProvider.accentColor);

/* 
                ColorPicker(
                  primaryColors,
                  settingsProvider.onPrimaryColorChange,
                  pickerColor: Colors.blue,
                  onColorChanged: (Color value) {},
                  availableColors: const [],
                ); */
              },
            ),
            SettingsTile.switchTile(
              title: ' Mode sombre',
              subtitle: 'Sauver vos yeux',
              leading: const Icon(CupertinoIcons.cloud_sun),
              switchActiveColor: settingsProvider.accentColor,
              switchValue: settingsProvider.tileManager,

              onToggle: settingsProvider.toggleDarkMode,

              //togglerShape: TogglerShapes.heart,
            ),
            SettingsTile.checkListTile(
              leading: const Icon(CupertinoIcons.slowmo),
              onChanged: (value) {
                settingsProvider.toggleSlowMotion(value!);
              },
              enabled: settingsProvider.slowMotion,
              title: 'Ralentir les animations',
            ),
            SettingsTile(
              onPressed: (_) {
                Navigator.of(context).maybePop();
              },
              title: 'Retour a l\'ecran principal',
              subtitle: 'Accueil',
              leading: const Icon(CupertinoIcons.back),
            ),
          ],
        ),
        /* 
        SettingsTile.switchTile(
              title: 'Desactiver les Notifications Push',
              leading: const Icon(CupertinoIcons.bell),
              switchActiveColor: Theme.of(context).colorScheme.secondary,
              switch Value: _tileManager,
              onToggle: toggleDarkMode, switchValue: null,
            ),
        SliderSection(
          slider: SliderTile(
            initialSliderValue: initialValue,
            onSliderChange: (value) {
              setState(() {
                initialValue = value;
              });
            },
            min: 0,
            max: 100,
          ),
          title: 'Slider',
        ), */
        /* RadioButtonSection(
          title: 'Radio Button',
          tiles: [
            RadioButton<RadioButtonOptions>(
              label: 'Monthly',
              value: RadioButtonOptions.op1,
              groupValue: _initialRadioChoice,
              onChanged: onRadioChanged,
            ),
            RadioButton<RadioButtonOptions>(
              label: 'Yearly',
              value: RadioButtonOptions.op2,
              groupValue: _initialRadioChoice,
              onChanged: onRadioChanged,
            ),
            RadioButton<RadioButtonOptions>(
              label: 'Life Time',
              value: RadioButtonOptions.op3,
              groupValue: _initialRadioChoice,
              onChanged: onRadioChanged,
            ),
          ],
        ), */
      ],
    );
  }

  Future<void> colorPicker(
      List<Color> appColors, onColorChange, pickedcolor) async {
    final status = await showDialog(
          barrierDismissible: true,
          context: context,
          builder: (context) => MyAlertDialog(
            title: const Text('Choisissez une couleur'),
            content: SingleChildScrollView(
              child: ColorPicker(
                appColors,
                onColorChange,
                pickerColor: pickedcolor,
                onColorChanged: onColorChange,
                availableColors: appColors,
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: const Text('Terminé'),
              ),
            ],
          ),
        ) ??
        false;
    if (status) {}
  }

  List<LanguageData> supportedLanguages = <LanguageData>[
    LanguageData('🇺🇸', 'English', 'en'),
    LanguageData('🇫🇷', 'Français', 'fr'),
  ];
}

class MyAlertDialog extends StatelessWidget {
  const MyAlertDialog({
    required this.content,
    required this.title,
    this.actions,
    super.key,
  });

  final Widget title;
  final List<Widget>? actions;
  final Widget content;

  @override
  Widget build(BuildContext context) => AlertDialog(
        title: Center(child: title),
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Theme.of(context).iconTheme.color!.withOpacity(0.1),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        content: content,
        actions: actions,
      );
}

class LanguageData {
  LanguageData(this.flag, this.name, this.languageCode);

  final String flag;
  final String name;
  final String languageCode;
}

enum RadioButtonOptions { op1, op2, op3 }

List<Color> primaryColors = <Color>[
  Colors.red,
  Colors.pink,
  Colors.purple,
  Colors.deepPurple,
  Colors.indigo,
  Colors.blue,
  Colors.cyan,
  Colors.teal,
  Colors.green,
  Colors.lightGreen,
  Colors.lime,
  Colors.amber,
  Colors.orange,
  Colors.deepOrange,
  Colors.brown,
  Colors.grey,
  Colors.blueGrey,
  Colors.black,
];

List<Color> accentColors = <Color>[
  Colors.redAccent,
  Colors.pinkAccent,
  Colors.purpleAccent,
  Colors.deepPurpleAccent,
  Colors.indigoAccent,
  Colors.blueAccent,
  Colors.cyanAccent,
  Colors.tealAccent,
  Colors.greenAccent,
  Colors.lightGreenAccent,
  Colors.limeAccent,
  Colors.amberAccent,
  Colors.orangeAccent,
  Colors.deepOrangeAccent,
  Colors.lightBlueAccent,
  const Color(0xFFFF7582),
];
