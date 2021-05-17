import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hci_m3_app/config/phone_size.dart';
import 'package:hci_m3_app/model/alarm_mode.dart';
import 'package:hci_m3_app/widgets/status_box.dart';
import 'package:hci_m3_app/widgets/text_field_widget.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
/*
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final myController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    // Clean up the controller when the widget is disposed.
    myController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isAlarm = Provider.of<AlarmMode>(context).getIsAlarm();
    //return isAlarm ? fireHomePage() : fineHomePage();
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: myController,
          decoration: new InputDecoration(
              hintText: "schreibe um dich mit anderen aus zu tauschen"),
        ),
      ),
      backgroundColor: isAlarm ? Colors.red : Colors.blue,
    );
  }
}*/

class HomePage extends StatelessWidget {
  final myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final isAlarm = Provider.of<AlarmMode>(context).isAlarm;
    var logger = Logger();
    logger.d(isAlarm);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: SizedBox(
          height: PhoneSize.getHeight(context),
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.fromLTRB(20, 50, 20, 5),
                  child: isAlarm ? fireStatusBox() : noFireStatusBox()),
              Expanded(
                child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 5, 20, 20),
                    child: TextFieldWidget()),
              ),
            ],
          ),
        ),
      ),
      /*
          SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: PhoneSize.getWidth(context),
              minHeight: PhoneSize.getHeight(context),
            ),
            child: IntrinsicHeight(
                child: Column(
              children: [
                Padding(
                    padding: EdgeInsets.fromLTRB(20, 50, 20, 5),
                    child: isAlarm ? fireStatusBox() : noFireStatusBox()),
                SizedBox(
                  height: 300,
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 5, 20, 20),
                      child: TextFieldWidget()),
                ),
              ],
            ))),
      ),*/
      backgroundColor: isAlarm ? Colors.red : Colors.blue,
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
    alarmStatus: "All Good!",
    timeStamp: "--:--",
    place: "----",
  );
}
