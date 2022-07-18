import 'package:flutter/material.dart';

class DialogWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Feedback & Support"),
      content: Text(
          "Du hast Fragen oder Feednack?\nHier kannst du das Sicha Team kontaktieren."),
    );
  }
}
