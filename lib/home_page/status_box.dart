import 'package:flutter/material.dart';
import 'package:hci_m3_app/config/colors.dart';
import 'package:hci_m3_app/config/phone_size.dart';
import 'package:hci_m3_app/config/style.dart';

class StatusBox extends StatelessWidget {
  final bool isAlarm;
  final String message;
  final String timeStamp;
  final String fireLocation;
  const StatusBox(
      {Key key,
      @required this.isAlarm,
      @required this.message,
      @required this.timeStamp,
      @required this.fireLocation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColors.statusBoxWhite,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(40),
        ),
      ),
      height: PhoneSize.getHeight(context) * 0.3,
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: getLogo(isAlarm),
          ),
          Expanded(
            flex: 5,
            child: getStatusInfo(isAlarm),
          ),
        ],
      ),
    );
  }

  Widget getLogo(bool isAlarm) {
    return isAlarm
        ? Image.asset(
            'assets/images/logo_fire.png',
            fit: BoxFit.scaleDown,
          )
        : Image.asset(
            'assets/images/logo_normal.png',
            fit: BoxFit.scaleDown,
          );
  }

  Widget getStatusInfo(bool isAlarm) {
    var textStyle = Heading1Black;
    return FittedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(message, style: textStyle),
          if (isAlarm) Text("Ort: " + fireLocation, style: textStyle),
          if (isAlarm) Text("ausgelöst um " + timeStamp, style: textStyle),
        ],
      ),
    );
  }
}
