import 'package:Amir_Mahan_Reddit/Screens/AddPost.dart';
import 'package:Amir_Mahan_Reddit/Screens/CommunitiesPage.dart';
import 'package:Amir_Mahan_Reddit/Screens/OnSidebar/ProfilePage.dart';
import 'package:Amir_Mahan_Reddit/Screens/PostPage.dart';
import 'package:flutter/material.dart';
import 'package:Amir_Mahan_Reddit/Screens/SettingPage.dart';

import 'package:Amir_Mahan_Reddit/Widgets/SideBarButtonWidget.dart';
import 'package:Amir_Mahan_Reddit/BasicClasses/Post.dart';
import 'package:Amir_Mahan_Reddit/BasicClasses/Users.dart';
import 'package:Amir_Mahan_Reddit/Screens/HomePage.dart';
import '../BasicClasses/Comment.dart';
import '../BasicClasses/Community.dart';

Route createRoute(Widget page, int index) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(2.0, 0.0);
      var end = Offset.fromDirection(2.0, 0.0);
      var curve = Curves.ease;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
