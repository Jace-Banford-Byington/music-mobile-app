import 'package:flutter/material.dart';
import 'package:mobile/common/colortheme.dart';
import 'package:mobile/common/navigation.dart';
import 'package:mobile/common/profile.dart';
import 'package:mobile/common/settings.dart';
import 'package:provider/provider.dart';

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
     home: MainScreen() ,
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Display the history card
        HistoryCard(
          image: Image.asset('your_image_asset_path'), // Replace 'your_image_asset_path' with the actual path to your image asset
          label: 'Listening History Item 1', // Add a label for the history card
        ),
        HistoryCard(
          image: Image.asset('your_image_asset_path'), // Replace 'your_image_asset_path' with the actual path to your image asset
          label: 'Listening History Item 2', // Add a label for the history card
        ),
        Expanded(
          child: NavigationPage(
            selectedIndex: 0, // Set the initial selected index for the navigation page
            onItemTapped: (index) {
               print('Item tapped: $index');
              
            },
          ),
        ),
      ],
    );
  }
}


class HistoryCard extends StatelessWidget {
     final Image image;
    final String label; 

    const HistoryCard ({
      required this.image,
      required this.label,
    });

   @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0), // Add margin around each grid item
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0), // Add border radius
        border: Border.all(color: Colors.blue, width: 2.0), // Add border
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
