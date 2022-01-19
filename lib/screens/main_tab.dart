import 'package:flutter/material.dart';
import 'package:lettutor/screens/documents_screen/documents_screen.dart';
import 'package:lettutor/screens/home_screen/home_screen.dart';
import 'package:lettutor/screens/settings_screen/settings_screen.dart';
import 'package:lettutor/screens/tutors_screen/tutors_screen.dart';
import 'package:lettutor/screens/upcoming_screen/upcoming_screen.dart';

/// This is the stateful widget that the main application instantiates.
class MainTab extends StatefulWidget {
  const MainTab({Key? key}) : super(key: key);

  @override
  State<MainTab> createState() => _MainTabState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MainTabState extends State<MainTab> with SingleTickerProviderStateMixin{
  int _selectedIndex = 0;
  TabController? _controller;

  @override
  void initState() {
    super.initState();

    _controller = TabController(length: 5, vsync: this);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _controller?.animateTo(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: _controller,
        children: [
          HomeScreen(),
          UpcomingScreen(),
          TutorsScreen(),
          DocumentsScreen(),
          SettingsScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.change_history),
          //   label: 'Message',
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule),
            label: 'Upcoming',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.speaker_outlined),
            label: 'Tutors',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_rounded),
            label: 'E-Book',
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
