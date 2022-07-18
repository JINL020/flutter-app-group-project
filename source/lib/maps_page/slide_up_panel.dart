import 'package:flutter/material.dart';
import 'package:hci_m3_app/config/style.dart';
import 'package:hci_m3_app/maps_page/map_tile.dart';

class SlidingUpPanel extends StatelessWidget {
  const SlidingUpPanel({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      maxChildSize: 0.7,
      minChildSize: 0.7,
      expand: false,
      builder: (_, __) => Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        child: Column(children: [
          Icon(Icons.drag_handle),
          Container(
            alignment: Alignment.topLeft,
            child: Text("Lagepläne", style: Heading1Black),
          ),
          SizedBox(height: 5),
          Expanded(
            child: ListView(
              children: [
                MapTile(
                  place: "Oskar-Morgenstern-Platz 1",
                  maps: [
                    "assets/images/OMP_UG.png",
                    "assets/images/OMP_EG.png",
                    "assets/images/OMP_OG1.png",
                    "assets/images/OMP_OG2.png",
                    "assets/images/OMP_OG3.png",
                  ],
                ),
                MapTile(
                  place: "Währinger Straße 29",
                  //floors: ["UG", "EG", "OG1", "OG2", "OG3", "DG"],
                  maps: [
                    "assets/images/WS_UG.jpg",
                    "assets/images/WS_EG.jpg",
                    "assets/images/WS_OG1.jpg",
                    "assets/images/WS_OG2.jpg",
                    "assets/images/WS_OG3.jpg",
                  ],
                ),
                MapTile(
                  place: "Gebäude 1",
                  //floors: ["UG", "EG", "OG1", "OG2", "OG3", "DG"],
                  maps: [],
                ),
                MapTile(
                  place: "Gebäude 2",
                  //floors: ["UG", "EG", "OG1", "OG2", "OG3", "DG"],
                  maps: [],
                ),
                MapTile(
                  place: "Gebäude 3",
                  //floors: ["UG", "EG", "OG1", "OG2", "OG3", "DG"],
                  maps: [],
                ),
                MapTile(
                  place: "Gebäude 4",
                  //floors: ["UG", "EG", "OG1", "OG2", "OG3", "DG"],
                  maps: [],
                ),
                MapTile(
                  place: "Gebäude 5",
                  //floors: ["UG", "EG", "OG1", "OG2", "OG3", "DG"],
                  maps: [],
                ),
                MapTile(
                  place: "Gebäude 6",
                  //floors: ["UG", "EG", "OG1", "OG2", "OG3", "DG"],
                  maps: [],
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
          Center(
            child: ElevatedButton(
              child: Text("schließen"),
              onPressed: () => Navigator.of(context).pop(),
            ),
          )
        ]),
      ),
    );
  }
}
