import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'config/colors.dart';
import 'model/alarm_settings.dart';
import 'navigation/navigation_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isAlarm = Provider.of<AlarmSettings>(context).isAlarm;
    final primaryColor =
        isAlarm ? AppColors.backgroundRed : AppColors.backgroundBlue;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HCI M3 APP',
      theme: ThemeData(
        primarySwatch: isAlarm ? Colors.pink : Colors.blue,
        scaffoldBackgroundColor: primaryColor,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(primary: primaryColor),
        ),
        floatingActionButtonTheme:
            FloatingActionButtonThemeData(backgroundColor: primaryColor),
        appBarTheme: AppBarTheme(
          color: primaryColor,
        ),
      ),
      home: NavigationPage(),
    );
  }
}
