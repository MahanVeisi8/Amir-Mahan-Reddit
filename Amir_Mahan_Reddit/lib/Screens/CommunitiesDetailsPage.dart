import 'dart:io';

import 'package:Amir_Mahan_Reddit/Screens/HomePage.dart';
import 'package:Amir_Mahan_Reddit/Screens/ProfilePage.dart';
import 'package:Amir_Mahan_Reddit/Screens/ShowCommunityPosts.dart';
import 'package:Amir_Mahan_Reddit/Screens/ShowMembers.dart';
import 'package:Amir_Mahan_Reddit/Widgets/AnimationRoute.dart';
import 'package:Amir_Mahan_Reddit/main.dart';
import 'package:flutter/material.dart';
import 'package:Amir_Mahan_Reddit/BasicClasses/Community.dart';
import 'package:Amir_Mahan_Reddit/Screens/CommunitiesPage.dart';
import '../BasicClasses/Users.dart';
import 'AddCommunity.dart';

class CommunitiesDetailsPage extends StatefulWidget {
  const CommunitiesDetailsPage({Key key, this.community, this.username})
      : super(key: key);
  final Community community;
  final String username;
  @override
  State<CommunitiesDetailsPage> createState() => _CommunitiesDetailsPageState();
}

class _CommunitiesDetailsPageState extends State<CommunitiesDetailsPage> {
  bool isFollowed = true;
  bool showPosts = true;
  bool first = true;
  void changeShowPosts() {
    setState(() {
      showPosts = !showPosts;
    });
  }

  void changeIsFollowed() {
    setState(() {
      isFollowed = !isFollowed;
    });
  }

