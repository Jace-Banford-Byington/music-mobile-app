import 'package:flutter/material.dart';
import 'package:mobile/common/settings.dart';
import 'package:mobile/common/profile.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key, 
  required int selectedIndex, 
  required Null Function(dynamic index) onItemTapped}) 
  : super(key: key);

  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getBody(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.picture_as_pdf_rounded),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _getBody(int index) {
    switch (index) {
      case 0:
        return SettingsPage();
      case 1:
        return Profile(isChecked: true);
      default:
        return Container(); // Return an empty container if index is out of bounds
    }
  }
}

class SettingsButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SettingsPage()),
          );
        },
        child: Text('Go to Settings'),
      ),
    );
  }
}