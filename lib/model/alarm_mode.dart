import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hci_m3_app/config/colors.dart';
import 'package:hci_m3_app/main.dart';

//Widgets can listen to AlarmMode (a ChangeNotifier object) and are notified
// using 'notifyListeners()' when AlarmMode gets updated values.
//The Widgets(listeners) then can respond with some action.
class AlarmMode extends ChangeNotifier {
  bool _isAlarm = false;
  String timeStamp = "--:--";
  String placce = "-----";
  bool get isAlarm => _isAlarm;

  // this functions sets off an alarm
  setOffAlarm() {
    _isAlarm = !_isAlarm;
    flutterLocalNotificationsPlugin.show(
      0,
      "Testing",
      "How you doin ?",
      NotificationDetails(
        android: AndroidNotificationDetails(
            channel.id, channel.name, channel.description,
            importance: Importance.high,
            color: AppColors.backgroundBlue,
            playSound: true,
            icon: '@mipmap/ic_launcher'),
      ),
    );
    notifyListeners();
  }
}
