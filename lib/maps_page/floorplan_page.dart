import 'package:flutter/material.dart';
import 'package:hci_m3_app/config/colors.dart';
import 'package:hci_m3_app/model/alarm_settings.dart';
import 'package:provider/provider.dart';

class FloorPlanPage extends StatelessWidget {
  final String floor;
  final List<String> maps;
  const FloorPlanPage({Key key, @required this.floor, @required this.maps})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isAlarm = Provider.of<AlarmSettings>(context).isAlarm;
    return Scaffold(
      appBar: AppBar(title: Text(floor)),
      backgroundColor:
          isAlarm ? AppColors.backgroundRed : AppColors.backgroundBlue,
      body: ListView(
        children: maps.map((floor) {
          return InteractiveViewer(
            maxScale: 4,
            child: Image.asset(floor),
          );
        }).toList(),
      ),
    );
  }
}

/*onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => SingleMapPage(
          place: this.place,
          map: this.map,
        ),
      )*/
