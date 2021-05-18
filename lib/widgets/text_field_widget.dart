import 'package:flutter/material.dart';
import 'package:hci_m3_app/config/colors.dart';

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
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      decoration: BoxDecoration(
        color: AppColors.textFieldWhite,
      ),
      child: Stack(
        children: [
          TextField(
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            expands: true,
            controller: myController,
            decoration: InputDecoration(
              hintText: "schreibe was",
              border: InputBorder.none,
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
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
