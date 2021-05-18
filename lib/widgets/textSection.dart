import 'package:flutter/material.dart';
import 'package:hci_m3_app/config/colors.dart';
import 'package:hci_m3_app/config/style.dart';

class TextSection extends StatelessWidget {
  final String title;
  final String body;

  const TextSection({Key key, this.title, this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.textFieldWhite,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(10, 32, 10, 4),
            child: Text(title, style: Heading2TextStyle),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Text(
              body,
              style: BodyTextStyle,
            ),
          )
        ],
      ),
    );
  }
}
