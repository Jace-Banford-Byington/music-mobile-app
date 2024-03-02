import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Add this import
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mobile/common/colortheme.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isDarkMode = true;

  @override
  void initState() {
    super.initState();
    _loadThemePreference();
  }

  Future<void> _loadThemePreference() async {
    final presences = await SharedPreferences.getInstance();
    final bool? isDarkMode = presences.getBool('isDarkMode');
    if (isDarkMode != null) {
      setState(() {
        _isDarkMode = isDarkMode;
      });
  }
  }




  Future<void> _toggleTheme(bool value) async {
    final presences = await SharedPreferences.getInstance();
    await presences.setBool('isDarkMode', value);
    setState(() {
      _isDarkMode = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings',
        style:
        TextStyle(
          fontSize: 30, 
          fontWeight: FontWeight.w800, 
          color:  Theme.of(context).textTheme.bodyLarge!.color ), 
        ),
       leading: IconButton(
        icon: Icon(Icons.arrow_back),
        style: ButtonStyle(
          iconColor: MaterialStateProperty.all<Color?>(
            Theme.of(context).textTheme.bodyLarge?.color,
          ),
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Dark Mode',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Consumer<ThemeProvider>(
              builder: (context, themeProvider, child) => SwitchListTile(
                title: Text('Disable Dark Mode', 
                style: Theme.of(context).textTheme.bodySmall,
                ),
                value: themeProvider.isDarkMode, // Access isDarkMode directly
                
                onChanged: (value) async {
                  await _toggleTheme(value);
                  themeProvider.toggleTheme();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}