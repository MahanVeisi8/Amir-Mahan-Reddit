import 'package:Amir_Mahan_Reddit/BasicClasses/Community.dart';
import 'package:Amir_Mahan_Reddit/BasicClasses/Post.dart';

class User {
  String username;
  List<Post> savedPosts;
  List<Post> likedPosts;
  List<Post> dislikedPosts;
  List<Community> favoriteCommunities;
  String _email;
  String _password;
  int numPosts;
  String createdAt;
  bool isMale;
  User(String username, String email, String password, bool isMale) {
    this.username = username;
    this.savedPosts = <Post>[];
    this._email = email;
    this._password = password;
    this.numPosts = 0;
    this.createdAt = DateTime.now().toString();
    this.isMale = isMale;
    this.likedPosts = <Post>[];
    this.dislikedPosts = <Post>[];
    this.favoriteCommunities = <Community>[];
  }
  void addLike(Post likedPost) {
    this.likedPosts.add(likedPost);
  }

  void addDislike(Post dislikedPost) {
    this.dislikedPosts.add(dislikedPost);
  }

  void addSavedPost(Post savedPost) {
    this.savedPosts.add(savedPost);
  }

  void addFavoriteCommunity(Community community) {
    this.favoriteCommunities.add(community);
  }

  bool hasLiked(Post post) {
    return this.likedPosts.contains(post);
  }

  bool hasDisliked(Post post) {
    return this.dislikedPosts.contains(post);
  }

  bool hasSaved(Post post) {
    return this.savedPosts.contains(post);
  }

  bool hasSetFavoriteCommunity(Community community) {
    return this.favoriteCommunities.contains(community);
  }

  String getEmail() {
    return _email;
  }

  String getPassword() {
    return _password;
  }

  List<Post> getPosts() {
    return savedPosts;
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

  List<Post> getLikedPosts() {
    return likedPosts;
  }

  List<Post> getDislikedPosts() {
    return dislikedPosts;
  }

  List<Community> getFavoriteCommunities() {
    return favoriteCommunities;
  }
}
