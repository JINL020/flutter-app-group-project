import 'package:flutter/material.dart';
import 'package:hci_m3_app/config/colors.dart';
import 'package:hci_m3_app/model/alarm_settings.dart';
import 'package:provider/provider.dart';

class SingleMapPage extends StatelessWidget {
  final String place;
  final String map;

  const SingleMapPage({Key key, @required this.place, @required this.map})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isAlarm = Provider.of<AlarmSettings>(context).isAlarm;
    return Scaffold(
      appBar: AppBar(title: Text(place)),
      backgroundColor:
          isAlarm ? AppColors.backgroundRed : AppColors.backgroundBlue,
      body: InteractiveViewer(
        child: Image.asset(map),
        maxScale: 4,
      ),
    );
  }
}
