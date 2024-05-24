import 'dart:io';

import 'package:Amir_Mahan_Reddit/Screens/CommunitiesPage.dart';
import 'package:Amir_Mahan_Reddit/Screens/OnSidebar/ProfilePage.dart';
import 'package:Amir_Mahan_Reddit/Screens/PostPage.dart';
import 'package:Amir_Mahan_Reddit/Splash/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:Amir_Mahan_Reddit/Screens/SettingPage.dart';
import 'package:Amir_Mahan_Reddit/Widgets/sideBarDrawer.dart';
import 'package:Amir_Mahan_Reddit/Widgets/SideBarButtonWidget.dart';
import 'package:Amir_Mahan_Reddit/BasicClasses/Post.dart';
import 'package:Amir_Mahan_Reddit/BasicClasses/Users.dart';
import 'package:Amir_Mahan_Reddit/Screens/loadPage.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:Amir_Mahan_Reddit/Screens/HomePage.dart';
import '../BasicClasses/Comment.dart';
import '../BasicClasses/Community.dart';
import '../main.dart';
import 'package:Amir_Mahan_Reddit/Screens/myNavigator.dart';

class AddPost2 extends StatefulWidget {
  const AddPost2({Key key, this.username, this.title, this.description})
      : super(key: key);

  final String username;
  final String title;
  final String description;
  @override
  State<AddPost2> createState() => _AddPost2State();
}

class _AddPost2State extends State<AddPost2> {
  List<Community> communities = <Community>[];
<<<<<<< HEAD
=======
  void initializer() {
    communities.add(new Community(
        new User("Setareh", "email", "password", false),
        "Logical_Circuits",
        "Here's a community for people who like to discuss logical circuits! Feel free to ask questions, and join the discussion!"));
    communities.add(new Community(new User("Amir", "email", "password", true),
        "Foosball_Kings", "Soccer is cool, but it's cooler on a table!"));
    communities.add(new Community(
        new User("Mahan", "email", "password", true),
        "Eminem_Fans_Society",
        "We're here to celebrate the fandom of our favourite singer! Join us!"));
    communities.add(new Community(
        new User("Amir", "email", "password", true),
        "AntiEminem_Fans_Society",
        "We're here to bullshitize all the acts of the previous community! We believe they know nothing about REAL Music!"));
    communities.add(new Community(
        new User("Matin", "email", "password", true),
        "IMDB_Eaters",
        "This is a community for Movies and Series Lovers! We love to discuss them!"));
    communities.add(new Community(
        new User("Amir", "email", "password", true),
        "Metalheads_Club",
        "Welcome to Metalheads Club! Don't forget Horns-ups!"));
    communities.add(new Community(new User("Sobhan", "email", "password", true),
        "Call_Of_Duty_Noobs", "If you're a noob like us, join us!"));
  }
>>>>>>> 682bb7f95939602df98310957a67d0a75a816a3d

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text(
          "Post to",
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Gotham',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
<<<<<<< HEAD
        child: FutureBuilder(
          future: getCommunities(),
          builder: (context, snapshot) => ListView.builder(
              itemCount: communities.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                    onTap: () async {
                      await addPostToDatabase(communities[index]);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => myNavigator(
                            username: widget.username,
                            content: "Posted successfully",
                          ),
                        ),
                      );
                    },
                    child: Container(
                        color: Colors.transparent,
                        child: Material(
                            color: Colors.transparent,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              right: 10,
                                              left: 10,
                                              top: 15,
                                              bottom: 10),
                                          child: CircleAvatar(
                                            // backgroundColor: Colors.blueAccent,
                                            backgroundImage: AssetImage(
                                                "assets/images/Avatar.png"),
                                          ),
                                        ),
                                        Container(
                                          child: Text(
                                              "r/" +
                                                  communities[index].getName(),
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'Gotham',
                                                fontSize: 18,
                                              )),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                          child: Container(
                                        margin: EdgeInsets.only(
                                            bottom: 15,
                                            left: 10,
                                            right: 10,
                                            top: 5),
                                        child: Text(
                                            communities[index].getDescription(),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                fontFamily: 'Gotham',
                                                fontSize: 12,
                                                color: Color.fromARGB(
                                                    177, 255, 255, 255))),
                                      )),
                                      Container(
                                          width: 1,
                                          height: 1,
                                          color: Colors.transparent)
                                    ]),
                                Container(height: 1, color: Colors.black54)
                              ],
                            ))));
              }),
        ),
