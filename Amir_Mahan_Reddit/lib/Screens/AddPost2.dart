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

class AddPost2 extends StatefulWidget {
  const AddPost2({Key key}) : super(key: key);

  @override
  State<AddPost2> createState() => _AddPost2State();
}

class _AddPost2State extends State<AddPost2> {
  List<Community> communities = <Community>[];
  void initializer() {
    communities.add(new Community(
        new User("Setareh", "email", "password", false),
        "Logical_Circuits",
        "Here's a community for people who like to discuss logical circuits! Feel free to ask questions, and join the discussion!"));
    communities.add(new Community(new User("Amir", "email", "password", true),
        "Foosball_Kings", "Soccer is cool, but it's cooler on a table!"));
    communities.add(new Community(
        new User("Mahan", "email", "password", true),
        "Eminem_Fans_Society",
        "We're here to celebrate the fandom of our favourite singer! Join us!"));
    communities.add(new Community(
        new User("Amir", "email", "password", true),
        "AntiEminem_Fans_Society",
        "We're here to bullshitize all the acts of the previous community! We believe they know nothing about REAL Music!"));
    communities.add(new Community(
        new User("Matin", "email", "password", true),
        "IMDB_Eaters",
        "This is a community for Movies and Series Lovers! We love to discuss them!"));
    communities.add(new Community(
        new User("Amir", "email", "password", true),
        "Metalheads_Club",
        "Welcome to Metalheads Club! Don't forget Horns-ups!"));
    communities.add(new Community(new User("Sobhan", "email", "password", true),
        "Call_Of_Duty_Noobs", "If you're a noob like us, join us!"));
  }

  @override
  Widget build(BuildContext context) {
    initializer();
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text(
          "Post to",
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Gotham',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: communities.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                  onTap: () {},
                  child: Container(
                      color: Colors.transparent,
                      child: Material(
                          color: Colors.transparent,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            right: 10,
                                            left: 10,
                                            top: 15,
                                            bottom: 10),
                                        child: CircleAvatar(
                                          // backgroundColor: Colors.blueAccent,
                                          backgroundImage: AssetImage(
                                              "assets/images/Avatar.png"),
                                        ),
                                      ),
                                      Container(
                                        child: Text(
                                            "r/" + communities[index].getName(),
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'Gotham',
                                              fontSize: 18,
                                            )),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                        child: Container(
                                      margin: EdgeInsets.only(
                                          bottom: 15,
                                          left: 10,
                                          right: 10,
                                          top: 5),
                                      child: Text(
                                          communities[index].getDescription(),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              fontFamily: 'Gotham',
                                              fontSize: 12,
                                              color: Color.fromARGB(
                                                  177, 255, 255, 255))),
                                    )),
                                    Container(
                                        width: 1,
                                        height: 1,
                                        color: Colors.transparent)
                                  ]),
                              Container(height: 1, color: Colors.black54)
                            ],
                          ))));
            }),
      ),
    );
  }
}
