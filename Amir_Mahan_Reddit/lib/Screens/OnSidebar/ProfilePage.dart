import 'package:Amir_Mahan_Reddit/BasicClasses/Community.dart';
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
import 'package:Amir_Mahan_Reddit/Screens/OnSidebar/EditProfile.dart';


class UserPage extends StatefulWidget {
  const UserPage({Key key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: Color(0xFF1F2833),
      body: SingleChildScrollView(
        child: Expanded(
          child: Column(
            children: [
              SizedBox(
                height: 300,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    image: DecorationImage(
                      image: AssetImage('assets/images/AlliSherlock.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                  top: MediaQuery.of(context).size.height/2 * 0.8,
                  left: MediaQuery.of(context).size.width/2 * 0.20,
                  child:  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    padding: EdgeInsets.symmetric(
                        horizontal: 18,
                      vertical: 5
                    ),
                    child: Text(
                      'Sarah Absdsfsfsads',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFF5F5F5),
                      ),
                    ),
                    ),
                  ),
              SizedBox(
                height: 1,
                width: MediaQuery.of(context).size.width * 0.9,
                child: Container(
                  color: Color(0xFF66FCF1),
                ),
              ),
              Container(
                padding: EdgeInsets.all(15),
                height: MediaQuery.of(context).size.height * 0.29,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  // backgroundColor: Color(0xFF1F2833),
                  // color: Color(0xFF1F2833),
                  height: 200,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    // color: Colors.white,
                   color: Color(0xFF1F2833),
                    border: Border.all(
                      color: Color(0xFF66FCF1),
                      width: 1,
                    ),
                  ),
                  child: Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(20, 10, 10, 0),
                          height: 35,
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                            'Account',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFC5C6C7),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(20, 0, 10, 0),
                          // margin: EdgeInsets.only(left: 10),
                          height: 45,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.person,
                                    color: Color(0xFF66FCF1),
                                    size: 30,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    'Alli_Sherlock',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width * 0.1,
                                  ),
                                  Text(
                                    'Username',
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFFC5C6C7),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(20, 0, 10, 0),
                          // margin: EdgeInsets.only(left: 10),
                          height: 45,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.email,
                                    color: Color(0xFF66FCF1),
                                    size: 30,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    'ali@gmail.com',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width * 0.1,
                                  ),
                                  Text(
                                    'Email',
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFFC5C6C7),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      Container(
                        padding: EdgeInsets.fromLTRB(20, 0, 10, 0),
                        // margin: EdgeInsets.only(left: 10),
                        height: 45,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.phone,
                                  color: Color(0xFF66FCF1),
                                  size: 30,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  '+966-5-567-890',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.1,
                                ),
                                Text(
                                  'Phone',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFC5C6C7),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),


                          ],
                        ),
                  ),
                    ),
                  ),
              Container(
                padding: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width * 0.35,
                    0,
                    MediaQuery.of(context).size.width * 0.35,
                    0
                ),
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.width * 0.90,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    color: Colors.transparent,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EditProfile()),
                      );
                    },
                    child: Icon(
                      Icons.edit,
                      size: 35,
                    ),
                  ),
                decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFFdce3e2),
                    Color(0xFF0ffceb),
                    Color(0xFF30e3d6),
                    Color(0xFF1F2833),
                  ],
                ),
                  borderRadius: BorderRadius.circular(55),
                boxShadow: [
                  BoxShadow(
                      color: Colors.white,
                      offset: Offset(1.0, 1.0),
                      blurRadius: 1,
                      spreadRadius: 0.5),
                  BoxShadow(
                      color: Colors.grey[600],
                      offset: Offset(-1.0, -2.0),
                      blurRadius: 1,
                      spreadRadius: 0.5),
                   ],

                  )
                ),
              ),

            ],
    ),
        )
    ),
    );
  }
}










