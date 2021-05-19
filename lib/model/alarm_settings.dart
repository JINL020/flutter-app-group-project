import 'dart:async';

import 'package:flashlight/flashlight.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hci_m3_app/config/colors.dart';
import 'package:hci_m3_app/main.dart';
import 'package:vibration/vibration.dart';

//Widgets can listen to AlarmSettings (a ChangeNotifier object) and are notified
// using 'notifyListeners()' when AlarmSettings gets updated values.
//The Widgets(listeners) then can respond with some action.
class AlarmSettings extends ChangeNotifier {
  bool _isAlarm = false;
  bool _isVibration = true;
  bool _isFlashLight = true;
  bool _isPushNotification = true;
  bool get isAlarm => _isAlarm;
  bool get isVibration => _isVibration;
  bool get isFlashLight => _isFlashLight;
  bool get isPushNotification => _isPushNotification;

  toggleVibration() {
    _isVibration = !_isVibration;
    notifyListeners();
  }

  toggleFlashLight() {
    _isFlashLight = !_isFlashLight;
    notifyListeners();
  }

  togglePushNotification() {
    _isPushNotification = !_isPushNotification;
    notifyListeners();
  }

  // this functions sets off an alarm
  setOffAlarm() async {
    _isAlarm = !_isAlarm;
    if (isPushNotification) {
      flutterLocalNotificationsPlugin.show(
        0,
        isAlarm ? fireNotifications[0] : noFireNotifications[0],
        isAlarm ? fireNotifications[1] : noFireNotifications[1],
        NotificationDetails(
          android: AndroidNotificationDetails(
              channel.id, channel.name, channel.description,
              importance: Importance.high,
              color: AppColors.backgroundBlue,
              playSound: true,
              icon: '@mipmap/ic_launcher'),
        ),
      );
    }
    notifyListeners();

    bool hasVibrator = await Vibration.hasVibrator();
    bool hasFlashLisht = await Flashlight.hasFlashlight;
    if (isAlarm) {
      for (int i = 0; i < 10; ++i) {
        if (hasVibrator && isVibration) {
          if (!isFlashLight) await Future.delayed(Duration(milliseconds: 800));
          await Vibration.vibrate(duration: 800);
          await Future.delayed(Duration(milliseconds: 700));
        }
        if (hasFlashLisht && isFlashLight) {
          if (!isVibration) await Future.delayed(Duration(milliseconds: 700));
          Flashlight.lightOn();
          await Future.delayed(Duration(milliseconds: 800));
          Flashlight.lightOff();
        }
        Flashlight.lightOff();
      }
    }
  }
}

var fireNotifications = [
  "ACHTUNG, ACHTUNG!",
  "Feueralarm, klicke hier für mehr Informationen."
];
var noFireNotifications = ["Wieder in Ordnung!", "Das Feuer wurde gelöscht."];
