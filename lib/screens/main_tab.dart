import 'package:flutter/material.dart';
import 'package:lettutor/screens/home_screen/home_screen.dart';
import 'package:lettutor/screens/tutors_screen/tutors_screen.dart';

/// This is the stateful widget that the main application instantiates.
class MainTab extends StatefulWidget {
  const MainTab({Key? key}) : super(key: key);

  @override
  State<MainTab> createState() => _MainTabState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MainTabState extends State<MainTab> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    Center(
      child: Text(
        'Tab Index 1',
      ),
    ),
    Center(
      child: Text(
        'Tab Index 2',
      ),
    ),
    TutorsScreen(),
    Center(
      child: Text(
        'Tab Index 4',
      ),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.change_history),
            label: 'Message',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule),
            label: 'Upcoming',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.speaker_outlined),
            label: 'Tutors',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        onTap: _onItemTapped,
      ),
    );
  }
}
