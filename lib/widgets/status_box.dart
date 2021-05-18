import 'package:flutter/material.dart';
import 'package:hci_m3_app/config/colors.dart';
import 'package:hci_m3_app/config/style.dart';

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
    // margin is the empty space surrounding the widget
    // padding is the space between child and boundary
    return AspectRatio(
      aspectRatio: 16 / 10,
      child: Container(
        padding: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: AppColors.statusBoxWhite,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(50),
        ),
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: isAlarm
                  ? Image.asset(
                      'assets/images/logo_fire.png',
                      fit: BoxFit.scaleDown,
                    )
                  : Image.asset(
                      'assets/images/logo_normal.png',
                      fit: BoxFit.scaleDown,
                    ),
            ),
            Expanded(
              flex: 3,
              child: FittedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /*
                    RichText(
                      text: TextSpan(
                          text: "Status: ",
                          style: Heading2TextStyle,
                          children: <TextSpan>[
                            TextSpan(text: "$alarmStatus", style: BodyTextStyle)
                          ]),
                    ),
                    RichText(
                      text: TextSpan(
                          text: "Ort: ",
                          style: Heading2TextStyle,
                          children: <TextSpan>[
                            TextSpan(text: "$place", style: BodyTextStyle)
                          ]),
                    ),
                    RichText(
                      text: TextSpan(
                          text: "Zeitpunkt: ",
                          style: Heading2TextStyle,
                          children: <TextSpan>[
                            TextSpan(text: "$timeStamp", style: BodyTextStyle)
                          ]),
                    ),*/
                    Text("Status: $alarmStatus", style: Heading2TextStyle),
                    Text("Ort: $place", style: Heading2TextStyle),
                    Text(
                      "Zeitpunkt: $timeStamp",
                      style: Heading2TextStyle,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
