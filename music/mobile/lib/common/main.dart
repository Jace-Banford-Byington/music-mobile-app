import 'package:flutter/material.dart';
import 'package:mobile/common/colortheme.dart';
import 'package:mobile/common/music.dart';
import 'package:mobile/common/navigation.dart';
import 'package:mobile/common/profile.dart';
import 'package:mobile/common/settings.dart';
import 'package:provider/provider.dart';
import 'package:mobile/common/music.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text('Music App'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Searching for a song titled "mother mother"
          FutureBuilder<Song>(
            future: searchSong(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // While waiting for the song to be fetched, display a loading indicator
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                // If there's an error fetching the song, display an error message
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              } else {
                // If the song is fetched successfully, display it in a HistoryCard
                final song = snapshot.data!;
                return HistoryCard(
                  image: Image.network(song.url), // Assuming url contains the image URL
                  label: song.title,
                );
              }
            },
          ),
          Expanded(
            child: NavigationPage(
              selectedIndex: 0,
              onItemTapped: (index) {
                print('Item tapped: $index');
              },
            ),
          ),
        ],
      ),
    );
  }
}
class HistoryCard extends StatelessWidget {
  final Image image;
  final String label;

  const HistoryCard({
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
      child: Center(
        child: Text(
          label,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}