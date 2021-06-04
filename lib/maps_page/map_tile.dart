import 'package:flutter/material.dart';
import 'package:hci_m3_app/config/colors.dart';
import 'package:hci_m3_app/maps_page/floorplan_page.dart';

class MapTile extends StatelessWidget {
  final String place;
  //final List<String> floors;
  final List<String> maps;

  const MapTile({
    @required this.place,
    @required this.maps,
    // @required this.floors,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(place),
      trailing: Icon(Icons.arrow_forward_rounded),
      tileColor: AppColors.textFieldWhite,
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => FloorPlanPage(
          floor: place,
          maps: maps,
        ),
      )),
    );
  }
}
