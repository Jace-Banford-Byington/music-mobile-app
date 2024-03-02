//where all color things are held. 

//dark mode 
//#121212 black
//#150050 dark purple
//3F0071 mid purple 
//610094 lightest purple
//baby purple A367B1

import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  bool isDarkMode; 

    ThemeProvider({required bool initialDarkMode}) : isDarkMode = initialDarkMode;


  ThemeData get theme => isDarkMode ? getDarkMode() : getLightMode();

  void toggleTheme() {
    isDarkMode = !isDarkMode;
    notifyListeners();
  }

  ThemeData getDarkMode() {
    return ThemeData(
      scaffoldBackgroundColor: Color(0xFF121212),
      appBarTheme: AppBarTheme(
        color: Color(0xFF150050),
      ),
      textTheme: TextTheme(
        bodySmall: TextStyle(color: Color(0xFFA367B1)),
        bodyLarge: TextStyle(color: Color(0xFF610094)),
        bodyMedium: TextStyle(color: Color(0xFF3F0071)),
      ),
    );
  }

  ThemeData getLightMode() {
    return ThemeData(
      scaffoldBackgroundColor: Color(0xFF624F82),
      appBarTheme: AppBarTheme(
        color: Color(0xFF9F73AB),
      ),
      textTheme: TextTheme(
        bodySmall: TextStyle(color: Color(0xFF9F73AB)),
        bodyLarge: TextStyle(color: Color(0xFFA3C7D6)),
        bodyMedium: TextStyle(color: Color(0xFF3F3B6C)),
      ),
    );
  }
}


//Light Mode : 
//3F3B6C lighter dark purple   //background 
//624F82 middle purple  
//9F73AB pink  //nav bar 
//A3C7D6 blue    //text 

