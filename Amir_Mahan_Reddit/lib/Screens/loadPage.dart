import 'package:Amir_Mahan_Reddit/Screens/AddPost.dart';
import 'package:Amir_Mahan_Reddit/Screens/CommunitiesPage.dart';
import 'package:Amir_Mahan_Reddit/Screens/OnSidebar/ProfilePage.dart';
import 'package:Amir_Mahan_Reddit/Screens/PostPage.dart';
import 'package:Amir_Mahan_Reddit/Splash/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:Amir_Mahan_Reddit/Screens/SettingPage.dart';
import 'package:Amir_Mahan_Reddit/Widgets/sideBarDrawer.dart';
import 'package:Amir_Mahan_Reddit/Widgets/SideBarButtonWidget.dart';
import 'package:Amir_Mahan_Reddit/BasicClasses/Post.dart';
import 'package:Amir_Mahan_Reddit/BasicClasses/Users.dart';
import 'package:Amir_Mahan_Reddit/Screens/loadPage.dart';

import '../BasicClasses/Comment.dart';
import '../BasicClasses/Community.dart';

class LoadPage extends StatefulWidget {
  const LoadPage({Key key}) : super(key: key);

  @override
  State<LoadPage> createState() => _LoadPageState();
}

class _LoadPageState extends State<LoadPage> {
  String loadAddress = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Select Avatar",
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Gotham',
            fontWeight: FontWeight.bold,
          ),
        ),
        automaticallyImplyLeading: true,
        backgroundColor: Colors.black87,
      ),
      backgroundColor: Colors.black87,
      body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.,
                    children: [
                      FlatButton(
                        child: CircleAvatar(
                          radius: MediaQuery.of(context).size.width * 0.11,
                          backgroundImage: AssetImage('assets/images/morty.png'),
                          backgroundColor: Colors.transparent,
                        ),
                        onPressed: () {
                          loadAddress = "assets/images/morty.png";
                          Navigator.pop(context);
                        },
                      ),
                      FlatButton(
                        child: CircleAvatar(
                          radius: MediaQuery.of(context).size.width * 0.11,
                          backgroundImage: AssetImage('assets/images/jerry.png'),
                          backgroundColor: Colors.transparent,
                        ),
                        onPressed: () {
                          loadAddress = "assets/images/jerry.png";
                          Navigator.pop(context);
                        },
                      ),
                      FlatButton(
                        child: CircleAvatar(
                          radius: MediaQuery.of(context).size.width * 0.11,
                          backgroundImage: AssetImage('assets/images/Jessica.png'),
                          backgroundColor: Colors.transparent,
                        ),
                        onPressed: () {
                          loadAddress = "assets/images/Jessica.png";
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      FlatButton(
                        child: CircleAvatar(
                          radius: MediaQuery.of(context).size.width * 0.11,
                          backgroundImage: AssetImage('assets/images/Beth.png'),
                          backgroundColor: Colors.transparent,
                        ),
                        onPressed: () {
                          loadAddress = "assets/images/Beth.png";
                          Navigator.pop(context);
                        },
                      ),
                      FlatButton(
                        child: CircleAvatar(
                          radius: MediaQuery.of(context).size.width * 0.11,
                          backgroundImage: AssetImage('assets/images/summer.png'),
                          backgroundColor: Colors.transparent,
                        ),
                        onPressed: () {
                          loadAddress = "assets/images/summer.png";
                          Navigator.pop(context);
                        },
                      ),
                      FlatButton(
                        child: CircleAvatar(
                          radius: MediaQuery.of(context).size.width * 0.11,
                          backgroundImage: AssetImage('assets/images/Doofus_Rick.png'),
                          backgroundColor: Colors.transparent,
                        ),
                        onPressed: () {
                          loadAddress = "assets/images/Doofus_Rick.png";
                          Navigator.pop(context);
                        },
                      ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  FlatButton(
                    child: CircleAvatar(
                      radius: MediaQuery.of(context).size.width * 0.11,
                      backgroundImage: AssetImage('assets/images/Lawnmower_dog.png'),
                      backgroundColor: Colors.transparent,
                    ),
                    onPressed: () {
                      loadAddress = "assets/images/Lawnmower_dog.png";
                      Navigator.pop(context);
                    },
                  ),
                  FlatButton(
                    child: CircleAvatar(
                      radius: MediaQuery.of(context).size.width * 0.11,
                      backgroundImage: AssetImage('assets/images/Avatar2.png'),
                      backgroundColor: Colors.transparent,
                    ),
                    onPressed: () {
                      loadAddress = "assets/images/Avatar2.png";
                      Navigator.pop(context);
                    },
                  ),
                  FlatButton(
                    child: CircleAvatar(
                      radius: MediaQuery.of(context).size.width * 0.11,
                      backgroundImage: AssetImage('assets/images/Avatar.png'),
                      backgroundColor: Colors.transparent,
                    ),
                    onPressed: () {
                      loadAddress = "assets/images/Avatar.png";
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  FlatButton(
                    child: CircleAvatar(
                      radius: MediaQuery.of(context).size.width * 0.11,
                      backgroundImage: AssetImage('assets/images/Squanchy.png'),
                      backgroundColor: Colors.transparent,
                    ),
                    onPressed: () {
                      loadAddress = "assets/images/Squanchy.png";
                      Navigator.pop(context);
                    },
                  ),
                  FlatButton(
                    child: CircleAvatar(
                      radius: MediaQuery.of(context).size.width * 0.11,
                      backgroundImage: AssetImage('assets/images/Rick.png'),
                      backgroundColor: Colors.transparent,
                    ),
                    onPressed: () {
                      loadAddress = "assets/images/Rick.png";
                      Navigator.pop(context);
                    },
                  ),
                  FlatButton(
                    child: CircleAvatar(
                      radius: MediaQuery.of(context).size.width * 0.11,
                      backgroundImage: AssetImage('assets/images/Evil_Morty.png'),
                      backgroundColor: Colors.transparent,
                    ),
                    onPressed: () {
                      loadAddress = "assets/images/Evil_Morty.png";
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 100,
              ),
               FlatButton(
                   onPressed: () {
                     Navigator.pop(context);
                   },
                   child: Text(
                     'Choose from Gallery',
                     style: TextStyle(
                       fontFamily: 'Gotham',
                       fontWeight: FontWeight.bold,
                       fontSize: 20,
                       color: Color(0xFF66FCF1),
                     ),
                   ),
               ),
              // SizedBox(
              //   height: 10,
              // ),
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    fontFamily: 'Gotham',
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
             ]
            ),
      )
      ),
    ),
    );
  }
}
