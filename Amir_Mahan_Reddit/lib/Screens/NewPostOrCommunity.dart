import 'package:Amir_Mahan_Reddit/Screens/AddCommunity.dart';
import 'package:Amir_Mahan_Reddit/Screens/CommunitiesPage.dart';
import 'package:Amir_Mahan_Reddit/Screens/AddPost.dart';
import 'package:Amir_Mahan_Reddit/Screens/HomePage.dart';
import 'package:flutter/material.dart';

class NewPostOrCommunity extends StatefulWidget {
  const NewPostOrCommunity({Key key}) : super(key: key);

  @override
  State<NewPostOrCommunity> createState() => _NewPostOrCommunityState();
}

class _NewPostOrCommunityState extends State<NewPostOrCommunity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black87,
          title: Text(
            "New feed",
            style: TextStyle(fontFamily: 'Gotham'),
          )),
      body: Column(
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            color: Colors.transparent,
            height: 20,
          ),
          GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddCommunity()));
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.92,
                height: MediaQuery.of(context).size.width * 0.7,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                      color: Color.fromARGB(255, 10, 203, 174), width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(22)),
                ),
                child: Column(children: [
                  Container(
                    margin: EdgeInsets.only(
                        top: 30, left: 10, right: 10, bottom: 10),
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/images/Avatar.png"),
                      radius: 60,
                    ),
                  ),
                  Text(
                    "New Community",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Gotham',
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: Text(
                      "Create a place where you can share all your ideas with other people around the world!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white70,
                        fontFamily: 'Gotham',
                        fontSize: 16,
                      ),
                    ),
                  ),
                ]),
              )),
          Container(
            color: Colors.transparent,
            height: 20,
          ),
          GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddPost()));
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.92,
                height: MediaQuery.of(context).size.width * 0.7,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                      color: Color.fromARGB(255, 10, 203, 174), width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(22)),
                ),
                child: Column(children: [
                  Container(
                    margin: EdgeInsets.only(
                        top: 30, left: 10, right: 10, bottom: 10),
                    child: CircleAvatar(
                      backgroundImage:
                          AssetImage("assets/images/Avatar2.png"),
                      radius: 60,
                    ),
                  ),
                  Text(
                    "New Post",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Gotham',
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: Text(
                      "Simply share your ideas and interests with the world!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white70,
                        fontFamily: 'Gotham',
                        fontSize: 16,
                      ),
                    ),
                  ),
                ]),
              ))
        ],
      ),
      backgroundColor: Colors.black87,
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        child: Container(
          color: Colors.black87,
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
              IconButton(
                icon: Icon(Icons.add),
                color: Color.fromARGB(236, 27, 241, 234),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.list_rounded),
                color: Colors.white60,
                onPressed: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (c, a1, a2) => CommunitiesPage(),
                      transitionsBuilder: (c, anim, a2, child) =>
                          FadeTransition(opacity: anim, child: child),
                      transitionDuration: Duration(milliseconds: 200),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
