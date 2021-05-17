import 'package:flutter/material.dart';
import 'package:hci_m3_app/config/colors.dart';

class StatusBox extends StatelessWidget {
  final bool isAlarm;
  final String alarmStatus;
  final String timeStamp;
  final String place;
  const StatusBox(
      {Key key,
      @required this.isAlarm,
      @required this.alarmStatus,
      @required this.timeStamp,
      @required this.place})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // container sizes itself to it's child
    //column takes as much space as possible
    //Text takes as much space as possible
    print(isAlarm);
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ), // empty space surrounding the widget
        padding: EdgeInsets.all(15.0), // space between child and boundary
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.StatusBoxWhite,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: isAlarm
                    ? Image.asset(
                        'assets/emergency_light.png',
                      )
                    : Image.asset('assets/sun_sunrise.png'),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Status: $alarmStatus"),
                    Text("Zeitpunkt: $timeStamp"),
                    Text("Ort: $place"),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
