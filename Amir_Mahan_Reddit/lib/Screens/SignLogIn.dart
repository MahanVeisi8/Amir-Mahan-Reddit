import 'package:Amir_Mahan_Reddit/Screens/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:Amir_Mahan_Reddit/Screens/WelcomePage.dart';
import 'package:Amir_Mahan_Reddit/configuration/Palette.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:Amir_Mahan_Reddit/BasicClasses/Community.dart';
import 'package:Amir_Mahan_Reddit/BasicClasses/Comment.dart';
import 'package:Amir_Mahan_Reddit/BasicClasses/Post.dart';
import 'package:Amir_Mahan_Reddit/BasicClasses/Users.dart';

class LoginSignupScreen extends StatefulWidget {
  @override
  LoginSignupScreenState createState() => LoginSignupScreenState();
}

class LoginSignupScreenState extends State<LoginSignupScreen> {
  bool isSignupScreen = true;
  bool isMale = true;
  bool isRememberMe = false;
  bool passwordVisible = false;
  final regexForEmail = RegExp(r'^[a-zA-Z0-9]+@gmail.com$');
  final regexForLowerCase = RegExp(r'[a-z]+');
  final regexForUpperCase = RegExp(r'[A-Z]+');
  final regexForNumber = RegExp(r'[0-9]+');
  User user;
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Stack(
        children: [
          // Container(
          //   decoration: BoxDecoration(
          //       image: DecorationImage(
          //     image: AssetImage("assets/images/signInBackground2.jpg"),
          //     fit: BoxFit.cover,
          //   )
          //   ),
          // ),
          Positioned(
            top: 30,
            right: 0,
            left: 0,
            child: Container(
              child: Container(
                padding: EdgeInsets.only(top: 30, left: 30),
                // color: Color(0xFF3b5999).withOpacity(.85),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                          text: "Welcome to ",
                          style: TextStyle(
                            fontSize: 25,
                            letterSpacing: 2,
                            color: Colors.white70,
                          ),
                          children: [
                            TextSpan(
                              text: "BlueIt",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF66FCF1),
                              ),
                            )
                          ]),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      isSignupScreen
                          ? "Signup to Continue"
                          : "Signin to Continue",
                      style: TextStyle(
                        letterSpacing: 1,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          // Trick to add the shadow for the submit button
          buildBottomHalfContainer(true),
          //Main Contianer for Login and Signup
          AnimatedPositioned(
            duration: Duration(milliseconds: 400),
            curve: Curves.bounceInOut,
            top: isSignupScreen ? 120 : 140,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 400),
              curve: Curves.bounceInOut,
              height: isSignupScreen ? 380 : 260,
              padding: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width - 40,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Color(0xFF1F2833).withOpacity(.85),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 15,
                        spreadRadius: 5),
                  ]),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSignupScreen = false;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                "LOGIN",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: !isSignupScreen
                                        ? Color(0xFF66FCF1)
                                        : Colors.white),
                              ),
                              if (!isSignupScreen)
                                Container(
                                  margin: EdgeInsets.only(top: 3),
                                  height: 2,
                                  width: 55,
                                  color: Color(0xFF45A29E),
                                )
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSignupScreen = true;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                "SIGNUP",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: !isSignupScreen
                                        ? Colors.white
                                        : Color(0xFF66FCF1)),
                              ),
                              if (isSignupScreen)
                                Container(
                                  margin: EdgeInsets.only(top: 3),
                                  height: 2,
                                  width: 55,
                                  color: Color(0xFF45A29E),
                                )
                            ],
                          ),
                        )
                      ],
                    ),
                    if (isSignupScreen) buildSignupSection(),
                    if (!isSignupScreen) buildSigninSection()
                  ],
                ),
              ),
            ),
          ),
          // Trick to add the submit button
          buildBottomHalfContainer(false),
          // Bottom buttons
          Positioned(
            top: MediaQuery.of(context).size.height - 100,
            right: 0,
            left: 0,
            child: Column(
              children: [
                Text(isSignupScreen ? "" : "Or Signin with"),
                Container(
                  margin: EdgeInsets.only(right: 20, left: 20, top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // buildTextButton(MaterialCommunityIcons.facebook,
                      //     "Facebook", Color(0xFF1F2833) ),
                      FlatButton(
                          onPressed: () {},
                          child: buildTextButton(
                              MaterialCommunityIcons.facebook,
                              "Facebook",
                              Color(0xFF1F2833)),
                      ),
                      buildTextButton(MaterialCommunityIcons.google,
                          "Google", Color(0xFF1F2833)),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Container buildSigninSection() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Container(
            child: ListTile(
              leading: Icon(
                MaterialCommunityIcons.account_outline,
                color: Color(0xFF66FCF1),
              ),
              minLeadingWidth: 0,
              title: TextFormField(
                onTap: () {
                  setState(() {
                    // isSignupScreen = true;
                  });
                },
                cursorColor: Color(0xFF66FCF1),
                decoration: InputDecoration(
                  hintText: "User Name",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                  contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
                controller: userNameController,
                keyboardType: TextInputType.text,
                maxLines: 1,
              ),
              trailing: Icon(
                userNameController.text.isEmpty
                    ? Icons.close
                    : Icons.check,
                color: Color(0xFF66FCF1),
              ),
            ),
          ),
          Container(
            child: ListTile(
              leading: Icon(
                MaterialCommunityIcons.lock_outline,
                color: Color(0xFF66FCF1),
              ),
              minLeadingWidth: 0,
              title: TextFormField(
                obscureText: passwordVisible,
                cursorColor: Color(0xFF66FCF1),
                decoration: InputDecoration(
                  hintText: "Password",
                  suffixIcon: IconButton(
                    icon: Icon(
                      passwordVisible ? Icons.visibility_off : Icons.visibility,
                      color: Color(0xFF66FCF1),
                    ),
                    onPressed: () {
                      setState(() {
                        passwordVisible = !passwordVisible;
                      });
                    },
                  ),
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                  contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
                controller: passwordController,
                keyboardType: TextInputType.text,
                maxLines: 1,
              ),
              trailing: Icon(
                passwordController.text.isEmpty
                    ? Icons.close
                    : !regexForLowerCase.hasMatch(passwordController.text)
                    ? Icons.close
                    : !regexForUpperCase.hasMatch(passwordController.text)
                    ? Icons.close
                    : !regexForNumber.hasMatch(passwordController.text)
                    ? Icons.close
                    : passwordController.text.length < 8
                    ? Icons.close
                    : Icons.check,
                color: Color(0xFF66FCF1),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    // focusColor: Color(0xFF66FCF1),
                    value: isRememberMe,
                    hoverColor: Colors.white,
                    activeColor: Colors.transparent,
                    checkColor: Color(0xFF66FCF1),
                    shape: CircleBorder(),
                    onChanged: (value) {
                      setState(() {
                        isRememberMe = !isRememberMe;
                      });
                    },
                  ),
                  Text("Remember me",
                      style: TextStyle(fontSize: 12, color: Colors.white))
                ],
              ),
              TextButton(
                onPressed: () {},
                child: Text("Forgot Password?",
                    style: TextStyle(fontSize: 12, color: Color(0xFF66FCF1))),
              )
            ],
          )
        ],
      ),
    );
  }

  Container buildSignupSection() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Container(
            child: ListTile(
              leading: Icon(
                MaterialCommunityIcons.account_outline,
                color: Color(0xFF66FCF1),
              ),
              minLeadingWidth: 0,
              title: TextFormField(
                onTap: () {
                  setState(() {
                    // isSignupScreen = true;
                  });
                },
                cursorColor: Color(0xFF66FCF1),
                decoration: InputDecoration(
                  hintText: "User Name",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                  contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
                controller: userNameController,
                keyboardType: TextInputType.text,
                maxLines: 1,
              ),
              trailing: Icon(
                userNameController.text.isEmpty
                    ? Icons.close
                    : Icons.check,
                color: Color(0xFF66FCF1),
              ),
            ),
          ),
          Container(
            child: ListTile(
              leading: Icon(
                MaterialCommunityIcons.email_outline,
                color: Color(0xFF66FCF1),
              ),
              minLeadingWidth: 0,
              title: TextFormField(
                onTap: () {
                  setState(() {
                  });
                },
                cursorColor: Color(0xFF66FCF1),
                decoration: InputDecoration(
                  hintText: "Email",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                  // hoverColor: Color(0xFF66FCF1),
                  // focusColor: Color(0xFF66FCF1),

                  contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
                controller: emailController,
                keyboardType: TextInputType.text,
                maxLines: 1,
              ),
              trailing: Icon(
                regexForEmail.hasMatch(emailController.text)
                    ? Icons.check
                    : Icons.close,
                // Icons.check,
                color: Color(0xFF66FCF1),
              ),
            ),
          ),
          Container(
            child: ListTile(
              leading: Icon(
                MaterialCommunityIcons.lock_outline,
                color: Color(0xFF66FCF1),
              ),
              minLeadingWidth: 0,
              title: TextFormField(
                obscureText: passwordVisible,
                cursorColor: Color(0xFF66FCF1),
                decoration: InputDecoration(
                  hintText: "Password",
                  suffixIcon: IconButton(
                    icon: Icon(
                      passwordVisible
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Color(0xFF66FCF1),
                    ),
                    onPressed: () {
                      setState(() {
                        passwordVisible = !passwordVisible;
                      });
                    },
                  ),
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                  contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
                controller: passwordController,
                keyboardType: TextInputType.text,
                maxLines: 1,
              ),
              trailing: Icon(
                passwordController.text.isEmpty
                    ? Icons.close
                    : !regexForLowerCase.hasMatch(passwordController.text)
                        ? Icons.close
                        : !regexForUpperCase.hasMatch(passwordController.text)
                            ? Icons.close
                            : !regexForNumber.hasMatch(passwordController.text)
                                ? Icons.close
                                : passwordController.text.length < 8
                                    ? Icons.close
                                    : Icons.check,
                color: Color(0xFF66FCF1),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isMale = true;
                    });
                  },
                  child: Row(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        margin: EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(
                                width: 1,
                                color: isMale
                                    ? Color(0xFF66FCF1)
                                    : Colors.transparent),
                            borderRadius: BorderRadius.circular(15)),
                        child: Icon(
                          MaterialCommunityIcons.account_outline,
                          color: isMale ? Color(0xFF66FCF1) : Palette.iconColor,
                        ),
                      ),
                      Text(
                        "Male",
                        style: TextStyle(color: Palette.textColor1),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isMale = false;
                    });
                  },
                  child: Row(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        margin: EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(
                                width: 1,
                                color: isMale
                                    ? Colors.transparent
                                    : Color(0xFF66FCF1)),
                            borderRadius: BorderRadius.circular(15)),
                        child: Icon(
                          MaterialCommunityIcons.account_outline,
                          color: isMale ? Palette.iconColor : Color(0xFF66FCF1),
                        ),
                      ),
                      Text(
                        "Female",
                        style: TextStyle(color: Palette.textColor1),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            // width: 200,
            margin: EdgeInsets.only(top: 20),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: "By pressing 'Submit' you agree \nto our ",
                  style: TextStyle(color: Palette.textColor2),
                  children: [
                    TextSpan(
                      text: "term & conditions",
                      style: TextStyle(color: Color(0xFF66FCF1)),
                    ),
                  ]
              ),
            ),
          ),
        ],
      ),
    );
  }

  TextButton buildTextButton(
      IconData icon, String title, Color backgroundColor) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
          side: BorderSide(width: 1, color: Colors.grey),
          minimumSize: Size(145, 40),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          primary: Colors.white,
          backgroundColor: backgroundColor),
      child: Row(
        children: [
          Icon(
            icon,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            title,
          )
        ],
      ),
    );
  }

  Widget buildBottomHalfContainer(bool showShadow) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 400),
      curve: Curves.bounceInOut,
      top: isSignupScreen ? 450 : 350,
      right: 0,
      left: 0,
      child: Center(
        child: GestureDetector(
          onTap: () {
            String userName = userNameController.text;
            String email = emailController.text;
            String password = passwordController.text;
            RegExp regexForEmail = RegExp(r'^[a-zA-Z0-9]+@gmail.com$');
            RegExp regexForLowerCase = RegExp(r'[a-z]+');
            RegExp regexForUpperCase = RegExp(r'[A-Z]+');
            RegExp regexForNumber = RegExp(r'[0-9]+');
            bool validPassword = password.length >= 8 &&
                regexForLowerCase.hasMatch(password) &&
                regexForUpperCase.hasMatch(password) &&
                regexForNumber.hasMatch(password);
            // bool validEmail = regexForEmail.hasMatch(email);
            // // !!!!!!!!!!!!! MUST MOVE THIS PART TO ELSE BEFORE MERGE !!!!!!!!!!!!!
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => HomePage()),
            // );
            // welcomePage replaced with HomePage
            // // !!!!!!!!!!!!! MUST MOVE THIS PART TO ELSE BEFORE MERGE !!!!!!!!!!!!!
            if (userName.isEmpty || email.isEmpty || password.isEmpty) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Error"),
                      content: Text("Please fill all the fields"),
                      actions: [
                        FlatButton(
                          child: Text("Ok"),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        )
                      ],
                    );
                  });
            } else if (!validPassword) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Error"),
                      content: Text(
                          "Password must contain atleast one lowercase, one uppercase, one number and atleast 8 characters"),
                      actions: [
                        FlatButton(
                          child: Text("Ok"),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        )
                      ],
                    );
                  });
            } else if (!regexForEmail.hasMatch(email)) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Error"),
                      content: Text("Please enter a valid email"),
                      actions: [
                        FlatButton(
                          child: Text("Ok"),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        )
                      ],
                    );
                  });
            } else {
              user = User(userName, email, password, isMale);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomePage(
                          user: user,
                        )),
              );
            }
          },
          child: Container(
            height: 90,
            width: 90,
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: Color(0xFF1F2833).withOpacity(.85),
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  if (showShadow)
                    BoxShadow(
                      color: Colors.black.withOpacity(.3),
                      spreadRadius: 1.5,
                      blurRadius: 10,
                    )
                ]),
            child: !showShadow
                ? Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFFdce3e2),
                            Color(0xFF0ffceb),
                            Color(0xFF30e3d6),
                            Color(0xFF1F2833),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(.3),
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset: Offset(0, 1))
                        ]),
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  )
                : Center(),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
      IconData icon, String hintText, bool isPassword, bool isEmail) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextField(
        obscureText: isPassword,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Palette.iconColor,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Palette.textColor1),
            borderRadius: BorderRadius.all(Radius.circular(35.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Palette.textColor1),
            borderRadius: BorderRadius.all(Radius.circular(35.0)),
          ),
          contentPadding: EdgeInsets.all(10),
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 14, color: Palette.textColor1),
        ),
      ),
    );
  }
}
