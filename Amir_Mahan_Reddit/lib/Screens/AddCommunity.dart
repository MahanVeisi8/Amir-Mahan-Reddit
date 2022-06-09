import 'package:flutter/material.dart';

class AddCommunity extends StatefulWidget {
  const AddCommunity({Key key}) : super(key: key);

  @override
  State<AddCommunity> createState() => _AddCommunityState();
}

class _AddCommunityState extends State<AddCommunity> {
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
}