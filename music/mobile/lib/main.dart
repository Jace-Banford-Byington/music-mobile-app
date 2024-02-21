import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String appTitle = "Music App";
    const Color backgroundColor = Color(0xFF6b8094); 
    const Color textColor = Color(0xFF191921);
        const Color textColor2 = Color(0xFF483D4D);

    const Color navColor = Color(0xFF556575);

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title:  Text(
            appTitle,
            style: TextStyle(color: textColor2),
            ),
            backgroundColor: navColor,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Text("Welcome to the Crow Moon music app",style: TextStyle(color: textColor),),
              Text("Recently visited",style: TextStyle(color: textColor),),
              Text("Recently Played",style: TextStyle(color: textColor),),
              
              Container(
                width: double.infinity, // Width spans the entire screen
                color: Colors.brown[300], // Example background color
                padding: EdgeInsets.all(8.0), // Add padding around the text
                child: Text(
                  "Currently playing",
                  style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
                ),     
              ),
              Image.network(
                'https://www.themilfordmessenger.com/wp-content/uploads/2022/04/mother_mother_inside_artwork.jpg',
                width: 200,
                height: 200,
              ),

            ],
          ),
        ),
        backgroundColor: backgroundColor,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 1,
          backgroundColor: navColor,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.search, color: textColor2), label: "Search"),
            BottomNavigationBarItem(icon: Icon(Icons.home_filled,color: textColor2), label: "Home",),
            BottomNavigationBarItem(
              icon: Icon(Icons.library_music_outlined, color: textColor2), 
              label: "Library",
              )
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
//646D72

//Method that takes the users current time and has it change between 
//"Good morning" if beforen noon
//"Good Afternoon" if 1 - 4
//"Good Evening" 5-midnignht