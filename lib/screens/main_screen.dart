import 'package:flutter/material.dart';
import 'package:lettutor/data/local_data.dart';
import 'package:lettutor/screens/auth_screen/sign_in_screen.dart';

class MainScreen
 extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();

    LocalData.instance.loadTutors();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignInScreen(),
    );
  }
}
