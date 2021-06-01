import 'package:flutter/material.dart';
import 'package:hci_m3_app/config/phone_size.dart';

import 'package:hci_m3_app/model/alarm_settings.dart';
import 'package:hci_m3_app/widgets/status_box.dart';
import 'package:hci_m3_app/widgets/text_field_widget.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  final myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final isAlarm = Provider.of<AlarmSettings>(context).isAlarm;
    var logger = Logger();
    logger.d(isAlarm);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          if (PhoneSize.getKeyboard(context) == 0)
            Padding(
                padding: EdgeInsets.fromLTRB(20, 50, 20, 10),
                child: isAlarm ? fireStatusBox() : noFireStatusBox()),
          if (PhoneSize.getKeyboard(context) != 0) SizedBox(height: 40),
          Expanded(
            child: Padding(
                padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: TextFieldWidget()),
          ),
        ],
      ),
    );
  }
}

Widget fireStatusBox() {
  return StatusBox(
    isAlarm: true,
    alarmStatus: "Feueralarm!",
    timeStamp:
        DateTime.now().hour.toString() + ":" + DateTime.now().minute.toString(),
    place: "Währinger Straße 29",
  );
}

Widget noFireStatusBox() {
  return StatusBox(
    isAlarm: false,
    alarmStatus: "Alles in Ordnung :)",
    timeStamp: "--:--",
    place: "----",
  );
}
