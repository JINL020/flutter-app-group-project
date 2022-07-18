import 'package:flutter/material.dart';
import 'package:hci_m3_app/config/style.dart';
import 'package:provider/provider.dart';

import 'config/colors.dart';
import 'model/alarm_settings.dart';
import 'navigation_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isAlarm = Provider.of<AlarmSettings>(context).isAlarm;
    final primaryColor =
        isAlarm ? AppColors.backgroundRed : AppColors.backgroundBlue;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SICHA',
      theme: ThemeData(
        primarySwatch: isAlarm ? Colors.pink : Colors.blue,
        scaffoldBackgroundColor: Colors.transparent,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(primary: primaryColor),
        ),
        floatingActionButtonTheme:
            FloatingActionButtonThemeData(backgroundColor: primaryColor),
        appBarTheme: AppBarTheme(
          color: primaryColor,
          textTheme: TextTheme(headline6: Heading1White),
        ),
        dividerTheme: DividerThemeData(
          color: Colors.white70,
          space: 40,
          thickness: 0.8,
          indent: 10,
          endIndent: 10,
        ),
        bottomNavigationBarTheme:
            BottomNavigationBarThemeData(backgroundColor: primaryColor),
      ),
      home: NavigationPage(),
    );
  }
}
