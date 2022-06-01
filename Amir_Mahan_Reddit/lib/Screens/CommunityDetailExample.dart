import 'package:Amir_Mahan_Reddit/Screens/AddPost.dart';
import 'package:Amir_Mahan_Reddit/Screens/CommunitiesPage.dart';
import 'package:Amir_Mahan_Reddit/Screens/OnSidebar/ProfilePage.dart';
import 'package:Amir_Mahan_Reddit/Screens/PostPage.dart';
import 'package:flutter/material.dart';
import 'package:Amir_Mahan_Reddit/Screens/SettingPage.dart';
import 'package:Amir_Mahan_Reddit/Widgets/sideBarDrawer.dart';
import 'package:Amir_Mahan_Reddit/Widgets/SideBarButtonWidget.dart';
import 'package:Amir_Mahan_Reddit/BasicClasses/Post.dart';
import 'package:Amir_Mahan_Reddit/BasicClasses/Users.dart';
import 'package:Amir_Mahan_Reddit/Widgets/AnimationRoute.dart';

import '../BasicClasses/Comment.dart';
import '../BasicClasses/Community.dart';

class CommunityDetailExample extends StatefulWidget {
  const CommunityDetailExample({Key key}) : super(key: key);

  @override
  State<CommunityDetailExample> createState() => _CommunityDetailExampleState();
}

class _CommunityDetailExampleState extends State<CommunityDetailExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1F2833),
      body: Container(
        child: Center(
          child: Text(
            "Community Detail Example",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          ),
        ),
      ),
    );
  }
}
