import 'dart:io';

import 'package:Amir_Mahan_Reddit/Screens/AddPost.dart';
import 'package:Amir_Mahan_Reddit/Screens/CommunitiesPage.dart';
import 'package:Amir_Mahan_Reddit/Screens/NewPostOrCommunity.dart';
import 'package:Amir_Mahan_Reddit/Screens/OnSidebar/ProfilePage.dart';
import 'package:Amir_Mahan_Reddit/Screens/PostPage.dart';
import 'package:Amir_Mahan_Reddit/Screens/ProfilePage.dart';
import 'package:Amir_Mahan_Reddit/main.dart';
import 'package:flutter/material.dart';
import 'package:Amir_Mahan_Reddit/Screens/SettingPage.dart';
import 'package:Amir_Mahan_Reddit/Widgets/sideBarDrawer.dart';
import 'package:Amir_Mahan_Reddit/Widgets/SideBarButtonWidget.dart';
import 'package:Amir_Mahan_Reddit/BasicClasses/Post.dart';
import 'package:Amir_Mahan_Reddit/BasicClasses/Users.dart';
import 'package:Amir_Mahan_Reddit/Widgets/AnimationRoute.dart';

import '../BasicClasses/Comment.dart';
import '../BasicClasses/Community.dart';
import 'package:Amir_Mahan_Reddit/Screens/NewPostOrCommunity.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key, this.user}) : super(key: key);
  final User user;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post> posts = <Post>[];
  bool isUsed = false;
  Future<void> getPosts(String username) async {
    if (!isUsed) {
      isUsed = !isUsed;
      String stringedData;
      List<String> eachCommunityLine;
      List<String> splitedLine;
      List<String> stringedPostsId = new List<String>();
      List<String> splitedPosts;
      String communityMembers;
      String stringedPostInfo;
      List<String> splitedPostInfo;
      var listen2;
      var listen3;

      await Socket.connect(MyApp.ip, MyApp.port).then((ServerSocket) async {
        print("connected");
        ServerSocket.write("getCommunities;");
        ServerSocket.flush();
        var listen1 = ServerSocket.listen((data) {
          print("received");
          stringedData = String.fromCharCodes(data);
        });
        await listen1.asFuture<void>();
        print(stringedData);
        // print("dataaaa : " + stringedData);
        eachCommunityLine = stringedData.split("\n");

        for (int i = 0; i < eachCommunityLine.length; i++) {
          if (eachCommunityLine[i] == "") {
            continue;
          }
          splitedLine = eachCommunityLine[i].split("-");
          communityMembers = splitedLine[2];
          if (communityMembers.contains(username)) {
            splitedPosts = splitedLine[3].split(",");
            for (String str in splitedPosts) {
              stringedPostsId.add(str);
            }
          }
        }

        if (stringedPostsId.length != 0) {
          for (int j = 0; j < stringedPostsId.length; j++) {
            if (stringedPostsId[j] == "") {
              continue;
            }
            await Socket.connect(MyApp.ip, MyApp.port)
                .then((ServerSocket) async {
              print("stringedPostsId[" +
                  j.toString() +
                  "] : " +
                  stringedPostsId[j]);
              ServerSocket.write("getPostInfo-" + stringedPostsId[j] + ";");
              ServerSocket.flush();
              listen2 = ServerSocket.listen((data) {
                stringedPostInfo = String.fromCharCodes(data);
              });
              await listen2.asFuture<void>();
            });
              splitedPostInfo = stringedPostInfo.split("-");
              print("splitedPostInfo[2] : " + splitedPostInfo[2]);
              print("splitedPostInfo[3] : " + splitedPostInfo[3]);

              User tempUser =
                  new User(splitedPostInfo[1], "email", "password", true);
              Community tempCommunity =
                  new Community(tempUser, splitedPostInfo[4], "description");
              posts.add(new Post(tempUser, tempCommunity, splitedPostInfo[2],
                  splitedPostInfo[3]));

          }
        }
        await Socket.connect(MyApp.ip, MyApp.port).then((ServerSocket) async {
          print("connected");
         ServerSocket.write("getUserInfo1-" + username + ";");
          ServerSocket.flush();
          listen3 = ServerSocket.listen((data) {
            stringedData = String.fromCharCodes(data);
            splitedLine = stringedData.split("-");
          });
          await listen3.asFuture<void>();
        });
          setState(()  {
            widget.user.setUsername(splitedLine[0]);
            widget.user.setPassword(splitedLine[1]);
            widget.user.setEmail(splitedLine[2]);
            widget.user.setProfilePicture(splitedLine[5]);
            print("splitedLine[7] : " + splitedLine[7]);
            widget.user.setName(splitedLine[7]);
            widget.user.setPhoneNumber(splitedLine[8]);
            print("widget.user.getName() : " + widget.user.getName());
            print(
                "widget.user.getPhoneNumber()" + widget.user.getPhoneNumber());
            print("widget.user.getUsername()" + widget.user.getUsername());
            print("widget.user.getPassword()" + widget.user.getPassword());
            print("widget.user.getEmail()" + widget.user.getEmail());
            print("widget.user.getProfilePicture()" +
                widget.user.getProfilePicture());
          });
        for (Post post in posts) {
          //add set profile to the posters
          setState(() async {//
            await Socket.connect(MyApp.ip, MyApp.port).then((ServerSocket) async {
              print("connected");
            ServerSocket.write(
                "getUserInfo1-" + post.getPoster().getUsername() + ";");
            ServerSocket.flush();
            listen3 = ServerSocket.listen((data) {
              stringedData = String.fromCharCodes(data);
              splitedLine = stringedData.split("-");
            });
            await listen3.asFuture<void>();
            });
            post.getPoster().setUsername(splitedLine[0]);
            post.getPoster().setPassword(splitedLine[1]);
            post.getPoster().setEmail(splitedLine[2]);
            post.getPoster().setProfilePicture(splitedLine[5]);
            print("splitedLine[7] : " + splitedLine[7]);
            post.getPoster().setName(splitedLine[7]);
            post.getPoster().setPhoneNumber(splitedLine[8]);
            print("post.getPoster().getName() : " + post.getPoster().getName());
            print("post.getPoster().getPhoneNumber()" +
                post.getPoster().getPhoneNumber());
            print("post.getPoster().getUsername()" +
                post.getPoster().getUsername());
            print("post.getPoster().getPassword()" +
                post.getPoster().getPassword());
            print("post.getPoster().getEmail()" + post.getPoster().getEmail());
            print("post.getPoster().getProfilePicture()" +
                post.getPoster().getProfilePicture());
          });//
        }
      });
    }
  }

  String getProfilePicture(String profilePage) {
    String raw1 = "assets/images/";
    String raw2 = ".png";
    switch (profilePage) {
      case "0":
        {
          return raw1 + "morty.png";
          break;
        }
      case "1":
        {
          return raw1 + "jerry.png";
        }

      case "2":
        return raw1 + "Jessica.png";
      case "3":
        return raw1 + "Beth.png";
      case "4":
        return raw1 + "summer.png";
      case "5":
        return raw1 + "Doofus_Rick.png";
      case "6":
        return raw1 + "Lawnmower_dog.png";
      case "7":
        return raw1 + "Avatar2.png";
      case "8":
        return raw1 + "Avatar.png";
      case "9":
        return raw1 + "Squanchy.png";
      case "10":
        return raw1 + "Rick.png";
      case "11":
        return raw1 + "Evil_Morty.png";
      default:
        return raw1 + "Avatar" + raw2;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FutureBuilder(
          future: getPosts(widget.user.username),
          builder: (context, snapshot) => ListView.builder(
            itemCount: posts.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (c, a1, a2) => PostPage(
                            post: posts[index],
                            comments: posts[index].getComments(),
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
                                  backgroundColor: Colors.transparent,
                                  backgroundImage:
                                      AssetImage(
                                        getProfilePicture(posts[index]
                                            .getPoster()
                                            .getProfilePicture()),
                                      ),
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
                            onTap: () {
                              setState(() {
                                posts[index].isSaved = !posts[index].isSaved;
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 12),
                              child: Icon(
                                posts[index].isSaved
                                    ? Icons.bookmark
                                    : Icons.bookmark_border_rounded,
                                size: 30,
                                color: posts[index].isSaved
                                    ? Color(0xFF66FCF1)
                                    : Color(0xFF66FCF1),
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
                                  setState(() {
                                    posts[index].addLike(new User(
                                        "Mahan", "email", "password", true));
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.only(
                                      top: 10, left: 10, right: 10, bottom: 10),
                                  child: Icon(
                                    Icons.thumb_up_alt_outlined,
                                    color: Color(0xFF66FCF1),
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
                                        color: Colors.white,
                                      ))),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    posts[index].addDisike(new User(
                                        "amir", "email", "password", true));
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.only(
                                      top: 10, left: 10, right: 0, bottom: 10),
                                  child: Icon(
                                    Icons.thumb_down_alt_outlined,
                                    color: Color(0xFF66FCF1),
                                    size: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                posts[index].addDisike(new User(
                                    "Mahan", "email", "password", true));
                              });
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
                        color: Colors.white30,
                        height: 1.5,
                      ),
                    ]),
                  ));
            },
          ),
        ),
      ),
      backgroundColor: Colors.black87,
      drawer: NavigationDrawerWidget(user: widget.user),
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.search, color: Colors.white),
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: SearchBox(),
                );
              })
        ],
        title: Text(
          "Blueit",
          style: TextStyle(
              color: Color(0xFF66FCF1),
              fontFamily: 'Gotham',
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.black87,
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black87,
        child: Container(
          // color: Colors.black87,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.home_filled),
                color: Color.fromARGB(236, 27, 241, 234),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.add),
                color: Colors.white60,
                onPressed: () {
                  Navigator.of(context).push(createRoute(
                      NewPostOrCommunity(
                        username: widget.user.username,
                      ),
                      0));
                },
              ),
              IconButton(
                icon: Icon(Icons.list_rounded),
                color: Colors.white60,
                onPressed: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (c, a1, a2) => CommunitiesPage(
                        username: widget.user.username,
                      ),
                      transitionsBuilder: (c, anim, a2, child) =>
                          FadeTransition(opacity: anim, child: child),
                      transitionDuration: Duration(milliseconds: 200),
                    ),
                  );
                },
              ),
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
            ],
          ),
        ),
      ),
    );
  }
}

