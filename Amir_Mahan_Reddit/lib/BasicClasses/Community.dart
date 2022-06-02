import 'package:Amir_Mahan_Reddit/BasicClasses/Post.dart';
import 'package:Amir_Mahan_Reddit/BasicClasses/Users.dart';

class Community {
  User admin;
  List<User> members;
  List<Post> posts;
  int numPosts;
  int numMembers;
  String name;
  String description;
  String ProfileImage;

  Community(User admin, String name, String description) {
    this.admin = admin;
    this.members = <User>[];
    this.posts = <Post>[];
    this.numPosts = 0;
    this.numMembers = 0;
    this.name = name;
    this.description = description;
  }
  void setProfileImage(String image) {
    this.ProfileImage = image;
  }

  void addMember(User member) {
    this.members.add(member);
    this.numMembers++;
  }

  void addPost(Post post) {
    this.posts.add(post);
    this.numPosts++;
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
