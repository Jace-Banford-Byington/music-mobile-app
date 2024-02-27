import 'package:flutter/material.dart';
import 'package:mobile/common/main.dart';
import 'package:mobile/common/profile.dart';
import 'package:mobile/common/settings.dart';

class NavigationPage extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const NavigationPage({Key? key, required this.selectedIndex, required this.onItemTapped}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getBody(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Main',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.picture_as_pdf_rounded),
            label: 'Profile'
          ),
        ],
      ),
    );
  }

  Widget _getBody(int index) {
    switch (index) {
      case 0:
        return Container(); // Return  main screen
      case 1:
        return SettingsPage();
      case 2:
        return Profile(); // Return profile
      default:
        return Container(); // Return  empty container if out of bounds
    }
  }
}


  Widget _getBody(int index, BuildContext context) {
    switch (index) {
      case 0:
        return GestureDetector(
          onTap: () {
             Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => MainScreen()), 
             );
          },
          child: MainScreen(),
        );
      case 1:
        return SettingsPage();
      // case 2:
      //   return Profile(isChecked: true); 
      default:
        return Container(); // Return an empty container if index is out of bounds
    }
  }