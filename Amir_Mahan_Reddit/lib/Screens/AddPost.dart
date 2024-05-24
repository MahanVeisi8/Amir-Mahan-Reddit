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
import 'package:Amir_Mahan_Reddit/Screens/AddPost2.dart';
import '../BasicClasses/Comment.dart';
import '../BasicClasses/Community.dart';

class AddPost extends StatefulWidget {
<<<<<<< HEAD
  const AddPost({Key key, this.username}) : super(key: key);
  final String loadAddress = "";
  final String username;
=======
  const AddPost({Key key}) : super(key: key);
  final String loadAddress = "";
>>>>>>> 682bb7f95939602df98310957a67d0a75a816a3d
  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  int TypeOfPost = 0;
  String title;
  String describtion;
  TextEditingController titleController = TextEditingController();
  TextEditingController describtionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: Colors.black87,
          title: Container(
            padding:
                EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.2),
            child: Text(
              "New Post",
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Gotham',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          actions: [
            Center(
              child: FlatButton(
                  color: Colors.transparent,
                  child: Text(
                    "Next",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFF66FCF1),
                      fontFamily: 'Gotham',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
<<<<<<< HEAD
                    title = titleController.text;
                    describtion = describtionController.text;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddPost2(
                          username: widget.username,
                          title: title,
                          description: describtion,
                        ),
                        ),
                      );
=======
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddPost2(),
                      ),
                    );
>>>>>>> 682bb7f95939602df98310957a67d0a75a816a3d
                  }),
            )
          ],
        ),
        backgroundColor: Colors.black87,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.08,
                              right: MediaQuery.of(context).size.width * 0.08,
                              top: MediaQuery.of(context).size.height * 0.02),
                          child: TextField(
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Gotham',
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.06,
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              labelText: "Title",
                              labelStyle: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.08,
                                color: Color(0xFFC5C6C7),
                                fontFamily: 'Gotham',
                              ),
                              hintText: "An interesting title",
                              hintStyle: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.06,
                                color: Colors.white,
                                fontFamily: 'Gotham',
                              ),
<<<<<<< HEAD
                            ),
                            controller: titleController,
                          ),
                        ),
                        SingleChildScrollView(
                          child: Container(
                            padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.08,
                              right: MediaQuery.of(context).size.width * 0.08,
                            ),
                            child: TypeOfPost == 0
                                ? Container()
                                : TypeOfPost == 1
                                    ? TextField(
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Gotham',
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.04,
                                        ),
                                        maxLines: null,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          labelText: "Description",
                                          labelStyle: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.06,
                                            color: Color(0xFFC5C6C7),
                                            fontFamily: 'Gotham',
                                          ),
                                        ),
                                        controller: describtionController,
                                      )
                                    : TypeOfPost == 2
                                        ? Container(
                                            padding: EdgeInsets.only(
                                                left: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.08,
                                                right: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.08,
                                                top: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.025),
                                            child: FlatButton(
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        LoadPage(),
                                                  ),
                                                );
                                              },
                                              child: Text(
                                                "Select Image",
                                                style: TextStyle(
                                                  color: Color(0xFF66FCF1),
                                                  fontFamily: 'Gotham',
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.06,
                                                ),
                                              ),
                                            ),
                                          )
                                        : Container(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.08),
                    child: Column(
                      children: [
                        FlatButton(
                          color: Color(0xFF233142),
                          onPressed: () {
                            setState(() {
                              TypeOfPost = 1;
                            });
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.03,
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: Row(
                              children: [
                                Image(
                                  image: AssetImage('assets/images/text.png'),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.02,
                                ),
                                Text(
                                  "Text",
                                  style: TextStyle(
                                    color: TypeOfPost == 1
                                        ? Colors.white
                                        : Colors.white.withOpacity(0.5),
                                    fontFamily: 'Gotham',
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.06,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
=======
                            ),
                          ),
                        ),
                        SingleChildScrollView(
                          child: Container(
                            padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.08,
                              right: MediaQuery.of(context).size.width * 0.08,
                            ),
                            child: TypeOfPost == 0
                                ? Container()
                                : TypeOfPost == 1
                                    ? TextField(
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Gotham',
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.04,
                                        ),
                                        maxLines: null,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          labelText: "Description",
                                          labelStyle: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.06,
                                            color: Color(0xFFC5C6C7),
                                            fontFamily: 'Gotham',
                                          ),
                                        ),
                                      )
                                    : TypeOfPost == 2
                                        ? Container(
                                            padding: EdgeInsets.only(
                                                left: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.08,
                                                right: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.08,
                                                top: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.025),
                                            child: FlatButton(
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        LoadPage(),
                                                  ),
                                                );
                                              },
                                              child: Text(
                                                "Select Image",
                                                style: TextStyle(
                                                  color: Color(0xFF66FCF1),
                                                  fontFamily: 'Gotham',
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.06,
                                                ),
                                              ),
                                            ),
                                          )
                                        : Container(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.08),
                    child: Column(
                      children: [
                        FlatButton(
                          color: Color(0xFF233142),
                          onPressed: () {
                            setState(() {
                              TypeOfPost = 1;
                            });
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.03,
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: Row(
                              children: [
                                Image(
                                  image: AssetImage('assets/images/text.png'),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.02,
                                ),
                                Text(
                                  "Text",
                                  style: TextStyle(
                                    color: TypeOfPost == 1
                                        ? Colors.white
                                        : Colors.white.withOpacity(0.5),
                                    fontFamily: 'Gotham',
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.06,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
>>>>>>> 682bb7f95939602df98310957a67d0a75a816a3d
                        FlatButton(
                          color: Color(0xFF233142),
                          onPressed: () {
                            setState(() {
                              TypeOfPost = 2;
                            });
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.03,
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: Row(
                              children: [
                                Image(
                                  image:
                                      AssetImage('assets/images/imageIcon.png'),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.02,
                                ),
                                Text(
                                  "Image",
                                  style: TextStyle(
                                    color: TypeOfPost == 2
                                        ? Colors.white
                                        : Colors.white.withOpacity(0.5),
                                    fontFamily: 'Gotham',
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.06,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        FlatButton(
                          color: Color(0xFF233142),
                          onPressed: () {
                            setState(() {
                              TypeOfPost = 3;
                            });
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.03,
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: Row(
                              children: [
                                Image(
                                  image: AssetImage('assets/images/poll.png'),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.02,
                                ),
                                Text(
                                  "Poll",
                                  style: TextStyle(
                                    color: TypeOfPost == 3
                                        ? Colors.white
                                        : Colors.white.withOpacity(0.5),
                                    fontFamily: 'Gotham',
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.06,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        FlatButton(
                          color: Color(0xFF233142),
                          onPressed: () {
                            setState(() {
                              TypeOfPost = 4;
                            });
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.03,
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.link,
                                  color: Color(0xFF66FCF1),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.02,
                                ),
                                Text(
                                  "Link",
                                  style: TextStyle(
                                    color: TypeOfPost == 4
                                        ? Colors.white
                                        : Colors.white.withOpacity(0.5),
                                    fontFamily: 'Gotham',
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.06,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
