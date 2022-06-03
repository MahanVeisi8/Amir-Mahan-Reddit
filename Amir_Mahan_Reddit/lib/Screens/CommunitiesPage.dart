import 'package:Amir_Mahan_Reddit/Screens/AddPost.dart';
import 'package:Amir_Mahan_Reddit/Screens/CommunitiesPage.dart';
import 'package:Amir_Mahan_Reddit/Screens/OnSidebar/ProfilePage.dart';
import 'package:Amir_Mahan_Reddit/Screens/PostPage.dart';
import 'package:Amir_Mahan_Reddit/Screens/CommunitiesDetailsPage.dart';
import 'package:flutter/material.dart';
import 'package:Amir_Mahan_Reddit/Screens/SettingPage.dart';
import 'package:Amir_Mahan_Reddit/Widgets/sideBarDrawer.dart';
import 'package:Amir_Mahan_Reddit/Widgets/SideBarButtonWidget.dart';
import 'package:Amir_Mahan_Reddit/BasicClasses/Post.dart';
import 'package:Amir_Mahan_Reddit/BasicClasses/Users.dart';
import 'package:Amir_Mahan_Reddit/Widgets/AnimationRoute.dart';
import 'package:Amir_Mahan_Reddit/Screens/HomePage.dart';
import '../BasicClasses/Comment.dart';
import '../BasicClasses/Community.dart';
import 'package:Amir_Mahan_Reddit/Screens/CommunityDetailExample.dart';
class CommunitiesPage extends StatefulWidget {
  const CommunitiesPage({Key key}) : super(key: key);

  @override
  State<CommunitiesPage> createState() => _CommunitiesPageState();
}

class _CommunitiesPageState extends State<CommunitiesPage> {
  List<Community> communities = <Community>[];
  void initializer() {
    communities.add(new Community(
        new User("Setareh", "email", "password", false),
        "Logical_Circuits",
        "Here's a community for people who like to discuss logical circuits! Feel free to ask questions, and join the discussion!"));
    communities[0].addMember(new User("Setareh", "email", "password", false));
    communities[0].addMember(new User("Amir", "email", "password", false));
    communities[0].addMember(new User("Safi", "email", "password", false));
    communities[0].addMember(new User("Mahan", "email", "password", false));
    communities[0].addMember(new User("Sobhan", "email", "password", false));
    communities[0].addMember(new User("Matin", "email", "password", false));
    communities[0].addMember(new User("Setareh", "email", "password", false));
    communities[0].addMember(new User("Amir", "email", "password", false));
    communities[0].addMember(new User("Safi", "email", "password", false));
    communities[0].addMember(new User("Mahan", "email", "password", false));
    communities[0].addMember(new User("Sobhan", "email", "password", false));
    communities[0].addMember(new User("Matin", "email", "password", false));
    communities[0].addPost(new Post(
        new User("Setareh", "email", "password", false),
        communities[0],
        "Alright, Welcome everyone! I'm admin and I'd be happy to answer Ur questions!",
        "I think that's a good idea, but I'm not sure if I can answer your question. I'll ask my friends and colleagues to help me out. Thank you for your patience!"));
    communities[0].addPost(new Post(
        new User("Amir", "email", "password", false),
        communities[0],
        "Such a shame that I can't study LC in this semester :(",
        "Maybe next semester :)"));
    communities[0].addPost(new Post(
        new User("Mahan", "email", "password", false),
        communities[0],
        "Mitooni rajebesh geeeryee koniiii",
        "feshar bokhor madar elek fan"));
    communities[0].addPost(new Post(
        new User("Sobhan", "email", "password", false),
        communities[0],
        "Ali ye helicopter oonjas, berim savar shim",
        "yaay cheghad enemy"));
    communities[0].addPost(new Post(
        new User("Matin", "email", "password", false),
        communities[0],
        "Eeeh Eeeeh Eeeeeeeh Eeeh (*Laughing deadly)",
        "fasle jadide Better Call Saul Oooomad! OOOh yesss"));
    communities[0].addPost(new Post(
        new User("Amir", "email", "password", false),
        communities[0],
        "Sagharam shekasteh ey saghi",
        "Rafteam ze dast be mowla"));
    communities.add(new Community(new User("Amir", "email", "password", true),
        "Foosball_Kings", "Soccer is cool, but it's cooler on a table!"));
    communities.add(new Community(
        new User("Mahan", "email", "password", true),
        "Eminem_Fans_Society",
        "We're here to celebrate the fandom of our favourite singer! Join us!"));
    communities.add(new Community(
        new User("Matin", "email", "password", true),
        "IMDB_Eaters",
        "This is a community for Movies and Series Lovers! We love to discuss them!"));
    communities.add(new Community(
        new User("Amir", "email", "password", true),
        "Metalheads_Club",
        "Welcome to Metalheads Club! Don't forget Horns-ups!"));
    communities.add(new Community(new User("Sobhan", "email", "password", true),
        "Call_Of_Duty_Noobs", "If you're a noob like us, join us!"));
    communities.add(new Community(new User("Mahan", "email", "password", true),
        "Respect club", "here we respect to each other\'s beliefs and opinions, we do not"
            "insult other\'s interests such as music favorites and so much more that"
            "makes other people feel uncomfortable...\n please note there isn\'t an"
            "anti-Amir mohammad piran club"));
  }

