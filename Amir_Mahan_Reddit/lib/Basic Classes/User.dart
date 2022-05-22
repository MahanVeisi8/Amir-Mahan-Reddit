import 'package:Amir_Mahan_Reddit/Basic Classes/Post.dart';

class User {
  String username;
  List<Post> posts;
  String _email;
  String _password;
  int numPosts;
  String createdAt;

  User(String username, String email, String password) {
    this.username = username;
    this.posts = <Post>[];
    this._email = email;
    this._password = password;
    this.numPosts = 0;
    this.createdAt = DateTime.now().toString();
  }
  String getEmail() {
    return _email;
  }

  String getPassword() {
    return _password;
  }

  List<Post> getPosts() {
    return posts;
  }

  int getNumPosts() {
    return numPosts;
  }

  String getCreatedAt() {
    return createdAt;
  }

  String getUsername() {
    return username;
  }
}
