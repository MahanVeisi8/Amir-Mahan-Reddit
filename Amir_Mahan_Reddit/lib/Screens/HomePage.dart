import 'package:flutter/material.dart';
import 'package:Amir_Mahan_Reddit/BasicClasses/Post.dart';
import 'package:Amir_Mahan_Reddit/BasicClasses/Users.dart';

import '../BasicClasses/Community.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key, this.user}) : super(key: key);
  final User user;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post> posts = <Post>[];
  void initializer() {
    Community com = new Community(new User("matin", "email", "password", true),
        "community1", "description");

    posts.add(new Post(
        new User("Amir", "email", "password", true),
        com,
        "hey motherfuckers! welcome to this app! this is the first caption!",
        "this is the long fucking caption that is supposed to be nothing just a long boring long bullshit long test"));

    posts.add(new Post(new User("Setareh", "email", "password", false), com,
        "Woooowww this is aaammaaaazing!", "Awwwlieeee"));

    posts.add(new Post(
        new User("Mahan", "email", "password", true),
        com,
        "goh nakhor kheili ham maskharas!",
        "Maskhare Tarin appi ke ye adam mitoone bezane ro zadi, copy ham kardi, khasteh shodi"));

    posts.add(new Post(
        new User("Safi", "email", "password", true),
        com,
        "sa laaaaaaaaaaaam!",
        "dadash description chie man balad nistam benevisam"));

    posts.add(new Post(
        new User("Setareh", "email", "password", false),
        com,
        "Woooowww this is aaammaaaazing! bache ha man nemidoonam chi begam vali kheili appetoon bahalee!! ashegheshammmmm ::::)))))",
        "boos booooooooosssososososfa;lf;jwf"));

    posts.add(new Post(new User("Maani", "email", "password", true), com,
        "Haj Rasoul Ali bood! kheili gashang bood!", "inam description"));
  }

  @override
  Widget build(BuildContext context) {
    initializer();
    return Scaffold(
        backgroundColor: Colors.black87,
        body: Container(
          child: ListView.builder(
            itemCount: posts.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                  onTap: () {
                    // print("tapped");
                  },
                  child: Material(
                    shadowColor: Colors.black,
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
                                  backgroundColor:
                                      Color.fromARGB(255, 21, 58, 205),
                                  // backgroundImage:
                                  // AssetImage("assets/images/profile.jpg"),
                                ),
                              ),
                              Column(children: [
                                Container(
                                    child: Text(
                                        "u/" +
                                            posts[index].Poster.getUsername(),
                                        style: TextStyle(
                                          fontFamily: 'Gotham',
                                          fontSize: 16,
                                          color: Colors.white,
                                        ))),
                                Container(
                                    child: Text(
                                        "r/" + posts[index].getCommunity().name,
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
                                    child: Text(posts[index].getTitle(),
                                        overflow: TextOverflow.ellipsis,
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
                                    child: Text(posts[index].getDescription(),
                                        overflow: TextOverflow.ellipsis,
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
                                      posts[index].getNumLikes().toString(),
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
        bottomNavigationBar: BottomAppBar(
          child: Container(
              color: Colors.black87,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.home_filled),
                    color: Color.fromARGB(236, 27, 241, 234),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.search),
                    color: Colors.white60,
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.add),
                    color: Colors.white60,
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.list_rounded),
                    color: Colors.white60,
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.settings),
                    color: Colors.white60,
                    onPressed: () {},
                  ),
                ],
              )),
        ));
  }
}
