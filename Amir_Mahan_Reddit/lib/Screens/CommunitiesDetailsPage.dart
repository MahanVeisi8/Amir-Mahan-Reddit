import 'package:Amir_Mahan_Reddit/Screens/HomePage.dart';
import 'package:Amir_Mahan_Reddit/Screens/ProfilePage.dart';
import 'package:Amir_Mahan_Reddit/Screens/ShowCommunityPosts.dart';
import 'package:Amir_Mahan_Reddit/Screens/ShowMembers.dart';
import 'package:flutter/material.dart';
import 'package:Amir_Mahan_Reddit/BasicClasses/Community.dart';

class CommunitiesDetailsPage extends StatefulWidget {
  const CommunitiesDetailsPage({Key key, this.community}) : super(key: key);
  final Community community;

  @override
  State<CommunitiesDetailsPage> createState() => _CommunitiesDetailsPageState();
}

class _CommunitiesDetailsPageState extends State<CommunitiesDetailsPage> {
  bool showPosts = true;
  void changeShowPosts() {
    setState(() {
      showPosts = !showPosts;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                          image: 'assets/images/AlliSherlock.jpg',
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
                      image: AssetImage('assets/images/AlliSherlock.jpg'),
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
                          image: 'assets/images/AlliSherlock.jpg',
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
                      backgroundImage:
                          AssetImage('assets/images/AlliSherlock.jpg'),
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
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(
                        color: Color.fromARGB(255, 10, 203, 174), width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(22)),
                  ),
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.8, top: 35),
                  child: GestureDetector(
                    child: Container(
                      child: Text("Follow",
                          style: TextStyle(
                              fontFamily: 'Gotham',
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                              color: Colors.white70)),
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
                                      onTap: () {},
                                      child: Container(
                                        margin: EdgeInsets.only(right: 12),
                                        child: Icon(
                                          Icons.bookmark_border_outlined,
                                          size: 30,
                                          color: Color.fromARGB(
                                              189, 255, 255, 255),
                                        ),
                                      ),
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
                            )
                          ],
                        );
                    })),
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
}
