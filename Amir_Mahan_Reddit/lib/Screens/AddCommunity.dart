<<<<<<< HEAD
import 'dart:io';

import 'package:Amir_Mahan_Reddit/Screens/CommunitLoadPage.dart';
import 'package:Amir_Mahan_Reddit/Screens/loadPage.dart';
import 'package:flutter/material.dart';
import 'package:Amir_Mahan_Reddit/Screens/myNavigator.dart';

import '../main.dart';

class AddCommunity extends StatefulWidget {
  const AddCommunity({Key key, this.username}) : super(key: key);
  final String loadAddress = "";
  final String username;
=======
import 'package:flutter/material.dart';

class AddCommunity extends StatefulWidget {
  const AddCommunity({Key key}) : super(key: key);

>>>>>>> 682bb7f95939602df98310957a67d0a75a816a3d
  @override
  State<AddCommunity> createState() => _AddCommunityState();
}

class _AddCommunityState extends State<AddCommunity> {
<<<<<<< HEAD
  int typeOfCommunity = 0;
  String communityName;
  String description;
  String profilePic = "1";
  TextEditingController communityNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: Colors.black87,
          title: Container(
            // padding:
            // EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.2),
            child: Text(
              "New Community",
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
                        color: (communityNameController.text != "")
                            ? Color(0xFF66FCF1)
                            : Colors.white,
                        fontFamily: 'Gotham',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () async {
                      setState(() {});

                      if (communityNameController.text != "" &&
                          descriptionController.text != "") {
                        await addCommunityToDatabase();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => myNavigator(
                              username: widget.username,
                              content: "Community created successfully",
                            ),
                          ),
                        );
                      }
                    }))
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
                              labelText: "Community Name",
                              labelStyle: TextStyle(
                                fontSize:
                                MediaQuery.of(context).size.width * 0.08,
                                color: Color(0xFFC5C6C7),
                                fontFamily: 'Gotham',
                              ),
                              hintText: "An interesting name",
                              hintStyle: TextStyle(
                                fontSize:
                                MediaQuery.of(context).size.width * 0.06,
                                color: Colors.white,
                                fontFamily: 'Gotham',
                              ),
                            ),
                            controller: communityNameController,
                          ),
                        ),
                        SingleChildScrollView(
                          child: Container(
                            padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.08,
                              right: MediaQuery.of(context).size.width * 0.08,
                            ),
                            child: typeOfCommunity == 0
                                ? Container()
                                : typeOfCommunity == 1
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
                              controller: descriptionController,
                            )
                                : typeOfCommunity == 2
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
                                          CommunityLoadPage(),
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
                              typeOfCommunity = 1;
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
                                    color: typeOfCommunity == 1
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
                              typeOfCommunity = 2;
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
                                  "Profile Image",
                                  style: TextStyle(
                                    color: typeOfCommunity == 2
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

Future<void> addCommunityToDatabase() async {
  var listen;
  await Socket.connect(MyApp.ip, MyApp.port).then((serverSocket) async {
    print("connected");
    serverSocket.write(
        "AddCommunity-${communityNameController.text}-${widget.username}-${descriptionController.text}-${profilePic};");
    serverSocket.flush();
    print("sent");
    listen = serverSocket.listen((data) {
      print("received");
      print(data.toString());
    });
  });
  await listen.asFuture<void>();
}
=======
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
          backgroundColor: Colors.black87,
          title: Text(
            "New Community",
            style: TextStyle(fontFamily: 'Gotham'),
          )),
      body: SingleChildScrollView(
          child: Column(children: [
        Container(
          margin: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
          child: CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage("assets/images/Avatar.png")),
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            child: Container(
              margin: EdgeInsets.only(top: 10, left: 10, bottom: 10, right: 10),
              child: Text("Change profile picture",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Gotham',
                    fontSize: 16,
                  )),
            ),
            decoration: BoxDecoration(
              color: Color.fromARGB(72, 62, 62, 62),
              border: Border.all(
                  color: Color.fromARGB(255, 10, 203, 174), width: 1),
              borderRadius: BorderRadius.all(Radius.circular(22)),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(72, 62, 62, 62),
            border:
                Border.all(color: Color.fromARGB(255, 10, 203, 174), width: 1),
            borderRadius: BorderRadius.all(Radius.circular(22)),
          ),
          margin: EdgeInsets.only(top: 60, left: 10, right: 10, bottom: 50),
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: " Add title",
              hintStyle: TextStyle(
                fontFamily: 'Gotham',
                fontSize: 14,
                color: Color.fromARGB(204, 254, 255, 255),
              ),
            ),
            style: TextStyle(
              fontFamily: 'Gotham',
              fontSize: 18,
              color: Color.fromARGB(255, 10, 203, 174),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(72, 62, 62, 62),
            border:
                Border.all(color: Color.fromARGB(255, 10, 203, 174), width: 1),
            borderRadius: BorderRadius.all(Radius.circular(22)),
          ),
          margin: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 70),
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: " Add description",
              hintStyle: TextStyle(
                fontFamily: 'Gotham',
                fontSize: 14,
                color: Color.fromARGB(204, 254, 255, 255),
              ),
            ),
            style: TextStyle(
              fontFamily: 'Gotham',
              fontSize: 16,
              color: Colors.white70,
            ),
          ),
        ),
        GestureDetector(
          child: Text(
            "Next",
            style: TextStyle(
                color: Color.fromARGB(255, 10, 203, 174),
                fontFamily: 'Gotham',
                fontSize: 22,
                fontWeight: FontWeight.bold),
          ),
        )
      ])),
    );
  }
>>>>>>> 682bb7f95939602df98310957a67d0a75a816a3d
}
