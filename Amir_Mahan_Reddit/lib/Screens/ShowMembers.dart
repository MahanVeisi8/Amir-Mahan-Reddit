import 'package:Amir_Mahan_Reddit/BasicClasses/Users.dart';
import 'package:flutter/material.dart';

class ShowMembers extends StatefulWidget {
  const ShowMembers({Key key, this.members}) : super(key: key);
  final List<User> members;
  @override
  State<ShowMembers> createState() => _ShowMembersState();
}

class _ShowMembersState extends State<ShowMembers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text('Members',
            style: TextStyle(color: Colors.white, fontFamily: 'Gotham')),
      ),
      backgroundColor: Colors.black87,
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        itemCount: widget.members.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 10),
                child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage("assets/images/Avatar2.png")),
              ),
              Text(
                "u/" + widget.members[index].getUsername(),
                style: TextStyle(
                    color: Colors.white70,
                    fontFamily: 'Gotham',
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ],
          );
        },
      ),
    );
  }
}
