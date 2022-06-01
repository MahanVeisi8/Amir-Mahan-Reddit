import 'package:Amir_Mahan_Reddit/Screens/ProfilePage.dart';
import 'package:flutter/material.dart';
import 'package:Amir_Mahan_Reddit/BasicClasses/Community.dart';

class CommunitiesDetailsPage extends StatefulWidget {
  const CommunitiesDetailsPage({Key key, this.community}) : super(key: key);
  final Community community;

  @override
  State<CommunitiesDetailsPage> createState() => _CommunitiesDetailsPageState();
}

class _CommunitiesDetailsPageState extends State<CommunitiesDetailsPage> {
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
                    color: Color.fromARGB(255, 2, 23, 61),
                  ),
                )),
            Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.width * 0.525,
                  left: MediaQuery.of(context).size.width * 0.18 + 30),
              child: Text(
                "| Created by u/" + widget.community.getAdmin().getUsername(),
                style: TextStyle(
                    fontFamily: 'Gotham', fontSize: 16, color: Colors.white70),
              ),
            )
          ]),
          Flexible(
            child: Container(
              margin: EdgeInsets.only(
                top: 15,
                left: 20,
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
            margin: EdgeInsets.only(top: 20, bottom: 10),
            height: 1,
            width: MediaQuery.of(context).size.width * 0.9,
            color: Colors.white24,
          ),
        ],
      ),
    );
  }
}
