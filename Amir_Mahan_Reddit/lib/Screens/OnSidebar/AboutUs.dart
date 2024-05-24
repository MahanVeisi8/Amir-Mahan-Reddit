import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Column(children: [
        Stack(children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width * 0.53,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/AboutUs.png'),
                  fit: BoxFit.fill,
                )),
          ),
          Container(
            height: 60,

            width: MediaQuery.of(context).size.width,
            margin:
            EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.38),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black87,
                  Colors.transparent,
                ],
              ),
            ),
          ),
          Container(
            height: 60,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.width * 0.38 + 60),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.transparent,
                  Colors.black87,
                ],
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.width * 0.423,
                  left: MediaQuery.of(context).size.width * 0.18),
              child: Text(
                "\nA M I R              M A H A N",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: 'Gotham',
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: Colors.white,
                ),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.width * 0.55,
                ),
                child: Text(
                  "\nComputer Engineering\nStudent At Shahid\n Beheshti University\n\nWubba Lubba Dub Dub!\n\n\n Contact:",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Gotham',
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.width * 0.55,
                ),
                child: Text(
                  "\nComputer Engineering\nStudent At Shahid\n Beheshti University\n\nGrrrrrrasss Tastes Bad!\n\n\nContact:",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Gotham',
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.width * 0.92,
                ),
                child: Text(
                  "\nhttps://github.com\n/Amirmohammadpiran\n\namirdanger80p@gmail.com\n\nhttp://linkedin.com/in/amir\n-mohammad\n-piran-33069a228",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Gotham',
                    fontSize: 14,
                    color: Color.fromARGB(225, 0, 217, 255),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.width * 0.92,
                ),
                child: Text(
                  "https://github.com\n/MahanVeisi8\n\nMahan8292@gmail.com\n\nhttp://linkedin.com/in\n/mahan-veisi-427934226",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Gotham',
                    fontSize: 14,
                    color: Color.fromARGB(225, 0, 217, 255),
                  ),
                ),
              )
            ],
          )
        ])
      ]),
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text('About Us',
            style: TextStyle(fontFamily: 'Gotham', color: Colors.white)),
      ),
    );
  }
}
