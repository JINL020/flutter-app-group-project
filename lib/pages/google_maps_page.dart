import 'package:flutter/material.dart';

import 'package:hci_m3_app/config/phone_size.dart';
import 'package:hci_m3_app/config/style.dart';
import 'package:hci_m3_app/pages/floorplan_page.dart';
import 'package:hci_m3_app/widgets/map_search_bar.dart';
import 'package:hci_m3_app/widgets/map_tile.dart';
import 'package:webview_flutter/webview_flutter.dart';

const _url =
    'https://www.google.com/maps/d/embed?mid=1JJVPshZJtXkydosP2DN9XjG-1Mwv9SH-&hl=de';

/*
class GoogleMapsPage extends StatefulWidget {
  @override
  _GoogleMapsPageState createState() => _GoogleMapsPageState();
}

class _GoogleMapsPageState extends State<GoogleMapsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(children: [
          Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
            child: AspectRatio(
              aspectRatio: 1 / 1,
              child: mapsWidget(context),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Text("Lagepläne", style: Heading1White),
              ],
            ),
          ),
          Expanded(
            child: ListView(physics: BouncingScrollPhysics(), children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: MapTile(place: "Währinger Straße 29"),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: MapTile(place: "Oskar-Morgenstern-Platz 1"),
              ),
            ]),
          ),
        ]),
      ),
    );
  }
}
*/
Widget mapsWidget(context) {
  return ClipRect(
    child: OverflowBox(
      maxWidth: double.infinity,
      maxHeight: double.infinity,
      alignment: Alignment.bottomCenter,
      child: Container(
        height: PhoneSize.getHeight(context),
        width: PhoneSize.getWidth(context),
        child: WebView(
          initialUrl: _url,
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    ),
  );
}

class GoogleMapsPage extends StatefulWidget {
  @override
  _GoogleMapsPageState createState() => _GoogleMapsPageState();
}

class _GoogleMapsPageState extends State<GoogleMapsPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "Google Maps",
        style: Heading2White,
      )),
      body: mapsWidget(context),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => buildSheet(),
            backgroundColor: Colors.transparent),
        label: const Text('Lagepläne'),
        icon: const Icon(Icons.location_on),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  Widget buildSheet() {
    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      maxChildSize: 0.7,
      minChildSize: 0.7,
      builder: (_, controller) => Container(
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
              controller: controller,
              children: [
                MapTile(place: "Währinger Straße 29"),
                MapTile(place: "Oskar-Morgenstern-Platz 1"),
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
