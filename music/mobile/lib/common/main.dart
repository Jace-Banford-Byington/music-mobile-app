import 'package:flutter/material.dart';
import 'package:mobile/common/colortheme.dart';
import 'package:mobile/common/navigation.dart';
import 'package:mobile/common/profile.dart';
import 'package:mobile/common/settings.dart';
import 'package:provider/provider.dart';

import 'package:http/http.dart' as http;

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music App',
      theme: Provider.of<ThemeProvider>(context).theme,
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Main Screen'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            HistoryCard(
              image: 'https://picsum.photos/200',
              label: 'Listening History Item 1',
            ),
            HistoryCard(
              image: 'https://picsum.photos/200',
              label: 'Listening History Item 2',
            ),
            Expanded(
              child: NavigationPage(
                selectedIndex: _selectedIndex,
                onItemTapped: (index) => _handleNavigation(context, index),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleNavigation(BuildContext context, int index) {
    print('Item tapped: $index');
    setState(() {
      _selectedIndex = index;
    });
    // Perform navigation based on the index
    if (index == 0) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => MainScreen()));
    } else if (index == 1) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => SettingsPage()));
    } else if (index == 2) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Profile()));
    }
  }
}

class HistoryCard extends StatelessWidget {
  final String image;
  final String label; 

  const HistoryCard ({
    required this.image,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.blue, width: 2.0),
      ),
      child: Column(
        children: [
          Image.network(
            image,
            width: 200, // Adjust width as needed
            height: 200, // Adjust height as needed
          ),
          SizedBox(height: 10),
          Center(
            child: Text(
              label,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
