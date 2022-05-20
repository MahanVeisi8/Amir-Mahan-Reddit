import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:Amir_Mahan_Reddit/Splash/SplashScreen.dart';
import 'package:Amir_Mahan_Reddit/Screens/SignLogIn.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        // animationDuration: ,
        splash: Image.asset(
          'assets/images/image.png',
          // fit: BoxFit.cover,
        ),
        nextScreen: LoginSignupScreen(),

        // splashTransition: SplashTransition.rotationTransition,
        backgroundColor: Colors.redAccent,
      ),

    );

  }
}