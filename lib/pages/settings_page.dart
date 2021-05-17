import 'dart:async';

import 'package:flutter/material.dart';
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
      /*body: ElevatedButton(
        onPressed: setOffAlarm,
        child: Text("Set off alarm"),
      ),*/
    );
  }

  @override
  bool get wantKeepAlive => true;
}
