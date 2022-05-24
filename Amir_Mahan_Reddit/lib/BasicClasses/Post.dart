import 'package:Amir_Mahan_Reddit/BasicClasses/Users.dart';
import 'package:Amir_Mahan_Reddit/BasicClasses/Community.dart';

import 'Community.dart';

class Post {
  User Poster;
  Community community;
  String createdAt;
  String caption;
  List<User> likes;
  List<User> dislikes;
  List<User> commenters;
  int numLikes;
  int numDislikes;
  int numComments;

  Post(User Poster, Community community, String caption) {
    this.Poster = Poster;
    this.community = community;
    this.createdAt = DateTime.now().toString();
    this.caption = caption;
    likes = <User>[];
    dislikes = <User>[];
    commenters = <User>[];
    numLikes = 0;
    numDislikes = 0;
    numComments = 0;
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

  String getCaption() {
    return caption;
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
}
