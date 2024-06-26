import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:Amir_Mahan_Reddit/Splash/SplashScreen.dart';
import 'package:Amir_Mahan_Reddit/Screens/SignLogIn.dart';
import 'package:Amir_Mahan_Reddit/Screens/HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // static final String ip = "10.0.2.2";
  static final String ip = "192.168.43.137";
  // static final String ip = "192.168.1.37";
  static final int port = 8080;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        // animationDuration: ,
        splash: Image.asset(
          'assets/images/image.png',
          fit: BoxFit.fill,
        ),
        splashIconSize: 1000,
        nextScreen: LoginSignupScreen(),
        // nextScreen: HomePage(),
        // splashTransition: SplashTransition.rotationTransition,
        backgroundColor: Color(0xFF000000),
      ),
    );
  }
}
