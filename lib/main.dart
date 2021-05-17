import 'package:flutter/material.dart';
import 'package:hci_m3_app/config/colors.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:hci_m3_app/model/alarm_mode.dart';
import 'package:hci_m3_app/navigation/navigation_page.dart';

// AndroidNotificationChannel for heads up notifications
//because after Android 8 no notification are shown without own channel
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
  await Firebase.initializeApp();

  //assign our created channel "chanel" to this
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  //ChangeNotifierProvider so we can get our alarm state
  runApp(ChangeNotifierProvider(
    create: (context) => AlarmMode(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isAlarm = Provider.of<AlarmMode>(context).isAlarm;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HCI M3 APP',
      theme: ThemeData(
        primarySwatch: isAlarm ? Colors.red : Colors.blue,
      ),
      home: NavigationPage(),
    );
  }
}
