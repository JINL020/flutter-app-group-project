import 'package:flutter/material.dart';
import 'package:hci_m3_app/home_page/text_field_widget.dart';
import 'package:hci_m3_app/model/alarm_settings.dart';
import 'package:hci_m3_app/home_page/status_box.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isAlarm = Provider.of<AlarmSettings>(context).isAlarm;
    var logger = Logger();
    logger.d(isAlarm);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: ListView(
          reverse: true,
          children: [
            TextFieldWidget(),
            SizedBox(height: 10),
            isAlarm
                ? StatusBox(
                    isAlarm: isAlarm,
                    message: "Feueralarm!",
                    timeStamp: "00:00",
                    fireLocation: "Währinger Straße 29",
                  )
                : StatusBox(
                    isAlarm: isAlarm,
                    message: "Alles in Ordnung :)",
                    timeStamp: "--:--",
                    fireLocation: "----",
                  ),
          ],
        ),
      ),
    );
  }
}

//DateTime.now().hour.toString() + ":" + DateTime.now().minute.toString(),
