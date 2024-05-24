// import 'dart:html';

import 'dart:io';

import 'package:Amir_Mahan_Reddit/BasicClasses/Comment.dart';
import 'package:Amir_Mahan_Reddit/BasicClasses/Community.dart';
import 'package:Amir_Mahan_Reddit/BasicClasses/Post.dart';
import 'package:Amir_Mahan_Reddit/Screens/HomePage.dart';
import 'package:Amir_Mahan_Reddit/Screens/CommunitiesDetailsPage.dart';
<<<<<<< HEAD
import 'package:Amir_Mahan_Reddit/main.dart';
=======
import 'package:Amir_Mahan_Reddit/Screens/NewPostOrCommunity.dart';
>>>>>>> 682bb7f95939602df98310957a67d0a75a816a3d
import 'package:flutter/material.dart';
import '../BasicClasses/Users.dart';
import 'package:Amir_Mahan_Reddit/BasicClasses/Users.dart';

class CommunitiesPage extends StatefulWidget {
  const CommunitiesPage({Key key, this.username}) : super(key: key);

  final String username;
  @override
  State<CommunitiesPage> createState() => _CommunitiesPageState();
}

class _CommunitiesPageState extends State<CommunitiesPage> {
  List<Community> communities = new List<Community>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black87,
          title: Text(
            "Communities",
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Gotham',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Container(
          child: FutureBuilder(
            future: getCommunities(),
            builder: (context, snapshot) => ListView.builder(
                itemCount: communities.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (c, a1, a2) => CommunitiesDetailsPage(
                              community: communities[index],
                              username: widget.username,
                            ),
                            transitionsBuilder: (c, anim, a2, child) =>
                                FadeTransition(opacity: anim, child: child),
                            transitionDuration: Duration(milliseconds: 200),
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
                                              backgroundColor:
                                                  Colors.transparent,
                                              backgroundImage: AssetImage('assets/images/communityProf/1.png'),
                                            ),
                                          ),
                                          Container(
                                            child: Text(
                                                "r/" +
                                                    communities[index]
                                                        .getName(),
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'Gotham',
                                                  fontSize: 18,
                                                )),
                                          ),
                                        ],
                                      ),
                                      GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                            margin: EdgeInsets.only(right: 15),
                                            child: Icon(
                                              Icons.favorite_border_outlined,
                                              color: Colors.white70,
                                              size: 28,
                                            )),
                                      )
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
                                              communities[index]
                                                  .getDescription(),
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
                                  Container(height: 1, color: Colors.white30)
                                ],
                              ))));
                }),
          ),
        ),
        backgroundColor: Colors.black87,
        bottomNavigationBar: BottomAppBar(
          color: Colors.transparent,
          child: Container(
              child: Row(
=======
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black87,
        title: Text(
          "Communities",
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Gotham',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: communities.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (c, a1, a2) => CommunitiesDetailsPage(
                          community: communities[index],
                        ),
                        transitionsBuilder: (c, anim, a2, child) =>
                            FadeTransition(opacity: anim, child: child),
                        transitionDuration: Duration(milliseconds: 200),
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
                                          backgroundColor: Colors.blueAccent,
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
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                        margin: EdgeInsets.only(right: 15),
                                        child: Icon(
                                          Icons.favorite_border_outlined,
                                          color: Colors.white70,
                                          size: 28,
                                        )),
                                  )
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
      backgroundColor: Colors.black87,
      bottomNavigationBar: BottomAppBar(
        child: Container(
          color: Colors.black87,
          child: Row(
>>>>>>> 682bb7f95939602df98310957a67d0a75a816a3d
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.home_filled),
                color: Colors.white60,
                onPressed: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (c, a1, a2) => HomePage(
                        user: User(widget.username, "mahan@gmail.com",
                            "password", true),
                      ),
                      transitionsBuilder: (c, anim, a2, child) =>
                          FadeTransition(opacity: anim, child: child),
                      transitionDuration: Duration(milliseconds: 200),
                    ),
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.add),
                color: Colors.white60,
                onPressed: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (c, a1, a2) => NewPostOrCommunity(),
                      transitionsBuilder: (c, anim, a2, child) =>
                          FadeTransition(opacity: anim, child: child),
                      transitionDuration: Duration(milliseconds: 200),
                    ),
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.list_rounded),
                color: Color.fromARGB(236, 27, 241, 234),
                onPressed: () {},
              ),
<<<<<<< HEAD
=======
              // IconButton(
              //   icon: Icon(Icons.settings),
              //   color: Colors.white60,
              //   onPressed: () {
              //     Navigator.push(
              //       context,
              //       PageRouteBuilder(
              //         pageBuilder: (c, a1, a2) => Setting(),
              //         transitionsBuilder: (c, anim, a2, child) =>
              //             FadeTransition(opacity: anim, child: child),
              //         transitionDuration: Duration(milliseconds: 200),
              //       ),
              //     );
              //   },
              // ),
>>>>>>> 682bb7f95939602df98310957a67d0a75a816a3d
            ],
          ),
        ),
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
        for (int j = 0; j < stringedMembers.length; j++) {
          await Socket.connect(MyApp.ip, MyApp.port).then((ServerSocket) async {
            ServerSocket.write("getUserInfo1-" + stringedMembers[j] + ";");
            ServerSocket.flush();
            // print("here");
            var listen2 = ServerSocket.listen((data) {
              stringedMemberInfo = String.fromCharCodes(data);
              // print(stringedMemberInfo);
            });
            await listen2.asFuture<void>();
            splitedMemberInfo = stringedMemberInfo.split("-");
            isMale = splitedMemberInfo[9] == "true";
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
          print("stringedPosts[" + j.toString() + "]" + stringedPosts[j]);
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
}
