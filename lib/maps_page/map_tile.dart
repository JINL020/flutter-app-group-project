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

/*
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      initiallyExpanded: true,
      title: Text(place),
      trailing: Icon(Icons.arrow_drop_down),
      backgroundColor: Colors.white,
      collapsedBackgroundColor: Colors.white,
      children: floors.map((floor) {
        var index = floors.indexOf(floor);
        return ListTile(
          title: Text(floor),
          tileColor: AppColors.textFieldWhite,
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => FloorPlanPage(
              floor: floor,
              map: maps[index],
            ),
          )),
        );
      }).toList(),
    );
    /*
        MapTile(place: "UG", map: "assets/images/OMP_UG.png"),
        MapTile(place: "EG", map: "assets/images/OMP_EG.png"),
        MapTile(place: "OG1", map: "assets/images/OMP_OG1.png"),
        MapTile(place: "OG2", map: "assets/images/OMP_OG2.png"),
        MapTile(place: "OG3", map: "assets/images/OMP_OG3.png"),
        MapTile(place: "DG", map: "assets/images/OMP_DG.png"),
      ],
    );*/
  }*/
}
