import 'package:flutter/material.dart';
import 'package:hci_m3_app/config/colors.dart';
import 'package:hci_m3_app/config/style.dart';

class TextFieldWidget extends StatefulWidget {
  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget>
    with AutomaticKeepAliveClientMixin {
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          decoration: BoxDecoration(
            color: AppColors.textFieldWhite,
          ),
          child: Container(
            margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: TextField(
              style: Heading2Black,
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              expands: true,
              controller: myController,
              decoration: InputDecoration(
                hintMaxLines: 10,
                hintText:
                    "Schreibe etwas und zeige es einer hörenden Person um mit ihr zu kommunizieren",
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: IconButton(
            icon: Icon(Icons.close),
            onPressed: () => myController.clear(),
            color: Colors.grey[700],
          ),
        )
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
