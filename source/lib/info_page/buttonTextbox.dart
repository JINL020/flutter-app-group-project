import 'package:flutter/material.dart';
import 'package:hci_m3_app/config/colors.dart';
import 'package:hci_m3_app/config/style.dart';

class ButtonTextBoxWidget extends StatelessWidget {
  final String title;
  final List<String> content;
  final String buttonName;
  final VoidCallback action;
  const ButtonTextBoxWidget({
    Key key,
    @required this.title,
    @required this.content,
    @required this.buttonName,
    @required this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            margin: EdgeInsets.fromLTRB(20, 0, 10, 0),
            alignment: Alignment.centerLeft,
            child: Text(title, style: Heading2White)),
        Container(
          width: double.infinity,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: AppColors.textBoxWhite,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: content
                    .map((line) => Text(line, style: BodyTextStyle))
                    .toList(),
              ),
              if (buttonName != null)
                Center(
                  child: ElevatedButton(
                    onPressed: () => action(),
                    child: Text(buttonName),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
