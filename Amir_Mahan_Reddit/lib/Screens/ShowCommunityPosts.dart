import 'package:Amir_Mahan_Reddit/BasicClasses/Post.dart';
import 'package:Amir_Mahan_Reddit/Screens/PostPage.dart';
import 'package:flutter/material.dart';

class ShowCommunityPosts extends StatefulWidget {
  const ShowCommunityPosts({Key key, this.posts}) : super(key: key);
  final List<Post> posts;
  @override
  State<ShowCommunityPosts> createState() => _ShowCommunityPostsState();
}

class _ShowCommunityPostsState extends State<ShowCommunityPosts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: Text(
          "Blueit",
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Gotham',
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.black87,
      ),
      body: Container(
        child: ListView.builder(
          itemCount: widget.posts.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (c, a1, a2) => PostPage(
                          post: widget.posts[index],
                          comments: widget.posts[index].getComments(),
                        ),
                        transitionsBuilder: (c, anim, a2, child) =>
                            FadeTransition(opacity: anim, child: child),
                        transitionDuration: Duration(milliseconds: 200),
                      ));
                },
                child: Material(
                  shadowColor: Color(0xFF1F2833),
                  color: Colors.transparent,
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  top: 10, left: 10, right: 10, bottom: 10),
                              child: CircleAvatar(
                                backgroundImage:
                                AssetImage('assets/images/Avatar2.png'),
                              ),
                            ),
                            Column(children: [
                              Container(
                                  child: Text(
                                      "u/" +
                                          widget.posts[index].Poster
                                              .getUsername(),
                                      style: TextStyle(
                                        fontFamily: 'Gotham',
                                        fontSize: 16,
                                        color: Colors.white,
                                      ))),
                              Container(
                                  child: Text(
                                      "r/" +
                                          widget.posts[index]
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
                              color: Color.fromARGB(189, 255, 255, 255),
                            ),
                          ),
                        ),
                      ],
                    ),
                    //caption:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      Flexible(
                          child: Container(
                              margin: EdgeInsets.only(
                                  top: 10, left: 10, right: 10, bottom: 5),
                              child: Text(widget.posts[index].getTitle(),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontFamily: 'Gotham',
                                    fontSize: 23,
                                    color: Colors.white,
                                  ))))
                    ]),
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      Flexible(
                          child: Container(
                              margin: EdgeInsets.only(
                                  top: 5, left: 10, right: 10, bottom: 10),
                              child: Text(widget.posts[index].getDescription(),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontFamily: 'Gotham',
                                    fontSize: 12,
                                    color: Color.fromARGB(177, 255, 255, 255),
                                  ))))
                    ]),
                    //like and dislike and comments and date
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    top: 10, left: 10, right: 10, bottom: 10),
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
                                    widget.posts[index]
                                        .getNumLikes()
                                        .toString(),
                                    style: TextStyle(
                                      fontFamily: 'Gotham',
                                      fontSize: 16,
                                      color: Color.fromARGB(205, 38, 97, 244),
                                    ))),
                            GestureDetector(
                              onTap: () {
                                // setState(() {
                                //   posts[index].addDislike(widget.user);
                                // });
                              },
                              child: Container(
                                margin: EdgeInsets.only(
                                    top: 10, left: 10, right: 0, bottom: 10),
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
                                color: Color.fromARGB(255, 31, 233, 255),
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
                            Container(color: Colors.transparent, width: 8)
                          ],
                        )
                      ],
                    ),
                    Container(
                      color: Colors.black45,
                      height: 1,
                    ),
                  ]),
                ));
          },
        ),
      ),
    );
  }
}