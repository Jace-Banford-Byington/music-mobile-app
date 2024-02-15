import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String appTitle = "Music App";
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Text("Welcome to the Crow Moon music app"),
              Text("Recently visited"),
              Text("Recently Played"),
              Text("Currently playing"),
              Image.network(
                'https://www.themilfordmessenger.com/wp-content/uploads/2022/04/mother_mother_inside_artwork.jpg',
                width: 200,
                height: 200,
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 1,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
            BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.library_music_outlined), label: "Library")
          ],
        ),
      ),
    );
  }
}


// Container CurrentlyPlaying ()
//The album image 
//The song playing 
//the band 
//icon if you liked it 
//Paused button (or play if it is currently playing)




//#4E5873 light bli
//#2F3841 grey 
//#2F3841 black
//#483D4D bbrowning 
//#1D2C27 green

//Method that takes the users current time and has it change between 
//"Good morning" if beforen noon
//"Good Afternoon" if 1 - 4
//"Good Evening" 5-midnignht