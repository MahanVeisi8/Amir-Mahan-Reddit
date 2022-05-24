import 'package:Amir_Mahan_Reddit/BasicClasses/Users.dart';
import 'package:Amir_Mahan_Reddit/BasicClasses/Community.dart';

import 'Community.dart';

class Post {
  User Poster;
  Community community;
  bool isLiked;
  bool isDisLiked;
  bool isSaved;
  String createdAt;
  String description;
  String title;
  List<User> likes;
  List<User> dislikes;
  List<User> commenters;
  int numLikes;
  int numDislikes;
  int numComments;

  Post(User Poster, Community community, String title, String description) {
    this.Poster = Poster;
    this.community = community;
    this.createdAt = DateTime.now().toString();
    this.title = title;
    this.description = description;
    likes = <User>[];
    dislikes = <User>[];
    commenters = <User>[];
    numLikes = 0;
    numDislikes = 0;
    numComments = 0;
    //move all these fields to User
    isSaved = false;
    isLiked = false;
    isDisLiked = false;
  }

  void addLike(User liker) {
    likes.add(liker);
    numLikes++;
  }

  void addDisike(User disliker) {
    dislikes.add(disliker);
    numDislikes++;
  }

  bool getIsSaved() {
    return isSaved;
  }

  Community getCommunity() {
    return community;
  }

  User getPoster() {
    return Poster;
  }

  String getCreatedAt() {
    return createdAt;
  }

  String getTitle() {
    return title;
  }

  List<User> getLikes() {
    return likes;
  }

  List<User> getDislikes() {
    return dislikes;
  }

  List<User> getCommenters() {
    return commenters;
  }

  int getNumLikes() {
    return numLikes;
  }

  int getNumDislikes() {
    return numDislikes;
  }

  int getNumComments() {
    return numComments;
  }

  String getDescription() {
    return description;
  }

  void setIsSaved(bool x) {
    isSaved = x;
  }
}
