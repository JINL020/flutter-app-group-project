import 'package:flutter/material.dart';
import 'package:hci_m3_app/model/alarm_mode.dart';
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
    return isAlarm ? fireHomePage() : fineHomePage();
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
  );
}

Widget fineHomePage() {
  return Scaffold(
    appBar: AppBar(
      title: Text("Home Page"),
    ),
    backgroundColor: Colors.blue,
  );
}
