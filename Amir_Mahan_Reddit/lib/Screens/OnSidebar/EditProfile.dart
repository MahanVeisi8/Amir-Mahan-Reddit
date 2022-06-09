import 'package:Amir_Mahan_Reddit/BasicClasses/Community.dart';
import 'package:Amir_Mahan_Reddit/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:Amir_Mahan_Reddit/Screens/OnSidebar/SavedPosts.dart';
import 'package:Amir_Mahan_Reddit/Screens/OnSidebar/ThemeChoosing.dart';
import 'package:Amir_Mahan_Reddit/Screens/OnSidebar/ProfilePage.dart';
import 'package:Amir_Mahan_Reddit/Screens/OnSidebar/AboutUs.dart';
import 'package:Amir_Mahan_Reddit/Screens/SettingPage.dart';
import 'package:Amir_Mahan_Reddit/Screens/HomePage.dart';
import 'package:Amir_Mahan_Reddit/Widgets/sideBarDrawer.dart';
import 'package:Amir_Mahan_Reddit/Widgets/SideBarButtonWidget.dart';
import 'package:Amir_Mahan_Reddit/Screens/WelcomePage.dart';
import 'package:Amir_Mahan_Reddit/Screens/SignLogIn.dart';
import 'package:Amir_Mahan_Reddit/Screens/loadPage.dart';
class EditProfile extends StatefulWidget {
  const EditProfile({Key key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Edit Profile'),
        backgroundColor: Colors.black87,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Center(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.23,
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.015),
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/AlliSherlock.jpg'),
                  radius: MediaQuery.of(context).size.width * 0.2,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoadPage(),
                  ),
                );
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width * 0.9,
                child: Center(
                  child: Text(
                    'Edit Profile',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                      color: Color(0xFF66FCF1),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            Container(
              // height: MediaQuery.of(context).size.height * 0.09,
              height: 70,
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextField(
                style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                ),
                decoration: InputDecoration(
                  hintText: 'First name and Last name',
                  hintStyle: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                    color: Colors.white,
                  ),
                  label: Text(
                    'Name',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                      color: Color(0xFFC5C6C7),
                    ),
                  ),
                  prefixIcon: Icon(
                    Icons.person_pin,
                    color: Color(0xFF66FCF1),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Container(
              // height: MediaQuery.of(context).size.height * 0.09,
              height: 70,
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextField(
                style: TextStyle(
                  color: Colors.white,
                  fontSize: MediaQuery.of(context).size.width * 0.05,
                ),
                decoration: InputDecoration(
                  hintText: 'Example123',
                  hintStyle: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                    color: Colors.white,
                  ),
                  prefixIcon: Icon(
                    Icons.person,
                    color: Color(0xFF66FCF1),
                  ),
                  label: Text(
                    'Username',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                      color: Color(0xFFC5C6C7),
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Container(
              // height: MediaQuery.of(context).size.height * 0.09,
              height: 70,
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextField(
                style: TextStyle(
                  color: Colors.white,
                  fontSize: MediaQuery.of(context).size.width * 0.05,
                ),
                decoration: InputDecoration(
                  hintText: 'pasxpas',
                  hintStyle: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                    color: Colors.white,
                  ),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Color(0xFF66FCF1),
                  ),
                  label: Text(
                    'Password',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                      color: Color(0xFFC5C6C7),
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Container(
              // height: MediaQuery.of(context).size.height * 0.09,
              height: 70,
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextField(
                style: TextStyle(
                  color: Colors.white,
                  fontSize: MediaQuery.of(context).size.width * 0.05,
                ),
                decoration: InputDecoration(
                  hintText: 'Example@gmail.com',
                  hintStyle: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                    color: Colors.white,
                  ),
                  prefixIcon: Icon(
                    Icons.email,
                    color: Color(0xFF66FCF1),
                  ),
                  label: Text(
                    'Email',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                      color: Color(0xFFC5C6C7),
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Container(
              // height: MediaQuery.of(context).size.height * 0.09,
              height: 70,
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextField(
                style: TextStyle(
                  color: Colors.white,
                  fontSize: MediaQuery.of(context).size.width * 0.05,
                ),
                decoration: InputDecoration(
                  hintText: '09187654321',
                  hintStyle: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                    color: Colors.white,
                  ),
                  prefixIcon: Icon(
                    Icons.phone,
                    color: Color(0xFF66FCF1),
                  ),
                  label: Text(
                    'Phone Number',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                      color: Color(0xFFC5C6C7),
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
    ],
    ),
      ),
    );
  }
}
