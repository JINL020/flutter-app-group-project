import 'package:flutter/material.dart';
import 'package:hci_m3_app/config/phone_size.dart';
import 'package:hci_m3_app/config/style.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';

class TextFieldWidget extends StatefulWidget {
  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget>
    with AutomaticKeepAliveClientMixin {
  final textController = TextEditingController();
  final myFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    KeyboardVisibilityNotification().addNewListener(
      onChange: (bool visible) {
        if (!visible) {
          myFocusNode.unfocus();
        }
      },
    );
  }

  @override
  void dispose() {
    textController.dispose();
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      //-115 is the bottom navbar
      height: (PhoneSize.getHeight(context) * 0.7) - 115,
      child: Stack(
        children: [
          TextField(
            style: Heading1Black,
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.multiline,
            autofocus: false,
            focusNode: myFocusNode,
            maxLines: null,
            expands: true,
            controller: textController,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintMaxLines: 10,
              hintText:
                  "Schreibe etwas und zeige es einer hörenden Person um mit ihr zu kommunizieren",
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: IconButton(
              icon: Icon(Icons.delete),
              iconSize: 28,
              onPressed: () => textController.clear(),
              color: Colors.green[800],
            ),
          )
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