  @override
  Widget build(BuildContext context) {
    initializer();
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xFF1F2833),
          title: Text(
            "Communities",
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Gotham',
              fontWeight: FontWeight.bold,
            ),
          ),
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
        ),
        body: Container(
          child: ListView.builder(
              itemCount: communities.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (c, a1, a2) => CommunitiesDetailsPage(
                            community: communities[index],
                          ),
                          transitionsBuilder: (c, anim, a2, child) =>
                              FadeTransition(opacity: anim, child: child),
                          transitionDuration: Duration(milliseconds: 200),
                        ),
                      );
                    },
                    child: Container(
                        color: Colors.transparent,
                        child: Material(
                            color: Colors.transparent,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              right: 10,
                                              left: 10,
                                              top: 15,
                                              bottom: 10),
                                          child: CircleAvatar(
                                            backgroundColor: Colors.transparent,
                                            backgroundImage: AssetImage(
                                                "assets/images/Doofus_Rick.png"),
                                          ),
                                        ),
                                        Container(
                                          child: Text(
                                              "r/" +
                                                  communities[index].getName(),
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'Gotham',
                                                fontSize: 18,
                                              )),
                                        ),
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                          margin: EdgeInsets.only(right: 15),
                                          child: Icon(
                                            Icons.favorite_border_outlined,
                                            color: Colors.white70,
                                            size: 28,
                                          )),
                                    )
                                  ],
                                ),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                          child: Container(
                                        margin: EdgeInsets.only(
                                            bottom: 15,
                                            left: 10,
                                            right: 10,
                                            top: 5),
                                        child: Text(
                                            communities[index].getDescription(),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                fontFamily: 'Gotham',
                                                fontSize: 12,
                                                color: Color.fromARGB(
                                                    177, 255, 255, 255))),
                                      )),
                                      Container(
                                          width: 1,
                                          height: 1,
                                          color: Colors.transparent)
                                    ]),
                                Container(height: 1, color: Colors.black54)
                              ],
                            ))));
              }),
        ),
        backgroundColor: Color(0xFF1F2833),
        bottomNavigationBar: BottomAppBar(
          color: Colors.transparent,
          child: Container(
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
                color: Colors.white60,
                onPressed: () {
                  Navigator.of(context).push(createRoute(AddPost(), 0));
                },
              ),
              IconButton(
                icon: Icon(Icons.list_rounded),
                color: Color.fromARGB(236, 27, 241, 234),
                onPressed: () {},
              ),
            ],
          )),
        ));
  }
}

class SearchBox extends SearchDelegate {
  List<Community> communities = <Community>[];
  void initializer() {
    communities.add(new Community(
        new User("Setareh", "email", "password", false),
        "Logical_Circuits",
        "Here's a community for people who like to discuss logical circuits! Feel free to ask questions, and join the discussion!"));
    communities.add(new Community(new User("Amir", "email", "password", true),
        "Foosball_Kings", "Soccer is cool, but it's cooler on a table!"));
    communities.add(new Community(
        new User("Mahan", "email", "password", true),
        "Eminem_Fans_Society",
        "We're here to celebrate the fandom of our favourite singer! Join us!"));
    communities.add(new Community(
        new User("Matin", "email", "password", true),
        "IMDB_Eaters",
        "This is a community for Movies and Series Lovers! We love to discuss them!"));
    communities.add(new Community(
        new User("Amir", "email", "password", true),
        "Metalheads_Club",
        "Welcome to Metalheads Club! Don't forget Horns-ups!"));
    communities.add(new Community(new User("Sobhan", "email", "password", true),
        "Call_Of_Duty_Noobs", "If you're a noob like us, join us!"));
    communities.add(new Community(new User("Mahan", "email", "password", true),
        "Respect club", "here we respect to each other\'s beliefs and opinions, we do not"
            "insult other\'s interests such as music favorites and so much more that"
            "makes other people feel uncomfortable...\n please note there isn\'t an"
            "anti-Amir mohammad piran club"));
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          if(query.isEmpty){
            close(context, null);
          }
          else{
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
    List<Community> filteredCommunities = communities.where((community) {
      final nameResult = community.name.toLowerCase();
      final descriptionResult = community.description;
      final input = query.toLowerCase();
      return nameResult.contains(input);
    }).toList();
    initializer();
    return Scaffold(
      body: Container(
        child: ListView.builder(
            itemCount: filteredCommunities.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (c, a1, a2) => CommunitiesDetailsPage(
                          community: filteredCommunities[index],
                        ),
                        transitionsBuilder: (c, anim, a2, child) =>
                            FadeTransition(opacity: anim, child: child),
                        transitionDuration: Duration(milliseconds: 200),
                      ),
                    );
                  },
                  child: Container(
                      color: Colors.transparent,
                      child: Material(
                          color: Colors.transparent,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            right: 10,
                                            left: 10,
                                            top: 15,
                                            bottom: 10),
                                        child: CircleAvatar(
                                          backgroundColor: Colors.transparent,
                                          backgroundImage: AssetImage(
                                              "assets/images/Doofus_Rick.png"),
                                        ),
                                      ),
                                      Container(
                                        child: Text(
                                            "r/" +
                                                filteredCommunities[index].getName(),
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'Gotham',
                                              fontSize: 18,
                                            )),
                                      ),
                                    ],
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                        margin: EdgeInsets.only(right: 15),
                                        child: Icon(
                                          Icons.favorite_border_outlined,
                                          color: Colors.white70,
                                          size: 28,
                                        )),
                                  )
                                ],
                              ),
                              Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              bottom: 15,
                                              left: 10,
                                              right: 10,
                                              top: 5),
                                          child: Text(
                                              filteredCommunities[index].getDescription(),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  fontFamily: 'Gotham',
                                                  fontSize: 12,
                                                  color: Color.fromARGB(
                                                      177, 255, 255, 255))),
                                        )),
                                    Container(
                                        width: 1,
                                        height: 1,
                                        color: Colors.transparent)
                                  ]),
                              Container(height: 1, color: Colors.black54)
                            ],
                          ))));
            }),
      ),
        backgroundColor: Color(0xFF1F2833),
    );
  }
}
