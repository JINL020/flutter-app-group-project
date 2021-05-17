import 'package:flutter/material.dart';
import 'package:hci_m3_app/config/colors.dart';
import 'package:hci_m3_app/model/alarm_mode.dart';
import 'package:provider/provider.dart';

class SingleMapPage extends StatelessWidget {
  final String place;
  final Image map;

  const SingleMapPage({Key key, @required this.place, @required this.map})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isAlarm = Provider.of<AlarmMode>(context).isAlarm;
    return Scaffold(
      appBar: AppBar(title: Text(place)),
      backgroundColor:
          isAlarm ? AppColors.backgroundRed : AppColors.backgroundBlue,
      body: map,
    );
  }
}
