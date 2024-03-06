import 'package:flutter/material.dart';
import 'package:mobile/common/music.dart';
import 'package:mobile/common/profile.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mobile/common/settings.dart';
import 'package:mobile/common/colortheme.dart' as ColorTheme;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final preferences = await SharedPreferences.getInstance();
  bool isDarkMode = preferences.getBool('isDarkMode') ?? true;
  runApp(
    ChangeNotifierProvider(
      create: (context) => ColorTheme.ThemeProvider(initialDarkMode: isDarkMode),
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
      theme: Provider.of<ColorTheme.ThemeProvider>(context).theme,
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
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.ease);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Music App'),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: [
          HomeScreen(),
          SettingsPage(),
          Profile(isChecked: true)
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person_off_outlined),
          label: "Profile")
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        FutureBuilder<List<Song>>(
          future: searchSongs(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else {
              final List<Song> songs = snapshot.data!;
              return Expanded(
                child: ListView.builder(
                  itemCount: songs.length,
                  itemBuilder: (context, index) {
                    final song = songs[index];
                    return HistoryCard(
                      image: 'https://e-cdns-images.dzcdn.net/images/cover/${song.md5}/56x56-000000-80-0-0.jpg',
                      label: song.title,
                      url: song.url,
                    );
                  },
                ),
              );
            }
          },
        ),
      ],
    );
  }
}

class HistoryCard extends StatelessWidget {
  final String image;
  final String label;
  final String url;

  const HistoryCard({
    required this.image,
    required this.label,
    required this.url,
  });

 @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Play audio when history card is tapped
        PageManager(url).play();
      },
      child: Container(
        margin: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: Colors.blueGrey, width: 1.0),
        ),
        child: Column(
          children:[
             Image.network(
              image,
              fit: BoxFit.cover, // Adjust the image to fit the container
              width: double.infinity, // Set the image width to fill the container
              height: 200, // Set the image height
            ),
            SizedBox(height: 8),

            Text(
            label,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          ], 
        ),
      ),
    );
  }
}
