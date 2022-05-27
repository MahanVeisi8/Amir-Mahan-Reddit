import 'package:flutter/material.dart';

class FavouritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
            'Favourites',
            style: TextStyle(fontFamily: 'Gotham'),
          ),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
      );
}