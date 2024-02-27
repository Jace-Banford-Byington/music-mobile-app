//where all color things are held. 
import 'package:flutter/material.dart';

//dark mode 
//#121212 black
//#150050 dark purple
//3F0071 mid purple 
//610094 lightest purple
//baby purple A367B1

class ThemeProvider with ChangeNotifier{
  bool isDarkMode = true; //Dark on as default

  ThemeData get theme => isDarkMode ? getDarkMode() : getLighMode();

  void toggleTheme() {
    isDarkMode = !isDarkMode;
    notifyListeners();
  }
}



ThemeData getDarkMode() {
  return ThemeData(
    scaffoldBackgroundColor: Color(0xFF121212), //Background
  appBarTheme: AppBarTheme(
    color: Color(0xFF150050), //Nav Bar
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(color: Color(0xFFA367B1)), //Nav Text
    bodyText2: TextStyle(color: Color(0xFF610094)) //Text 
  ),
  );
}



ThemeData getLighMode() {
  return ThemeData(
    scaffoldBackgroundColor: Color(0xFF624F82),
    appBarTheme: AppBarTheme(
      color:  Color(0xFF9F73AB),
    ),
    textTheme: TextTheme(
      bodyText1: TextStyle(color: Color(0xFF9F73AB)),
      bodyText2: TextStyle(color: Color(0xFFA3C7D6)),
    ),
  );
}


//Light Mode : 
//3F3B6C lighter dark purple   //background 
//624F82 middle purple  
//9F73AB pink  //nav bar 
//A3C7D6 blue    //text 

