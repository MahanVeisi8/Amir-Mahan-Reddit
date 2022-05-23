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

    posts.add(new Post(new User("Amir", "email", "password", true), com,
        "hey motherfuckers! welcome to this app! this is the first caption!"));

    posts.add(new Post(new User("Setareh", "email", "password", false), com,
        "Woooowww this is aaammaaaazing!"));

    posts.add(new Post(new User("Mahan", "email", "password", true), com,
        "goh nakhor kheili ham tokhmiye!"));

    posts.add(new Post(new User("Shamim", "email", "password", false), com,
        "sa laaaaaaaaaaaam!"));

    posts.add(new Post(new User("Setareh", "email", "password", false), com,
        "Woooowww this is aaammaaaazing! bache ha man nemidoonam chi begam vali kheili appetoon bahalee!! ashegheshammmmm ::::)))))"));

    posts.add(new Post(new User("Kiyarash", "email", "password", true), com,
        "Haj Rasoul Ali bood! kheili gashang bood!"));
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
              return Material(
                color: Colors.transparent,
                child: Column(children: [
                  //profile must pic included in this container
                  Container(
                      child: Text("u/" + posts[index].Poster.username,
                          style: TextStyle(
                            fontFamily: 'Gotham',
                            fontSize: 16,
                            color: Colors.white,
                          ))),
                ]),
              );
            },
          ),
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
                    onPressed: () {},
                  ),
                ],
              )),
        ));
  }
}
