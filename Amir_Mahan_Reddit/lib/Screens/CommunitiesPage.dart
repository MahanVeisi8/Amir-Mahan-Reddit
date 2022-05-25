import 'package:Amir_Mahan_Reddit/Screens/HomePage.dart';
import 'package:flutter/material.dart';

class CommunitiesPage extends StatefulWidget {
  const CommunitiesPage({Key key}) : super(key: key);

  @override
  State<CommunitiesPage> createState() => _CommunitiesPageState();
}

class _CommunitiesPageState extends State<CommunitiesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black87,
        bottomNavigationBar: BottomAppBar(
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
                    color: Color.fromARGB(236, 27, 241, 234),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.settings),
                    color: Colors.white60,
                    onPressed: () {
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => Setting()));
                    },
                  ),
                ],
              )),
        ));
  }
}
