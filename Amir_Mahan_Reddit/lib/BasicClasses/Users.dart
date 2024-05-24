import 'package:Amir_Mahan_Reddit/BasicClasses/Community.dart';
import 'package:Amir_Mahan_Reddit/BasicClasses/Post.dart';

class User {
  String username;
  String name;
  List<Post> savedPosts;
  List<Post> likedPosts;
  List<Post> dislikedPosts;
  List<Community> favoriteCommunities;
  String _email;
  String _password;
  int numPosts;
  String createdAt;
  bool isMale;
  String phoneNumber;
  String profilePicture;
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
    this.phoneNumber = "no Phone number saved";
    this.profilePicture = "4";
    this.name = "Not named";
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

  void setPhoneNumber(String phoneNumber) {
    this.phoneNumber = phoneNumber;
  }

  String getPhoneNumber() {
    return this.phoneNumber;
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

  String getProfilePicture() {
    return profilePicture;
  }

  String getName() {
    return name;
  }

  void setEmail(String email) {
    this._email = email;
  }

  void setPassword(String password) {
    this._password = password;
  }

  void setProfilePicture(String profilePicture) {
    this.profilePicture = profilePicture;
  }

  void setName(String name) {
    this.name = name;
  }

  void setUsername(String username) {
    this.username = username;
  }
}
