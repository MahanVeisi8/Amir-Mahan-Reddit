import 'package:flutter/material.dart';
import 'package:Amir_Mahan_Reddit/BasicClasses/Post.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key key, this.post}) : super(key: key);
  final Post post;
  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Reddit",
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Gotham',
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromARGB(248, 44, 44, 44),
      ),
      backgroundColor: Colors.black87,
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        top: 10, left: 10, right: 10, bottom: 10),
                    child: CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 21, 58, 205),
                      // backgroundImage:
                      // AssetImage("assets/images/profile.jpg"),
                    ),
                  ),
                  Column(children: [
                    Container(
                        child: Text("u/" + widget.post.Poster.getUsername(),
                            style: TextStyle(
                              fontFamily: 'Gotham',
                              fontSize: 16,
                              color: Colors.white,
                            ))),
                    Container(
                        child: Text("r/" + widget.post.getCommunity().name,
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
                    child: Text(widget.post.getTitle(),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 300,
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
                    child: Text(widget.post.getDescription(),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 300,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: 'Gotham',
                          fontSize: 12,
                          color: Color.fromARGB(177, 255, 255, 255),
                        ))))
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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
                    child: Text(widget.post.getNumLikes().toString(),
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
                        color: Color.fromARGB(255, 10, 203, 174),
                      )),
                ),
                Container(color: Colors.transparent, width: 8)
              ],
            )
          ])
        ],
      ),
    );
  }
}
