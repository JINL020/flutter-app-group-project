import 'package:flutter/material.dart';
import 'package:hci_m3_app/pages/single_map_page.dart';

class MapTile extends StatelessWidget {
  final String place;
  final String map;
  const MapTile({@required this.place, @required this.map});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => SingleMapPage(
          place: this.place,
          map: this.map,
        ),
      )),
      title: Text(place),
    );
  }
}
