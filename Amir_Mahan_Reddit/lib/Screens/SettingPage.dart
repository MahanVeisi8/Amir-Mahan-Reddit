import 'package:flutter/material.dart';
class Setting extends StatefulWidget {
  const Setting({Key key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFBA2),
      body: SafeArea(
        child: Container(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 20,
                    ),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: SafeArea(
                            child: Container(
                              child: Icon(
                                Icons.arrow_back_ios_rounded,
                                color: Colors.amber,
                                size: 35,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              child: Flexible(
                                  child: Text(
                                'Setting',
                                style: TextStyle(
                                  color: Color(0xFF1e1f15),
                                  fontSize: 30,
                                ),
                              )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 20,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              child: Flexible(
                                  child: Text(
                                'Account',
                                style: TextStyle(
                                  color: Color(0xFF1e1f15),
                                  fontSize: 30,
                                ),
                              )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric (
                      horizontal: 10,
                      vertical: 20,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              child: Flexible(
                                  child: Text(
                                'Notification',
                                style: TextStyle(
                                  color: Color(0xFF1e1f15),
                                  fontSize: 30,
                                ),
                              )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric (
                      horizontal: 10,
                      vertical: 20,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              child: Flexible(
                                  child: Text(
                                'Privacy',
                                style: TextStyle(
                                  color: Color(0xFF1e1f15),
                                  fontSize: 30,
                                ),
                              )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric (
                      horizontal: 10,
                      vertical: 20,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              child: Flexible(
                                  child: Text(
                                'About',
                                style: TextStyle(
                                  color: Color(0xFF1e1f15),
                                  fontSize: 30,
                                ),
                              )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric (
                      horizontal: 10,
                      vertical: 20,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              child: Flexible(
                                  child: Text(
                                'Logout',
                                style: TextStyle(
                                  color: Color(0xFF1e1f15),
                                  fontSize: 30,
                                ),
                              )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
