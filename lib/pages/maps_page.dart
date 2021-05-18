import 'package:flutter/material.dart';
import 'package:hci_m3_app/config/style.dart';
import 'package:hci_m3_app/widgets/map_search_bar.dart';
import 'package:hci_m3_app/widgets/map_tile.dart';

class MapsPage extends StatefulWidget {
  MapsPage({Key key}) : super(key: key);

  @override
  _MapsPageState createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    // AutomaticKeepAliveClientMixin saves the screen state enabling us to switching back and forth
    super.build(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: false,
        body: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Stack(children: [
              Container(
                margin: EdgeInsets.all(10),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                clipBehavior: Clip.hardEdge,
                child: Image.asset(
                  'assets/images/map.png',
                ),
              ),
              MapSearchBar()
            ]),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text("Lagepläne", style: Heading1White)),
            Padding(
              padding: EdgeInsets.all(10),
              child: ExpansionTile(
                initiallyExpanded: true,
                title: Text("Währinger Straße 29"),
                trailing: Icon(Icons.arrow_drop_down),
                backgroundColor: Colors.white,
                collapsedBackgroundColor: Colors.white,
                children: [
                  MapTile(place: "UG", map: "assets/images/WS_UG.jpg"),
                  MapTile(place: "EG", map: "assets/images/WS_EG.jpg"),
                  MapTile(place: "OG1", map: "assets/images/WS_OG1.jpg"),
                  MapTile(place: "OG2", map: "assets/images/WS_OG2.jpg"),
                  MapTile(place: "OG3", map: "assets/images/WS_OG3.jpg"),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: ExpansionTile(
                initiallyExpanded: true,
                title: Text("Oskar-Morgenstern-Platz 1"),
                trailing: Icon(Icons.arrow_drop_down),
                backgroundColor: Colors.white,
                collapsedBackgroundColor: Colors.white,
                children: [
                  MapTile(place: "UG", map: "assets/images/OMP_UG.png"),
                  MapTile(place: "EG", map: "assets/images/OMP_EG.png"),
                  MapTile(place: "OG1", map: "assets/images/OMP_OG1.png"),
                  MapTile(place: "OG2", map: "assets/images/OMP_OG2.png"),
                  MapTile(place: "OG3", map: "assets/images/OMP_OG3.png"),
                  MapTile(place: "DG", map: "assets/images/OMP_DG.png"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
