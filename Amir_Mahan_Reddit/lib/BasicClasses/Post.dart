import 'package:Amir_Mahan_Reddit/BasicClasses/Users.dart';
import 'package:Amir_Mahan_Reddit/BasicClasses/Community.dart';
import 'package:Amir_Mahan_Reddit/BasicClasses/Comment.dart';

import 'Community.dart';

class Post {
  User Poster;
  Community community;
  String createdAt;
  String description;
  String title;
  List<User> likes;
  List<User> dislikes;
  List<User> commenters;
  List<Comment> comments;
  int numLikes;
  int numDislikes;
  int numComments;
  bool isSaved = false;

  Post(User Poster, Community community, String title, String description) {
    this.Poster = Poster;
    this.community = community;
    this.createdAt = DateTime.now().toString();
    this.title = title;
    this.description = description;
    likes = <User>[];
    dislikes = <User>[];
    commenters = <User>[];
    comments = <Comment>[];
    numLikes = 0;
    numDislikes = 0;
    numComments = 0;
  }

  void addLike(User liker) {
    likes.add(liker);
    numLikes++;
  }

  void addComment(Comment comment) {
    comments.add(comment);
    numComments++;
  }

  void addDisike(User disliker) {
    dislikes.add(disliker);
    numLikes--;
  }
  void isSave(){
    this.isSaved = !isSaved;
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

  List<Comment> getComments() {
    return comments;
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
}
