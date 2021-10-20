import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lettutor/screens/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        shadowColor: Colors.black.withOpacity(0.05),
        primarySwatch: Colors.blue,
        backgroundColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        cardColor: Colors.white,
        cardTheme: CardTheme(
          color: Colors.white,
          shadowColor: Colors.black.withOpacity(0.05),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.blue,
        ),
      ),
      darkTheme: ThemeData(
        shadowColor: Colors.grey.withOpacity(0.05),
        brightness: Brightness.dark,
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.grey[850],
        cardTheme: CardTheme(
          color: Colors.grey[800],
          shadowColor: Colors.grey.withOpacity(0.05),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.white,
        ),
      ),
      themeMode: ThemeMode.system,
      home: MainScreen(),
    );
  }
}
