import 'package:flutter/material.dart';
import 'package:hci_m3_app/config/colors.dart';
import 'package:hci_m3_app/config/style.dart';

class SettingOtions extends StatefulWidget {
  final String title;
  final List<String> tileNames;
  final List<bool> tileValues;
  final List<Function> tileActions;
  const SettingOtions(
      {Key key,
      @required this.title,
      @required this.tileNames,
      @required this.tileValues,
      @required this.tileActions})
      : super(key: key);

  @override
  _SettingOtionsState createState() => _SettingOtionsState();
}

class _SettingOtionsState extends State<SettingOtions> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            margin: EdgeInsets.fromLTRB(20, 0, 10, 0),
            alignment: Alignment.centerLeft,
            child: Text(widget.title, style: Heading2White)),
        Container(
          width: double.infinity,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: AppColors.textBoxWhite,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: widget.tileNames.map((tileName) {
              var index = widget.tileNames.indexOf(tileName);
              return SwitchListTile(
                title: Text(widget.tileNames[index], style: Heading2Black),
                activeColor: Colors.greenAccent[700],
                inactiveTrackColor: Colors.grey[600],
                inactiveThumbColor: Colors.grey[400],
                value: widget.tileValues[index],
                onChanged: (value) => widget.tileActions[index](),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
