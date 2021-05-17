import 'package:flutter/material.dart';
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
    final isAlarm = Provider.of<AlarmMode>(context).isAlarm;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: isAlarm ? Colors.red : Colors.blue,
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
                  'assets/map.png',
                ),
              ),
              MapSearchBar()
            ]),
            Text("Lagepläne"),
            Padding(
              padding: EdgeInsets.all(10),
              child: ExpansionTile(
                initiallyExpanded: true,
                title: Text("Währinger Straße 29"),
                trailing: Icon(Icons.arrow_drop_down),
                backgroundColor: Colors.white,
                collapsedBackgroundColor: Colors.white,
                children: [
                  MapTile(place: "UG", map: Image.asset("assets/WS_UG")),
                  MapTile(place: "EG", map: Image.asset("assets/WS_EG")),
                  MapTile(place: "OG1", map: Image.asset("assets/WS_OG1")),
                  MapTile(place: "OG2", map: Image.asset("assets/WS_OG2")),
                  MapTile(place: "OG3", map: Image.asset("assets/WS_OG3")),
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
                  MapTile(place: "UG", map: Image.asset("assets/WS_UG")),
                  MapTile(place: "EG", map: Image.asset("assets/WS_EG")),
                  MapTile(place: "OG1", map: Image.asset("assets/WS_OG1")),
                  MapTile(place: "OG2", map: Image.asset("assets/WS_OG2")),
                  MapTile(place: "OG3", map: Image.asset("assets/WS_OG3")),
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
