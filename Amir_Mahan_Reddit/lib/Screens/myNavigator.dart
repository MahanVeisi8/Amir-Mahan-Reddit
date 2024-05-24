import 'package:flutter/material.dart';
import 'dart:io';

import 'package:Amir_Mahan_Reddit/Screens/HomePage.dart';
import 'package:Amir_Mahan_Reddit/main.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:Amir_Mahan_Reddit/Screens/WelcomePage.dart';
import 'package:Amir_Mahan_Reddit/configuration/Palette.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:Amir_Mahan_Reddit/BasicClasses/Community.dart';
import 'package:Amir_Mahan_Reddit/BasicClasses/Comment.dart';
import 'package:Amir_Mahan_Reddit/BasicClasses/Post.dart';
import 'package:Amir_Mahan_Reddit/BasicClasses/Users.dart';

class myNavigator extends StatefulWidget {
  const myNavigator({Key key, this.username, this.content}) : super(key: key);
  final String username;
  final String content;
  @override
  State<myNavigator> createState() => _myNavigatorState();
}

class _myNavigatorState extends State<myNavigator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => HomePage(
                user: User(widget.username, "email", "password", true),
              ),
            ),
          );
        },
        child: Center(
          child: Text(
            // "Posted successfully",
            widget.content,
            style: TextStyle(
              color: Color(0xFF66FCF1),
              fontFamily: 'Gotham',
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
        ),
      ),
    );
  }
}
