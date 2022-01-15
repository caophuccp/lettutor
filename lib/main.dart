import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lettutor/api/auth_apis.dart';
import 'package:lettutor/api/user_apis.dart';
import 'package:lettutor/config/global.dart';
import 'package:lettutor/extensions/local_storage_service.dart';
import 'package:lettutor/extensions/navigate_extensions.dart';
import 'package:lettutor/models/tokens.dart';
import 'package:lettutor/screens/auth_screen/sign_in_screen.dart';
import 'package:lettutor/screens/main_screen.dart';
import 'package:lettutor/screens/main_tab.dart';

void main() {
  // await LocalData.instance.loadTutors();
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
        // splashColor: Colors.grey[100],
        // highlightColor: Colors.grey[100],
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
        // splashColor: Colors.grey[700],
        // highlightColor: Colors.grey[700],
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
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      initData();
    });
  }

  void initData() async {
    final storage = LocalStorageService.shared;
    await storage.init();
    final tokensString = storage.getString(key: LocalStorageKey.TOKENS) ?? '';
    if (tokensString.isEmpty) {
      navigateWithoutAnimation(SignInScreen());
    } else {
      final tokens = Tokens.fromJson(json.decode(tokensString));
      final rToken = tokens.refresh;
      if (rToken == null || rToken.expires.millisecondsSinceNow > 0) {
        navigateWithoutAnimation(SignInScreen());
      } else {
        refreshToken(rToken.token);
      }
    }
  }

  void refreshToken(String token) async {
    try {
      final response = await AuthAPIs.refreshToken(token);
      final user = response.result;
      if (user != null) {
        Global.user = user;
        navigateWithoutAnimation(MainTab());
        return;
      }
    } catch (e, s) {
      navigateWithoutAnimation(SignInScreen());
      print(e);
      print(s);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CupertinoActivityIndicator(),
      ),
    );
  }
}
