import 'package:flutter/material.dart';
import 'package:hci_m3_app/model/alarm_mode.dart';
import 'package:hci_m3_app/widgets/status_box.dart';
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
  @override
  Widget build(BuildContext context) {
    final isAlarm = Provider.of<AlarmMode>(context).isAlarm;
    var logger = Logger();
    logger.d(isAlarm);
    return isAlarm ? fireHomePage() : noFireHomePage();
    /*return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          decoration: new InputDecoration(
              hintText: "schreibe um dich mit anderen aus zu tauschen"),
        ),
      ),
      backgroundColor: isAlarm ? Colors.red : Colors.blue,
    );*/
  }
}

Widget fireHomePage() {
  return Scaffold(
    appBar: AppBar(
      title: Text("Home Page"),
    ),
    backgroundColor: Colors.red,
    body: StatusBox(
      isAlarm: true,
      alarmStatus: "Feueralarm!",
      timeStamp: DateTime.now().hour.toString() +
          ":" +
          DateTime.now().minute.toString(),
      place: "Währinger Straße 29",
    ),
  );
}

Widget noFireHomePage() {
  return Scaffold(
    appBar: AppBar(
      title: Text("Home Page"),
    ),
    backgroundColor: Colors.blue,
    body: StatusBox(
      isAlarm: false,
      alarmStatus: "All Good!",
      timeStamp: "--:--",
      place: "----",
    ),
  );
}

Widget statusInfo() {
  return Center(
    child: Container(
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(10.0),
      width: 48.0,
      height: 48.0,
    ),
  );
}