class SearchBox extends SearchDelegate {
  List<Post> posts = <Post>[];
  void initializer() {
    Community com = new Community(new User("matin", "email", "password", true),
        "community1", "description");

    posts.add(new Post(
        new User("Amir", "email", "password", true),
        com,
        "hey motherfuckers! welcome to this app! this is the first caption!",
        "this is the long fucking caption that is supposed to be nothing just a long boring long bullshit long test"));

    posts[0].addComment(new Comment("Yes And I Loooove it!!! U rock brooo",
        new User("matin", "email", "password", true), posts[0]));

    posts[0].addComment(new Comment("Amazing!!",
        new User("Setareh", "email", "password", false), posts[0]));

    posts[0].addComment(new Comment(
        "Ridi.", new User("mahan", "email", "password", true), posts[0]));
    posts[0].addComment(new Comment("Namoosan Pashamam",
        new User("Sobhan", "email", "password", true), posts[0]));

    posts[0].addComment(new Comment(
        "Dadash khode Reddit jeloye appetoon long mindaze bemowlaaa",
        new User("Safi", "email", "password", false),
        posts[0]));

    posts[0].addComment(new Comment(
        "Hamash ro khodam zadam. Feshar Bokhor Amir",
        new User("mahan", "email", "password", true),
        posts[0]));

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
<<<<<<< HEAD
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          if (query.isEmpty) {
            close(context, null);
          } else {
            query = "";
          }
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Post> filteredPosts = posts.where((post) {
      final titleResult = post.title.toLowerCase();
      final descriptionResult = post.description.toLowerCase();
      final input = query.toLowerCase();
      return titleResult.contains(input) || descriptionResult.contains(input);
    }).toList();
    initializer();
    return Container(
      color: Color(0xFF1F2833),
      child: ListView.builder(
        itemCount: filteredPosts.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
              onTap: () {
                Navigator.push(
=======
  Widget build(BuildContext context) {
    initializer();
    return Scaffold(
      backgroundColor: Colors.black87,
      endDrawer: NavigationDrawerWidget(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'Blueit',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
              decoration: BoxDecoration(
                color: Color(0xFF1F2833),
              ),
            ),
            ListTile(
              title: Text(
                'Home',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text(
                'Communities',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CommunitiesPage()));
              },
            ),
            ListTile(
              title: Text(
                'Settings',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => UserPage()));
              },
            ),
          ],
        ),
      ),
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
          itemCount: posts.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (c, a1, a2) => PostPage(
                          post: posts[index],
                          comments: posts[index].getComments(),
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
                                      "u/" + posts[index].Poster.getUsername(),
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
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      Flexible(
                          child: Container(
                              margin: EdgeInsets.only(
                                  top: 10, left: 10, right: 10, bottom: 5),
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
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      Flexible(
                          child: Container(
                              margin: EdgeInsets.only(
                                  top: 5, left: 10, right: 10, bottom: 10),
                              child: Text(posts[index].getDescription(),
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
                color: Colors.white60,
                onPressed: () {
                  Navigator.push(
>>>>>>> 682bb7f95939602df98310957a67d0a75a816a3d
                    context,
                    PageRouteBuilder(
                      pageBuilder: (c, a1, a2) => PostPage(
                        post: filteredPosts[index],
                        comments: filteredPosts[index].getComments(),
                      ),
                      transitionsBuilder: (c, anim, a2, child) =>
                          FadeTransition(opacity: anim, child: child),
                      transitionDuration: Duration(milliseconds: 200),
<<<<<<< HEAD
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
                                        filteredPosts[index]
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
                                        filteredPosts[index]
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
                            child: Text(filteredPosts[index].getTitle(),
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
                            child: Text(filteredPosts[index].getDescription(),
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
                              //   filteredPosts[index].addLike(widget.user);
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
                                  filteredPosts[index].getNumLikes().toString(),
                                  style: TextStyle(
                                    fontFamily: 'Gotham',
                                    fontSize: 16,
                                    color: Color.fromARGB(205, 38, 97, 244),
                                  ))),
                          GestureDetector(
                            onTap: () {
                              // setState(() {
                              //   filteredPosts[index].addDislike(widget.user);
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
                          //   filteredPosts[index].addLike(widget.user);
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
=======
                    ),
                  );
                },
              ),
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
            ],
          ),
        ),
>>>>>>> 682bb7f95939602df98310957a67d0a75a816a3d
      ),
    );
  }
}
