import 'dart:io';

import 'package:Amir_Mahan_Reddit/BasicClasses/Community.dart';
import 'package:Amir_Mahan_Reddit/BasicClasses/Users.dart';
import 'package:Amir_Mahan_Reddit/Screens/myNavigator.dart';
import 'package:Amir_Mahan_Reddit/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:Amir_Mahan_Reddit/Screens/OnSidebar/SavedPosts.dart';
import 'package:Amir_Mahan_Reddit/Screens/OnSidebar/ThemeChoosing.dart';
import 'package:Amir_Mahan_Reddit/Screens/OnSidebar/ProfilePage.dart';
import 'package:Amir_Mahan_Reddit/Screens/OnSidebar/AboutUs.dart';
import 'package:Amir_Mahan_Reddit/Screens/SettingPage.dart';
import 'package:Amir_Mahan_Reddit/Screens/HomePage.dart';
import 'package:Amir_Mahan_Reddit/Widgets/sideBarDrawer.dart';
import 'package:Amir_Mahan_Reddit/Widgets/SideBarButtonWidget.dart';
import 'package:Amir_Mahan_Reddit/Screens/WelcomePage.dart';
import 'package:Amir_Mahan_Reddit/Screens/SignLogIn.dart';
import 'package:Amir_Mahan_Reddit/Screens/loadPage.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key key, this.user}) : super(key: key);
  final User user;
  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  String profileId = "1";//
  String stringedData;
  Future<void> changeUserInfo() async {
    // setState(() {

    // });
    await Socket.connect(MyApp.ip, MyApp.port).then((ServerSocket) async {
      setState(() {
        widget.user.name = nameController.text;
        widget.user.username = usernameController.text;
        widget.user.setPassword(passwordController.text);
        widget.user.setEmail(emailController.text);
        widget.user.phoneNumber = phoneNumberController.text;
      });

      print("connected");
      ServerSocket.write("updateUserInfo-${widget.user.username}-${widget.user.getPassword()}-${widget.user.getEmail()}-${widget.user.profilePicture}-${widget.user.name}-${widget.user.phoneNumber};");
      ServerSocket.flush();
      print("sent");
      var listen1 = ServerSocket.listen((data) {
        print("received");
        stringedData = String.fromCharCodes(data);
      });
      await listen1.asFuture<void>();
      print(stringedData);
    });
  }
  String getProfilePicture(String profilePage) {
    String raw1 = "assets/images/";
    String raw2 = ".png";
    switch (profilePage) {
      case "0":
        {
          return raw1 + "morty.png";
          break;
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
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Edit Profile'),
        actions: [
          IconButton(
            padding: EdgeInsets.only(right: 30),
            icon: Icon(Icons.check, size: 30, color: Color(0xFF66FCF1)),
            onPressed: () async {
              await changeUserInfo();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => myNavigator(
                    username: widget.user.username,
                    content: "User Info Updated",
                  ),
                ),
              );
            },
          ),
        ],
        backgroundColor: Colors.black87,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Center(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.23,
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.015),
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage(
                    getProfilePicture(widget.user.profilePicture)
                  ),
                  radius: MediaQuery.of(context).size.width * 0.2,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoadPage(user: widget.user),
                  ),
                );
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width * 0.9,
                child: Center(
                  child: Text(
                    'Change Photo',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                      color: Color(0xFF66FCF1),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            Container(
              // height: MediaQuery.of(context).size.height * 0.09,
              height: 70,
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextField(
                style: TextStyle(
                  color: Colors.white,
                  fontSize: MediaQuery.of(context).size.width * 0.05,
                ),
                decoration: InputDecoration(
                  hintText: 'First name and Last name',
                  hintStyle: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                    color: Colors.white,
                  ),
                  label: Text(
                    'Name',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                      color: Color(0xFFC5C6C7),
                    ),
                  ),
                  prefixIcon: Icon(
                    Icons.person_pin,
                    color: Color(0xFF66FCF1),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                controller: nameController,
              ),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Container(
              // height: MediaQuery.of(context).size.height * 0.09,
              height: 70,
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextField(
                style: TextStyle(
                  color: Colors.white,
                  fontSize: MediaQuery.of(context).size.width * 0.05,
                ),
                decoration: InputDecoration(
                  hintText: 'Example123',
                  hintStyle: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                    color: Colors.white,
                  ),
                  prefixIcon: Icon(
                    Icons.person,
                    color: Color(0xFF66FCF1),
                  ),
                  label: Text(
                    'Username',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                      color: Color(0xFFC5C6C7),
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                controller: usernameController,
              ),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Container(
              // height: MediaQuery.of(context).size.height * 0.09,
              height: 70,
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextField(
                style: TextStyle(
                  color: Colors.white,
                  fontSize: MediaQuery.of(context).size.width * 0.05,
                ),
                decoration: InputDecoration(
                  hintText: 'Exapmle_password',
                  hintStyle: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                    color: Colors.white,
                  ),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Color(0xFF66FCF1),
                  ),
                  label: Text(
                    'Password',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                      color: Color(0xFFC5C6C7),
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                controller: passwordController,
              ),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Container(
              // height: MediaQuery.of(context).size.height * 0.09,
              height: 70,
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextField(
                style: TextStyle(
                  color: Colors.white,
                  fontSize: MediaQuery.of(context).size.width * 0.05,
                ),
                decoration: InputDecoration(
                  hintText: 'Example@gmail.com',
                  hintStyle: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                    color: Colors.white,
                  ),
                  prefixIcon: Icon(
                    Icons.email,
                    color: Color(0xFF66FCF1),
                  ),
                  label: Text(
                    'Email',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                      color: Color(0xFFC5C6C7),
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                controller: emailController,
              ),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Container(
              // height: MediaQuery.of(context).size.height * 0.09,
              height: 70,
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextField(
                style: TextStyle(
                  color: Colors.white,
                  fontSize: MediaQuery.of(context).size.width * 0.05,
                ),
                decoration: InputDecoration(
                  hintText: '09187654321',
                  hintStyle: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                    color: Colors.white,
                  ),
                  prefixIcon: Icon(
                    Icons.phone,
                    color: Color(0xFF66FCF1),
                  ),
                  label: Text(
                    'Phone Number',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                      color: Color(0xFFC5C6C7),
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                controller: phoneNumberController,
              ),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
