import 'package:flutter/material.dart';
import 'package:hci_m3_app/config/colors.dart';
import 'package:hci_m3_app/config/style.dart';
import 'package:hci_m3_app/model/alarm_mode.dart';
import 'package:hci_m3_app/widgets/map_search_bar.dart';
import 'package:hci_m3_app/widgets/map_tile.dart';
import 'package:provider/provider.dart';

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
                child: Text("Lagepläne", style: Heading1TextStyle)),
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
            /*ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: maps.length,
              itemBuilder: (context, index) {
                final map = maps[index];
                return ListTile();
              },
            ),*/
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
