import 'package:flutter/material.dart';

class MapSearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
      padding: EdgeInsets.symmetric(horizontal: 15),
      color: Colors.white,
      child: TextField(
        autofocus: false,
        //focusNode: myFocusNode,
        decoration: new InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Hier suchen",
          suffixIcon: Icon(Icons.search),
        ),
      ),
    );
  }
}
