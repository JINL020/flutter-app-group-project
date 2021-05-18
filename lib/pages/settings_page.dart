import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hci_m3_app/config/colors.dart';
import 'package:hci_m3_app/config/style.dart';
import 'package:hci_m3_app/model/alarm_mode.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage>
    with AutomaticKeepAliveClientMixin {
  // AutomaticKeepAliveClientMixin saves the screen state enabling us to switching back and forth
  bool vibration = true;
  bool flashLight = true;
  bool pushNotification = true;
  bool location = true;
  bool microfon = true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final setOffAlarm =
        Provider.of<AlarmMode>(context, listen: false).setOffAlarm;
    return Scaffold(
      backgroundColor: Colors.transparent,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Timer(Duration(seconds: 3), () {
          setOffAlarm();
        }),
        child: Icon(Icons.add),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: ListView(
            children: [
              Text(
                "Einstellungen",
                style: Heading1TextStyle,
              ),
              SizedBox(height: 20),
              Text("Art der Alarm-Benachrichtigung:", style: Heading2White),
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                color: AppColors.textFieldWhite,
                child: Column(children: [
                  SwitchListTile(
                    title: Text("Vibration", style: Heading2TextStyle),
                    activeColor: Colors.greenAccent[700],
                    inactiveTrackColor: Colors.grey[600],
                    inactiveThumbColor: Colors.grey[400],
                    value: vibration,
                    onChanged: (value) =>
                        setState(() => this.vibration = value),
                  ),
                  SwitchListTile(
                    title: Text("Kamera Blitz", style: Heading2TextStyle),
                    activeColor: Colors.greenAccent[700],
                    inactiveTrackColor: Colors.grey[600],
                    inactiveThumbColor: Colors.grey[400],
                    value: flashLight,
                    onChanged: (value) =>
                        setState(() => this.flashLight = value),
                  ),
                  SwitchListTile(
                    title:
                        Text("Push-Benachrichtigung", style: Heading2TextStyle),
                    activeColor: Colors.greenAccent[700],
                    inactiveTrackColor: Colors.grey[600],
                    inactiveThumbColor: Colors.grey[400],
                    value: pushNotification,
                    onChanged: (value) =>
                        setState(() => this.pushNotification = value),
                  ),
                ]),
              ),
              SizedBox(
                height: 30,
              ),
              Text("Zugriff erlbauben auf:", style: Heading2White),
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                color: AppColors.textFieldWhite,
                child: Column(children: [
                  SwitchListTile(
                    title:
                        Text("Standortinformation", style: Heading2TextStyle),
                    activeColor: Colors.greenAccent[700],
                    inactiveTrackColor: Colors.grey[600],
                    inactiveThumbColor: Colors.grey[400],
                    value: location,
                    onChanged: (value) => setState(() => this.location = value),
                  ),
                  SwitchListTile(
                    title: Text("Mikrofon", style: Heading2TextStyle),
                    activeColor: Colors.greenAccent[700],
                    inactiveTrackColor: Colors.grey[600],
                    inactiveThumbColor: Colors.grey[400],
                    value: microfon,
                    onChanged: (value) => setState(() => this.microfon = value),
                  ),
                ]),
              )
              /*Center(
                child: OutlineButton(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  onPressed: () {},
                  child: Text("SIGN OUT",
                      style: TextStyle(
                          fontSize: 16, letterSpacing: 2.2, color: Colors.black)),
                ),
              )*/
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
