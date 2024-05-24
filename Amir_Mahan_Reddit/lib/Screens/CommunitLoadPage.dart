import 'package:Amir_Mahan_Reddit/Screens/AddPost.dart';
import 'package:Amir_Mahan_Reddit/Screens/CommunitiesPage.dart';
import 'package:Amir_Mahan_Reddit/Screens/OnSidebar/EditProfile.dart';
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

class CommunityLoadPage extends StatefulWidget {
  const CommunityLoadPage({Key key, this.community}) : super(key: key);
  final Community community;
  @override
  State<CommunityLoadPage> createState() => _CommunityLoadPageState();
}

class _CommunityLoadPageState extends State<CommunityLoadPage> {
  String loadAddress = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Select Image",
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
              child: Column(children: [
                SizedBox(
                  height: 20,
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.,
                  children: [
                    FlatButton(
                      child: CircleAvatar(
                        radius: MediaQuery.of(context).size.width * 0.11,
                        backgroundImage: AssetImage('assets/images/communityProf/1.png'),
                        backgroundColor: Colors.transparent,
                      ),
                      onPressed: () {
                        setState(() {
                          loadAddress = "assets/images/communityProf/1.png";
                          // widget.community.profilePicture = "0";
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditProfile(
                              // community: widget.community,
                            ),
                          ),
                        );
                      },
                    ),
                    FlatButton(
                      child: CircleAvatar(
                        radius: MediaQuery.of(context).size.width * 0.11,
                        backgroundImage: AssetImage('assets/images/communityProf/2.png'),
                        backgroundColor: Colors.transparent,
                      ),
                      onPressed: () {
                        setState(() {
                          loadAddress = "assets/images/communityProf/2.png";
                          // widget.community.profilePicture = "1";
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditProfile(
                              // community: widget.community,
                            ),
                          ),
                        );
                      },
                    ),
                    FlatButton(
                      child: CircleAvatar(
                        radius: MediaQuery.of(context).size.width * 0.11,
                        backgroundImage: AssetImage('assets/images/communityProf/3.png'),
                        backgroundColor: Colors.transparent,
                      ),
                      onPressed: () {
                        setState(() {
                          loadAddress = "assets/images/communityProf/3.png";
                          // widget.community.profilePicture = "2";
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditProfile(
                              // community: widget.community,
                            ),
                          ),
                        );
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
                          backgroundImage: AssetImage('assets/images/communityProf/4.png'),
                          backgroundColor: Colors.transparent,
                        ),
                        onPressed: () {
                          setState(() {
                            loadAddress = "assets/images/communityProf/4.png";
                            // widget.community.profilePicture = "3";
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditProfile(
                                // community: widget.community,
                              ),
                            ),
                          );
                        }),
                    FlatButton(
                      child: CircleAvatar(
                        radius: MediaQuery.of(context).size.width * 0.11,
                        backgroundImage: AssetImage('assets/images/communityProf/5.png'),
                        backgroundColor: Colors.transparent,
                      ),
                      onPressed: () {
                        setState(() {
                          loadAddress = "assets/images/communityProf/5.png";
                          // widget.community.profilePicture = "4";
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditProfile(
                              // community: widget.community,
                            ),
                          ),
                        );
                      },
                    ),
                    FlatButton(
                      child: CircleAvatar(
                        radius: MediaQuery.of(context).size.width * 0.11,
                        backgroundImage: AssetImage('assets/images/communityProf/6.png'),
                        backgroundColor: Colors.transparent,
                      ),
                      onPressed: () {
                        setState(() {
                          loadAddress = "assets/images/communityProf/6.png";
                          // widget.community.profilePicture = "5";
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditProfile(
                              // community: widget.community,
                            ),
                          ),
                        );
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
                        backgroundImage: AssetImage('assets/images/communityProf/7.png'),
                        backgroundColor: Colors.transparent,
                      ),
                      onPressed: () {
                        setState(() {
                          loadAddress = "assets/images/communityProf/7.png";
                          // widget.community.profilePicture = "6";
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditProfile(
                              // community: widget.community,
                            ),
                          ),
                        );
                      },
                    ),
                    FlatButton(
                      child: CircleAvatar(
                        radius: MediaQuery.of(context).size.width * 0.11,
                        backgroundImage: AssetImage('assets/images/communityProf/8.png'),
                        backgroundColor: Colors.transparent,
                      ),
                      onPressed: () {
                        setState(() {
                          loadAddress = "assets/images/communityProf/8.png";
                          // widget.community.profilePicture = "7";
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditProfile(
                              // community: widget.community,
                            ),
                          ),
                        );
                      },
                    ),
                    FlatButton(
                      child: CircleAvatar(
                        radius: MediaQuery.of(context).size.width * 0.11,
                        backgroundImage: AssetImage('assets/images/communityProf/9.png'),
                        backgroundColor: Colors.transparent,
                      ),
                      onPressed: () {
                        setState(() {
                          loadAddress = "assets/images/communityProf/9.png";
                          // widget.community.profilePicture = "8";
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditProfile(
                              // community: widget.community,
                            ),
                          ),
                        );
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
                        backgroundImage: AssetImage('assets/images/communityProf/10.png'),
                        backgroundColor: Colors.transparent,
                      ),
                      onPressed: () {
                        setState(() {
                          loadAddress = "assets/images/communityProf/10.png";
                          // widget.community.profilePicture = "9";
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditProfile(
                              // community: widget.community,
                            ),
                          ),
                        );
                      },
                    ),
                    FlatButton(
                      child: CircleAvatar(
                        radius: MediaQuery.of(context).size.width * 0.11,
                        backgroundImage: AssetImage('assets/images/communityProf/11.png'),
                        backgroundColor: Colors.transparent,
                      ),
                      onPressed: () {
                        setState(() {
                          loadAddress = "assets/images/communityProf/11.png";
                          // widget.community.profilePicture = "10";
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditProfile(
                              // community: widget.community,
                            ),
                          ),
                        );
                      },
                    ),
                    FlatButton(
                      child: CircleAvatar(
                        radius: MediaQuery.of(context).size.width * 0.11,
                        backgroundImage: AssetImage('assets/images/communityProf/12.png'),
                        backgroundColor: Colors.transparent,
                      ),
                      onPressed: () {
                        setState(() {
                          loadAddress = "assets/images/communityProf/12.png";
                          // widget.community.profilePicture = "11";
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditProfile(
                              // community: widget.community,
                            ),
                          ),
                        );
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
              ]),
            )),
      ),
    );
  }
}
