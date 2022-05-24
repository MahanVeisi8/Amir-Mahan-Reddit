import 'package:flutter/material.dart';
import 'package:Amir_Mahan_Reddit/Screens/SettingPage.dart';
import 'package:Amir_Mahan_Reddit/Widgets/sideBarDrawer.dart';
import 'package:Amir_Mahan_Reddit/Widgets/SideBarButtonWidget.dart';
import 'package:Amir_Mahan_Reddit/BasicClasses/Post.dart';
import 'package:Amir_Mahan_Reddit/BasicClasses/Users.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key key, this.user}) : super(key: key);
  final User user;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black87,
        endDrawer: NavigationDrawerWidget(),
        appBar: AppBar(
          // title: Text('Reddit'),
          // centerTitle: true,
          backgroundColor: Colors.black87,
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
              color: Color.fromARGB(227, 0, 0, 0),
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
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Setting()));
                    },
                  ),
                ],
              )),
        ));
  }
}