  void setIsFollowed() {
    if (first) {
      first = false;
      if (widget.community.getMemberUsernames().contains(widget.username)) {
        setState(() {
          isFollowed = true;
        });
      } else {
        setState(() {
          isFollowed = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    setIsFollowed();
    return Scaffold(
        backgroundColor: Colors.black87,
        body: Column(
          children: [
            Stack(children: [
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (c, a1, a2) => ProfilePage(
                          image: 'assets/images/communityProf/1.png',
                        ),
                        transitionsBuilder: (c, anim, a2, child) =>
                            FadeTransition(opacity: anim, child: child),
                        transitionDuration: Duration(milliseconds: 200),
                      ),
                    );
                  },
                  child: (Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width * 0.5,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage('assets/images/communityProf/1.png'),
                      fit: BoxFit.cover,
                    )),
                  ))),
              GestureDetector(
                child: Container(
                  margin: EdgeInsets.only(top: 35, left: 20),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white70,
                    size: 28,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width * 0.38),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black45,
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (c, a1, a2) => ProfilePage(
                          image: 'assets/images/communityProf/1.png',
                        ),
                        transitionsBuilder: (c, anim, a2, child) =>
                            FadeTransition(opacity: anim, child: child),
                        transitionDuration: Duration(milliseconds: 200),
                      ),
                    );
                  },
                  child: (Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.width * 0.4, left: 22),
                    child: CircleAvatar(
                      radius: MediaQuery.of(context).size.width * 0.09,
                      backgroundColor: Colors.transparent,
                      backgroundImage:
                          AssetImage('assets/images/communityProf/1.png'),
                    ),
                  ))),
              Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.width * 0.423,
                      left: MediaQuery.of(context).size.width * 0.18 + 30),
                  child: Text(
                    "r/" + widget.community.getName(),
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: 'Gotham',
                      fontWeight: FontWeight.w700,
                      fontSize:
                          (widget.community.getName().length > 20) ? 24 : 28,
                      color: Colors.white,
                    ),
                  )),
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width * 0.525,
                    left: MediaQuery.of(context).size.width * 0.18 + 30),
                child: Text(
                  "| Created by u/" + widget.community.getAdmin().getUsername(),
                  style: TextStyle(
                      fontFamily: 'Gotham',
                      fontSize: 16,
                      color: Colors.white70),
                ),
              ),
              Container(
                  width: MediaQuery.of(context).size.width * 0.28,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(
                        color: Color.fromARGB(255, 10, 203, 174), width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.7, top: 35),
                  child: GestureDetector(
                    onTap: () async {
                      setState(() {
                        isFollowed = !isFollowed;
                      });
                      await followOrUnfollow(isFollowed);
                      Navigator.of(context).push(createRoute(
                          CommunitiesPage(
                            username: widget.username,
                          ),
                          1));
                    },

                    child: Container(
                      child: Text(isFollowed ? "unfollow" : "follow",
                          style: TextStyle(
                              fontFamily: 'Gotham',
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                              color: Color.fromARGB(236, 27, 241, 234))),
                      margin: EdgeInsets.only(
                          left: 10, right: 10, top: 10, bottom: 10),
                    ),
                  ))
            ]),
            Flexible(
              child: Container(
                margin: EdgeInsets.only(
                  top: 15,
                  left: 20,
                  right: 20,
                ),
                child: Text(
                  widget.community.getDescription(),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 300,
                  style: TextStyle(
                    fontFamily: 'Gotham',
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 15),
              height: 1,
              width: MediaQuery.of(context).size.width * 0.91,
              color: Colors.white24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    if (!showPosts) {
                      changeShowPosts();
                    }
                  },
                  child: Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Text(
                        "Posts      ",
                        style: TextStyle(
                          fontFamily: 'Gotham',
                          fontSize: 16,
                          color: (showPosts)
                              ? Color.fromARGB(255, 26, 198, 255)
                              : Colors.white70,
                        ),
                      )),
                ),
                GestureDetector(
                    onTap: () {
                      if (showPosts) {
                        changeShowPosts();
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Text(
                        "      Members",
                        style: TextStyle(
                          fontFamily: 'Gotham',
                          fontSize: 16,
                          color: (showPosts)
                              ? Colors.white70
                              : Color.fromARGB(255, 26, 198, 255),
                        ),
                      ),
                    ))
              ],
            ),
            Container(
                height: 1,
                width: 1,
                color: Colors.transparent,
                margin: EdgeInsets.only(top: 10)),
            Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: AlwaysScrollableScrollPhysics(),
                    itemCount: (showPosts)
                        ? widget.community.getPosts().length
                        : widget.community.getMembers().length,
                    itemBuilder: (context, index) {
                      if (showPosts &&
                          widget.community.getPosts().length == 0) {
                        return Center(
                          child: Container(
                              margin: EdgeInsets.only(top: 100),
                              child: Text("There are no posts yet!",
                                  style: TextStyle(
                                      fontFamily: 'Gotham',
                                      fontSize: 16,
                                      color: Colors.white70))),
                        );
                      }

                      if (showPosts && index < 5)
                        return GestureDetector(
                          onTap: () {},
                          child: Material(
                              color: Colors.transparent,
                              child: Column(children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: 10,
                                              left: 10,
                                              right: 10,
                                              bottom: 10),
                                          child: CircleAvatar(
                                            backgroundImage: AssetImage(
                                                'assets/images/Avatar2.png'),
                                          ),
                                        ),
                                        Column(children: [
                                          Container(
                                              child: Text(
                                                  "u/" +
                                                      widget.community
                                                          .getPosts()[index]
                                                          .Poster
                                                          .getUsername(),
                                                  style: TextStyle(
                                                    fontFamily: 'Gotham',
                                                    fontSize: 16,
                                                    color: Colors.white,
                                                  ))),
                                          Container(
                                              child: Text(
                                                  "r/" +
                                                      widget.community
                                                          .getPosts()[index]
                                                          .getCommunity()
                                                          .name,
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                    fontFamily: 'Gotham',
                                                    fontSize: 13,
                                                    color: Colors.white,
                                                  ))),
                                        ]),
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          widget.community
                                              .getPosts()[index]
                                              .isSaved =
                                          !widget.community
                                              .getPosts()[index]
                                              .isSaved;
                                        });
                                      },
                                      child: Container(
                                          margin: EdgeInsets.only(right: 12),
                                          child: (widget.community
                                              .getPosts()[index]
                                              .isSaved)
                                              ? Icon(Icons.bookmark,
                                              size: 30,
                                              color: Color.fromARGB(
                                                  189, 255, 255, 255))
                                              : Icon(
                                            Icons
                                                .bookmark_border_outlined,
                                            size: 30,
                                            color: Color.fromARGB(
                                                189, 255, 255, 255),
                                          )),
                                    ),
                                  ],
                                ),
                                //caption:
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Flexible(
                                          child: Container(
                                              margin: EdgeInsets.only(
                                                  top: 10,
                                                  left: 10,
                                                  right: 10,
                                                  bottom: 5),
                                              child: Text(
                                                  widget.community
                                                      .getPosts()[index]
                                                      .getTitle(),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 3,
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                    fontFamily: 'Gotham',
                                                    fontSize: 23,
                                                    color: Colors.white,
                                                  ))))
                                    ]),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Flexible(
                                          child: Container(
                                              margin: EdgeInsets.only(
                                                  top: 5,
                                                  left: 10,
                                                  right: 10,
                                                  bottom: 10),
                                              child: Text(
                                                  widget.community
                                                      .getPosts()[index]
                                                      .getDescription(),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 3,
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                    fontFamily: 'Gotham',
                                                    fontSize: 12,
                                                    color: Color.fromARGB(
                                                        177, 255, 255, 255),
                                                  ))))
                                    ]),
                                //like and dislike and comments and date
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            // setState(() {
                                            //   posts[index].addLike(widget.user);
                                            // });
                                          },
                                          child: Container(
                                            margin: EdgeInsets.only(
                                                top: 10,
                                                left: 10,
                                                right: 10,
                                                bottom: 10),
                                            child: Icon(
                                              Icons.thumb_up_alt_outlined,
                                              color: Colors.white,
                                              size: 20,
                                            ),
                                          ),
                                        ),
                                        Container(
                                            color: Colors.transparent,
                                            child: Text(
                                                widget.community
                                                    .getPosts()[index]
                                                    .getNumLikes()
                                                    .toString(),
                                                style: TextStyle(
                                                  fontFamily: 'Gotham',
                                                  fontSize: 16,
                                                  color: Color.fromARGB(
                                                      205, 38, 97, 244),
                                                ))),
                                        GestureDetector(
                                          onTap: () {
                                            // setState(() {
                                            //   posts[index].addDislike(widget.user);
                                            // });
                                          },
                                          child: Container(
                                            margin: EdgeInsets.only(
                                                top: 10,
                                                left: 10,
                                                right: 0,
                                                bottom: 10),
                                            child: Icon(
                                              Icons.thumb_down_alt_outlined,
                                              color: Colors.white,
                                              size: 20,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        // setState(() {
                                        //   posts[index].addLike(widget.user);
                                        // });
                                      },
                                      child: Container(
                                        child: Text(
                                          "Comments",
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 31, 233, 255),
                                            fontSize: 16,
                                            fontFamily: 'Gotham',
                                          ),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          //passed time:
                                          child: Text("1Y,3M,17D",
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
                                                fontFamily: 'Gotham',
                                                fontSize: 12,
                                                color: Colors.white70,
                                              )),
                                        ),
                                        Container(
                                            color: Colors.transparent, width: 8)
                                      ],
                                    )
                                  ],
                                ),
                                Container(
                                  color: Colors.black45,
                                  height: 1,
                                ),
                              ])),
                        );
                      if (showPosts && index == 5)
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder: (c, a1, a2) =>
                                        ShowCommunityPosts(
                                      posts: widget.community.getPosts(),
                                    ),
                                    transitionsBuilder: (c, anim, a2, child) =>
                                        FadeTransition(
                                            opacity: anim, child: child),
                                    transitionDuration:
                                        Duration(milliseconds: 200),
                                  ),
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.only(
                                  top: 15,
                                  left: 10,
                                ),
                                height: 38,
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  "+ Show more",
                                  style: TextStyle(
                                      fontFamily: 'Gotham',
                                      fontSize: 18,
                                      color: Color.fromARGB(255, 26, 198, 255)),
                                ),
                              ),
                            ),
                            Container(
                              color: Colors.black45,
                              height: 1,
                            ),
                          ],
                        );
                      if (!showPosts && index < 5)
                        return Column(children: [
                          Row(
                            children: [
                              Container(
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundImage:
                                      AssetImage('assets/images/Avatar2.png'),
                                ),
                                margin: EdgeInsets.only(
                                  top: 10,
                                  left: 10,
                                  right: 10,
                                  bottom: 10,
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.only(left: 10),
                                  child: Text(
                                    "u/" +
                                        widget.community
                                            .getMembers()[index]
                                            .getUsername(),
                                    style: TextStyle(
                                      fontFamily: 'Gotham',
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  )),
                            ],
                          ),
                          Container(
                            color: Colors.black45,
                            height: 1,
                            width: MediaQuery.of(context).size.width * 0.9,
                          )
                        ]);
                      if (!showPosts && index == 5)
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder: (c, a1, a2) => ShowMembers(
                                      members: widget.community.getMembers(),
                                    ),
                                    transitionsBuilder: (c, anim, a2, child) =>
                                        FadeTransition(
                                            opacity: anim, child: child),
                                    transitionDuration:
                                        Duration(milliseconds: 200),
                                  ),
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.only(
                                  top: 15,
                                  left: 10,
                                ),
                                height: 38,
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  "+ Show more",
                                  style: TextStyle(
                                      fontFamily: 'Gotham',
                                      fontSize: 18,
                                      color: Color.fromARGB(255, 26, 198, 255)),
                                ),
                              ),
                            ),
                            Container(
                              color: Colors.black45,
                              height: 1,
                              width: MediaQuery.of(context).size.width * 0.9,
                            ),
                          ],
                        );
                    })),
            Container(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (c, a1, a2) => AddCommunity(),
                        transitionsBuilder: (c, anim, a2, child) =>
                            FadeTransition(opacity: anim, child: child),
                        transitionDuration: Duration(milliseconds: 200),
                      ),
                    );
                  },
                  child: Text(
                    "  Edit Community",
                    style: TextStyle(
                        fontFamily: 'Gotham',
                        fontSize: 20,
                        color: Color.fromARGB(255, 26, 198, 255)),
                  ),
                ),
                Container(height: 1, width: 1)
              ],
            ),
            Container(
              height: 20,
            ),
            Container(
              color: Colors.black45,
              height: 1,
            ),
            Container(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    // Deleting Implemantation
                  },
                  child: Text(
                    "  Delete Community",
                    style: TextStyle(
                        fontFamily: 'Gotham',
                        fontSize: 20,
                        color: Color.fromARGB(255, 255, 26, 64)),
                  ),
                ),
                Container(height: 1, width: 1)
              ],
            ),
            Container(
              height: 20,
            ),
            Container(
              color: Colors.black45,
              height: 1,
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.transparent,
          child: Container(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                IconButton(
                  icon: Icon(Icons.home_filled),
                  color: Colors.white60,
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (c, a1, a2) => HomePage(),
                        transitionsBuilder: (c, anim, a2, child) =>
                            FadeTransition(opacity: anim, child: child),
                        transitionDuration: Duration(milliseconds: 200),
                      ),
                    );
                  },
                ),
                // IconButton(
                //   icon: Icon(Icons.search),
                //   color: Colors.white60,
                //   onPressed: () {},
                // ),
                IconButton(
                  icon: Icon(Icons.add),
                  color: Colors.white60,
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.list_rounded),
                  color: Color.fromARGB(236, 27, 241, 234),
                  onPressed: () {},
                ),
              ])),
        ));
  }

  Future<void> followOrUnfollow(bool hasFollowed) async {
    var listen1;
    if (hasFollowed) {
      await Socket.connect(MyApp.ip, MyApp.port).then((ServerSocket) async {
        ServerSocket.write(
          "Follow-${widget.community.name}-${widget.username};",
        );
        await ServerSocket.flush();
        print("sent");
        listen1 = ServerSocket.listen((data) {
          print(String.fromCharCodes(data));
        });
      });
      await listen1.asFuture<void>();
    } else {
      await Socket.connect(MyApp.ip, MyApp.port).then((ServerSocket) async {
        ServerSocket.write(
          "Unfollow-${widget.community.name}-${widget.username};",
        );
        await ServerSocket.flush();
        print("sent");
        listen1 = ServerSocket.listen((data) {
          print(String.fromCharCodes(data));
        });
      });
      await listen1.asFuture<void>();
    }
  }
}
