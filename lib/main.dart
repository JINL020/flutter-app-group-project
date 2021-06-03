import 'package:flutter/material.dart';
import 'package:hci_m3_app/my_app.dart';
import 'package:provider/provider.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:hci_m3_app/model/alarm_settings.dart';

// AndroidNotificationChannel for heads up notifications
//because after Android 8 notification are not shown without own channel
const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    'This channel is used for important notifications.', // description
    importance: Importance.high,
    playSound: true);

// Initialize the FlutterLocalNotificationsPlugin package.
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //assign our created channel "chanel" to this
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  //ChangeNotifierProvider so we can get our alarm state
  runApp(ChangeNotifierProvider(
    create: (context) => AlarmSettings(),
    child: MyApp(),
  ));
}
