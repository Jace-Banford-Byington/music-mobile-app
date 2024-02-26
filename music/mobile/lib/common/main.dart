import 'package:flutter/material.dart';
import "package:mobile/common/main.dart";
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String appTitle = "Music App";
    const Color backgroundColor = Color(0xFF121212); 
    const Color textColor = Color(0xFF610094);
        const Color textColor2 = Color(0xFF610094);

    const Color navColor = Color(0xFF150050);

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
              Text("Recently Played",style: TextStyle(color: textColor),),
              // GridView.count(
                
              //   crossAxisCount: 2,
              //   shrinkWrap: true,
              //   physics: NeverScrollableScrollPhysics(),
              //   children: List.generate(
              //     6,(index){
              //       String image ='';
              //       String label ='';
              //       switch(index){
              //         case 0:
              //           image = "Hi";
              //           label = "Mother Mother";
              //           break;
              //         case 1:
              //           image = "Hi";
              //           label = "Mother Mother";
              //           break;
              //         case 2:
              //           image = "Hi";
              //           label = "Mother Mother";
              //           break;
              //         case 3:
              //           image = "Hi";
              //           label = "Mother Mother";
              //           break;
              //         case 4:
              //           image = "Hi";
              //           label = "Mother Mother";
              //           break;
              //         case 5:
              //           image = "Hi";
              //           label = "Mother Mother";
              //           break;
              //       }
              //     }
              //     return GuestureDetector(
              //       onTap: () {
              //         print('Box $index clicked');
              //         },
              //         child: Container(
              //           margin: const EdgeInsets.all(6),
              //           decoration: BoxDecoration(
              //             borderRadius: BorderRadius.circular(10),
              //             color: Colors.white,
              //             boxShadow: [
              //               BoxShadow(
              //                 color: Colors.grey.withOpacity(0.5),
              //                 spreadRadius: 1,
              //                 blurRadius: 2,
              //                 offset: const Offset(3, 3),
              //               ),
              //             ],
              //           ),
              //     )
              //   )
              // ),
             
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

class HistoryCard extends StatelessWidget {
     final String image; //Temparaily a string to simply see if it shows up properly
    final String label; 

    const HistoryCard ({
      required this.image,
      required this.label,
    });

   @override
  Widget build(BuildContext context) {
   return SizedBox(
      width: 20, // Adjust width according to your requirement
      height: 10, // Adjust height according to your requirement
      child: Container(
        margin: EdgeInsets.all(6.0), // Add margin around each grid item
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.0), // Add border radius
          border: Border.all(color: Colors.black, width: 2.0), // Add border
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
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



//Method that takes the users current time and has it change between 
//"Good morning" if beforen noon
//"Good Afternoon" if 1 - 4
//"Good Evening" 5-midnignht