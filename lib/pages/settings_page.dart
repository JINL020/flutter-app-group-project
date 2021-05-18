import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hci_m3_app/config/colors.dart';
import 'package:hci_m3_app/config/style.dart';
import 'package:hci_m3_app/model/alarm_settings.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage>
    with AutomaticKeepAliveClientMixin {
  // AutomaticKeepAliveClientMixin saves the screen state enabling us to switching back and forth
  bool pushNotification = true;
  bool location = true;
  bool microfon = true;
  bool pressedAlarm = false;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final isVibration = Provider.of<AlarmSettings>(context).isVibration;
    final isFlashLight = Provider.of<AlarmSettings>(context).isFlashLight;
    final setOffAlarm =
        Provider.of<AlarmSettings>(context, listen: false).setOffAlarm;
    final toggleVibration =
        Provider.of<AlarmSettings>(context, listen: false).toggleVibration;
    final toggleFlashLight =
        Provider.of<AlarmSettings>(context, listen: false).toggleFlashLight;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: ListView(
            children: [
              Text(
                "Einstellungen",
                style: Heading1White,
              ),
              SizedBox(height: 20),
              Text("Art der Alarm-Benachrichtigung:", style: Heading2White),
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                color: AppColors.textFieldWhite,
                child: Column(children: [
                  SwitchListTile(
                    title: Text("Vibration", style: Heading2Black),
                    activeColor: Colors.greenAccent[700],
                    inactiveTrackColor: Colors.grey[600],
                    inactiveThumbColor: Colors.grey[400],
                    value: isVibration,
                    onChanged: (value) => setState(() => toggleVibration()),
                  ),
                  SwitchListTile(
                    title: Text("Kamera Blitz", style: Heading2Black),
                    activeColor: Colors.greenAccent[700],
                    inactiveTrackColor: Colors.grey[600],
                    inactiveThumbColor: Colors.grey[400],
                    value: isFlashLight,
                    onChanged: (value) => setState(() => toggleFlashLight()),
                  ),
                  SwitchListTile(
                    title: Text("Push-Benachrichtigung", style: Heading2Black),
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
              Text("Zugriff erlauben auf:", style: Heading2White),
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                color: AppColors.textFieldWhite,
                child: Column(children: [
                  SwitchListTile(
                    title: Text("Standortinformation", style: Heading2Black),
                    activeColor: Colors.greenAccent[700],
                    inactiveTrackColor: Colors.grey[600],
                    inactiveThumbColor: Colors.grey[400],
                    value: location,
                    onChanged: (value) => setState(() => this.location = value),
                  ),
                  SwitchListTile(
                    title: Text("Mikrofon", style: Heading2Black),
                    activeColor: Colors.greenAccent[700],
                    inactiveTrackColor: Colors.grey[600],
                    inactiveThumbColor: Colors.grey[400],
                    value: microfon,
                    onChanged: (value) => setState(() => this.microfon = value),
                  ),
                ]),
              ),
              SizedBox(height: 30),
              Text("Warnung!", style: Heading2White),
              Container(
                margin: EdgeInsets.fromLTRB(0, 5, 0, 10),
                padding: EdgeInsets.all(15),
                color: AppColors.textFieldWhite,
                child: Text(
                  "Die integrierte Kartenfunktion kann ohne Erlaubnis der Standordinformationen nicht genutz werden. Ohne Zugriff auf das Mikrofon, kann die App nur durch eine konstante Internetverbindung operieren. Das Deaktivieren dieser Optionen kann dadurch zu einer verminderten Sicherheit führen!",
                  style: BodyTextStyle,
                ),
              ),
              SizedBox(height: 30),
              Text("Probealarm testen", style: Heading2White),
              Container(
                margin: EdgeInsets.fromLTRB(0, 5, 0, 10),
                padding: EdgeInsets.all(15),
                color: AppColors.textFieldWhite,
                child: Text(
                  "Testen Sie die Funktionalität der App indem Sie selber einen Testalarm auslösen. Mit einen Klick auf den untenstehenden Button, wird nach 10 Sekunden ein Testalarm ausgelöst. Durch nochmaliges Klicken können Sie wieder in den Normalzustand wechseln.",
                  style: BodyTextStyle,
                ),
              ),
              if (!pressedAlarm)
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      pressedAlarm = !pressedAlarm;
                    });
                    Timer(Duration(seconds: 10), () async {
                      await setOffAlarm();
                      setState(() {
                        pressedAlarm = !pressedAlarm;
                      });
                    });
                  },
                  child: Icon(Icons.warning),
                  style: ButtonStyle(),
                ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
