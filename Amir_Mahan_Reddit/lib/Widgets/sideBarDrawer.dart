import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:Amir_Mahan_Reddit/Screens/OnSidebar/AboutUs.dart';
import 'package:Amir_Mahan_Reddit/Screens/OnSidebar/ProfilePage.dart';
import 'package:Amir_Mahan_Reddit/Screens/OnSidebar/SavedPosts.dart';
import 'package:Amir_Mahan_Reddit/Screens/OnSidebar/ThemeChoosing.dart';
import 'package:Amir_Mahan_Reddit/Screens/SettingPage.dart';

import '../BasicClasses/Users.dart';

class NavigationDrawerWidget extends StatelessWidget {
  NavigationDrawerWidget({Key key, this.user}) : super(key: key);
  final padding = EdgeInsets.symmetric(horizontal: 20);
  final User user;
  String getProfilePicture(String profilePage) {
    String raw1 = "assets/images/";
    String raw2 = ".png";
    switch (profilePage) {
      case "0":
        {
          return raw1 + "morty.png";
        }
      case "1":
        {
          return raw1 + "jerry.png";
        }
      case "2":
        return raw1 + "Jessica.png";
      case "3":
        return raw1 + "Beth.png";
      case "4":
        return raw1 + "summer.png";
      case "5":
        return raw1 + "Doofus_Rick.png";
      case "6":
        return raw1 + "Lawnmower_dog.png";
      case "7":
        return raw1 + "Avatar2.png";
      case "8":
        return raw1 + "Avatar.png";
      case "9":
        return raw1 + "Squanchy.png";
      case "10":
        return raw1 + "Rick.png";
      case "11":
        return raw1 + "Evil_Morty.png";
      default:
        return raw1 + "Avatar" + raw2;
    }
  }
  @override
  Widget build(BuildContext context) {
    final name = user.username;
    final String urlImage = 'https://pbs.twimg.com/media/E7CdHG3WQAANrwu.jpg';

    return Drawer(
      child: Material(
        color: Color.fromARGB(227, 0, 0, 0),
        child: ListView(
          children: <Widget>[
            buildHeader(
              urlImage: urlImage,
              name: name,
              onClicked: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => UserPage(
                    user: user,
                    ),
              )),
            ),
            Container(
              padding: padding,
              child: Column(
                children: [
                  // const SizedBox(height: 12),
                  // buildSearchField(),
                  const SizedBox(height: 24),
                  buildMenuItem(
                    text: 'Profile',
                    icon: Icons.person,
                    onClicked: () => selectedItem(context, 0),
                  ),
                  const SizedBox(height: 10),
                  buildMenuItem(
                    text: 'Saved',
                    icon: Icons.favorite,
                    onClicked: () => selectedItem(context, 1),
                  ),
                  const SizedBox(height: 10),
                  buildMenuItem(
                    text: 'Theme',
                    icon: Icons.color_lens,
                    onClicked: () => selectedItem(context, 2),
                  ),
                  const SizedBox(height: 10),
                  buildMenuItem(
                    text: 'Settings',
                    icon: Icons.settings,
                    onClicked: () => selectedItem(context, 3),
                  ),
                  // const SizedBox(height: 24),
                  // Divider(color: Colors.white70),
                  const SizedBox(height: 10),
                  buildMenuItem(
                    text: 'About Us',
                    icon: Icons.info,
                    onClicked: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AboutUs(),
                      ));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHeader({
    String urlImage,
    String name,
    VoidCallback onClicked,
  }) =>
      InkWell(
        onTap: onClicked,
        child: Column(
          children: [
            Container(
              padding: padding.add(EdgeInsets.fromLTRB(0, 40, 0, 20)),
              child: CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage(
                  getProfilePicture(user.profilePicture),
                ),
                backgroundColor: Colors.transparent,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      );

  Widget buildMenuItem({
    String text,
    IconData icon,
    VoidCallback onClicked,
  }) {
    final color = Colors.white;
    final hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => UserPage(
            user: user,
          ),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => FavouritesPage(),
        ));
        break;
      //case2
      case 3:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Setting(),
        ));
        break;
    }
  }
}
