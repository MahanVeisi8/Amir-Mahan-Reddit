import 'package:Amir_Mahan_Reddit/Basic Classes/Post.dart';
import 'package:Amir_Mahan_Reddit/Basic Classes/User.dart';

class Community {
  User admin;
  List<User> members;
  List<Post> posts;
  int numPosts;
  int numMembers;
  String name;
  String description;

  Community(User admin, String name, String description) {
    this.admin = admin;
    this.members = <User>[];
    this.posts = <Post>[];
    this.numPosts = 0;
    this.numMembers = 0;
    this.name = name;
    this.description = description;
  }
  User getAdmin() {
    return admin;
  }

  List<User> getMembers() {
    return members;
  }

  List<Post> getPosts() {
    return posts;
  }

  int getNumPosts() {
    return numPosts;
  }

  int getNumMembers() {
    return numMembers;
  }

  String getName() {
    return name;
  }

  String getDescription() {
    return description;
  }
}
