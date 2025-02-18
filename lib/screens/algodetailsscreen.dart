import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../providers/settingsprovider.dart'; // Import for clipboard functionality

class AlgoDetailScreen extends StatefulWidget {
  final String title;
  final String description;
  final String answer;
  final bool isRead; // New property to indicate if the algorithm has been read

  const AlgoDetailScreen({
    Key? key,
    required this.title,
    required this.description,
    required this.answer,
    this.isRead = false, // Default to false if not provided
  }) : super(key: key);

  @override
  _AlgoDetailScreenState createState() => _AlgoDetailScreenState();
}

class _AlgoDetailScreenState extends State<AlgoDetailScreen> {
  bool _isVisible = true; // Control visibility for animation

  @override
  void initState() {
    super.initState();
    // Optionally, you can set a timer to change visibility
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _isVisible = false; // Change visibility after 1 second
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final settingsProvider = Provider.of<SettingsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: settingsProvider.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Description',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: settingsProvider.primaryColor),
              ),
              SizedBox(height: 10),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    widget.description,
                    style: TextStyle(fontSize: 16, height: 1.5),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Answer',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: settingsProvider.primaryColor),
              ),
              SizedBox(height: 10),
              // Container for the answer with the copy button
              Stack(
                children: [
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Container(
                      padding: EdgeInsets.only(
                          top: 40,
                          right: 40,
                          left: 16,
                          bottom: 16), // Adjusted padding
                      decoration: BoxDecoration(
                        // Couleur pour "non lu"
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: SelectableText(
                        widget.answer,
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Courier',
                            color: settingsProvider.tileManager
                                ? Colors.white
                                : Colors.black),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 8,
                    top: 8,
                    child: IconButton(
                      icon: Icon(Icons.copy),
                      color: settingsProvider.primaryColor,
                      onPressed: () {
                        // Copy the answer to the clipboard
                        Clipboard.setData(ClipboardData(text: widget.answer))
                            .then((_) {
                          // Show a snackbar to indicate that the text has been copied
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content:
                                  Text('Algo copier dans le presse-papier!'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              AnimatedOpacity(
                opacity: _isVisible ? 1.0 : 0.0,
                duration: Duration(seconds: 1),
                child: Text(
                  'This text fades in and out!',
                  style: TextStyle(fontSize: 18, color: Colors.red),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
