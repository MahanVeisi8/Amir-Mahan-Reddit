import 'package:Amir_Mahan_Reddit/BasicClasses/Post.dart';
import 'package:Amir_Mahan_Reddit/BasicClasses/Users.dart';
import 'package:flutter/cupertino.dart';

class Comment {
  String text;
  User user;
  Post post;
  List<User> Likers;
  List<User> Dislikers;
  int numLikes;
  int numDislikes;

  Comment(String text, User user, Post post) {
    this.text = text;
    this.user = user;
    this.post = post;
    Likers = <User>[];
    Dislikers = <User>[];
    numLikes = 0;
    numDislikes = 0;
  }
  void like() {
    numLikes++;
    Likers.add(user);
  }

  void dislike() {
    numDislikes++;
    Dislikers.add(user);
  }

  String getUserName() {
    return user.username;
  }

  String getText() {
    return text;
  }
}
