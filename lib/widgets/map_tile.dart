import 'package:flutter/material.dart';
import 'package:hci_m3_app/config/colors.dart';

class MapTile extends StatelessWidget {
  final String place;
  const MapTile({@required this.place});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(place),
      trailing: Icon(Icons.arrow_forward_rounded),
      tileColor: AppColors.textFieldWhite,
      /*onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => SingleMapPage(
          place: this.place,
          map: this.map,
        ),
      )*/
    );
  }
}