=======
        child: ListView.builder(
            itemCount: communities.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                  onTap: () {},
                  child: Container(
                      color: Colors.transparent,
                      child: Material(
                          color: Colors.transparent,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            right: 10,
                                            left: 10,
                                            top: 15,
                                            bottom: 10),
                                        child: CircleAvatar(
                                          // backgroundColor: Colors.blueAccent,
                                          backgroundImage: AssetImage(
                                              "assets/images/Avatar.png"),
                                        ),
                                      ),
                                      Container(
                                        child: Text(
                                            "r/" + communities[index].getName(),
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'Gotham',
                                              fontSize: 18,
                                            )),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                        child: Container(
                                      margin: EdgeInsets.only(
                                          bottom: 15,
                                          left: 10,
                                          right: 10,
                                          top: 5),
                                      child: Text(
                                          communities[index].getDescription(),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              fontFamily: 'Gotham',
                                              fontSize: 12,
                                              color: Color.fromARGB(
                                                  177, 255, 255, 255))),
                                    )),
                                    Container(
                                        width: 1,
                                        height: 1,
                                        color: Colors.transparent)
                                  ]),
                              Container(height: 1, color: Colors.black54)
                            ],
                          ))));
            }),
>>>>>>> 682bb7f95939602df98310957a67d0a75a816a3d
      ),
    );
  }

  Future<void> getCommunities() async {
    List<Community> communityList = new List<Community>();
    String stringedData;
    List<String> eachCommunityLine;
    List<String> splitedLine;
    String admin;
    List<String> stringedMembers;
    String communityName;
    List<String> stringedPosts;
    String communityDescription;
    String profile;
    List<User> users;
    List<Post> posts; //
    List<String> splitedMemberInfo;
    String stringedMemberInfo;
    bool isMale;
    String stringedPostInfo;
    List<String> splitedPostInfo;
    String poster;
    String title;
    String description;
    String community;
    String numberOfLikes;
    List<String> commentsId;
    List<Comment> comments;
    String stringedCommentInfo;
    List<String> splitedCommentInfo;
    String commenter;
    String text;
    String numberOfLikesOfComment;
    User exampleUser;
    Community communityAlaki;
    Post PostAlaki;
    User useredPoster;
    Community communitiedcommunity;
    User tempUser;
    await Socket.connect(MyApp.ip, MyApp.port).then((ServerSocket) async {
      print("connect");
      ServerSocket.write("getCommunities;");
      ServerSocket.flush();
      print("sent");
      var listen1 = ServerSocket.listen((data) {
        print("received");
        stringedData = String.fromCharCodes(data);
      });
      await listen1.asFuture<void>();
      print(stringedData);

      eachCommunityLine = stringedData.split("\n");
      // });
      for (int i = 0; i < eachCommunityLine.length; i++) {
        if (eachCommunityLine[i] == "") {
          continue;
        }
        splitedLine = eachCommunityLine[i].split("-");
        communityName = splitedLine[0];
        admin = splitedLine[1];
        stringedMembers = splitedLine[2].split(",");
        stringedPosts = splitedLine[3].split(",");
        communityDescription = splitedLine[4];
        profile = splitedLine[5];
        users = new List<User>();
        posts = new List<Post>();

        // print("here");
        for (int j = 0; j < stringedMembers.length; j++) {
          await Socket.connect(MyApp.ip, MyApp.port).then((ServerSocket) async {
            // print("connect again2");
            ServerSocket.write("getUserInfo1-" + stringedMembers[j] + ";");
            ServerSocket.flush();
            // print("here");
            var listen2 = ServerSocket.listen((data) {
              stringedMemberInfo = String.fromCharCodes(data);
              // print(stringedMemberInfo);
            });
            await listen2.asFuture<void>();
            splitedMemberInfo = stringedMemberInfo.split("-");
            isMale = splitedMemberInfo[0] == "true";
            users.add(new User(splitedMemberInfo[0], splitedMemberInfo[2],
                splitedMemberInfo[1], isMale));
          });
        }

        // await Socket.connect(MyApp.ip, MyApp.port).then((ServerSocket) {
        //   print("connect");
        for (int j = 0; j < stringedPosts.length; j++) {
          if (stringedPosts[j] == "") {
            continue;
          }
          await Socket.connect(MyApp.ip, MyApp.port).then((ServerSocket) async {
            ServerSocket.write("getPostInfo-" + stringedPosts[j] + ";");
            ServerSocket.flush();
            var listen3 = ServerSocket.listen((data) {
              stringedPostInfo = String.fromCharCodes(data);
            });
            await listen3.asFuture<void>();
          });
          splitedPostInfo = stringedPostInfo.split("-");
          poster = splitedPostInfo[1];
          title = splitedPostInfo[2];
          description = splitedPostInfo[3];
          community = splitedPostInfo[4];
          print(community);
          numberOfLikes = splitedPostInfo[5];
          commentsId = splitedPostInfo[6].split(",");
          comments = new List<Comment>();
          for (int k = 0; k < commentsId.length; k++) {
            await Socket.connect(MyApp.ip, MyApp.port)
                .then((ServerSocket) async {
              ServerSocket.write("getCommentInfo-" + commentsId[k] + ";");
              ServerSocket.flush();
              var listen = ServerSocket.listen((data) {
                stringedCommentInfo = String.fromCharCodes(data);
              });
              await listen.asFuture<void>();
            });
            splitedCommentInfo = stringedCommentInfo
                .split("-"); //0-id, 1-poster, 2-text, 3-postId, 4-numberOfLikes
            commenter = splitedCommentInfo[1];
            text = splitedCommentInfo[2];
            numberOfLikesOfComment = splitedCommentInfo[3];
            exampleUser = new User(commenter, "email", "password", true);
            communityAlaki = new Community(exampleUser, "email", "password");
            PostAlaki =
                new Post(exampleUser, communityAlaki, "email", "password");
            comments.add(new Comment(
              text,
              exampleUser,
              PostAlaki,
            ));
            comments[comments.length - 1]
                .setLike(int.tryParse(numberOfLikesOfComment));
          }
          useredPoster = new User(poster, "email", "password", true);
          communitiedcommunity =
              new Community(useredPoster, community, "description");
          posts.add(
              new Post(useredPoster, communitiedcommunity, title, description));
          for (Comment comment in comments) {
            posts[posts.length - 1].addComment(comment);
          }
          posts[posts.length - 1].setLikes(int.tryParse(numberOfLikes));
        }
        // });
        tempUser = new User(admin, "email", "password", true);
        communityList
            .add(new Community(tempUser, communityName, communityDescription));
        communityList[communityList.length - 1].setMembers(users);
        communityList[communityList.length - 1].setPosts(posts);
        communityList[communityList.length - 1]
            .setProfileImage(int.tryParse(profile));
      }
      print("len : " + communityList.length.toString());
      communities = communityList;
    });
  }

  Future<void> addPostToDatabase(Community community) async {
    String stringedData;
    var listen;
    var listen1;
    var listen2;
    await Socket.connect(MyApp.ip, MyApp.port).then((serverSocket) async {
      print("connected");
      serverSocket.write(
          "AddPost-${widget.username}-${widget.title}-${widget.description}-${community.getName()};");
      serverSocket.flush();
      print("post order sent");
      listen = serverSocket.listen((data) {
        print("post order received");
        stringedData = String.fromCharCodes(data);
      });
    });
    await listen.asFuture<void>();
    print("post id : " + stringedData);
    String postId = stringedData;
    await Socket.connect(MyApp.ip, MyApp.port).then((serverSocket) async {
      print("connected");
      serverSocket
          .write("addPostToCommunity-${community.getName()}-${postId};");
      serverSocket.flush();
      listen1 = serverSocket.listen((data) {
        stringedData = String.fromCharCodes(data);
      });
    });
    await listen1.asFuture<void>();
    print(stringedData);
    await Socket.connect(MyApp.ip, MyApp.port).then((serverSocket) async {
      print("connected");
      serverSocket.write("addPostToUser-${widget.username}-${postId};"
          // + widget.username + "-" + postId + ";"
          );
      await serverSocket.flush();
      listen2 = serverSocket.listen((data) {
        stringedData = String.fromCharCodes(data);
      });
    });
    await listen2.asFuture<void>();
    print(stringedData);
    // });
  }
}
//  communities[index],
//                         widget.title,
//                         widget.description,
//                         widget.username,
