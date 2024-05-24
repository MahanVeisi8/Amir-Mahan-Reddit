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
  int profileImage;

  Community(User admin, String name, String description) {
    this.admin = admin;
    this.members = <User>[];
    this.posts = <Post>[];
    this.numPosts = 0;
    this.numMembers = 0;
    this.name = name;
    this.description = description;
  }
  void setProfileImage(int image) {
    this.profileImage = image;
  }

  void setPosts(List<Post> posts) {
    this.posts = posts;
  }

  List<String> getMemberUsernames() {
    List<String> usernames = <String>[];
    for (User member in members) {
      usernames.add(member.username);
    }
    return usernames;
  }

  void setMembers(List<User> members) {
    this.members = members;
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
