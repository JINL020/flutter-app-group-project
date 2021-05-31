import 'package:flutter/material.dart';

import 'package:hci_m3_app/config/phone_size.dart';
import 'package:hci_m3_app/config/style.dart';
import 'package:hci_m3_app/widgets/map_tile.dart';
import 'package:webview_flutter/webview_flutter.dart';

const _url =
    'https://www.google.com/maps/d/embed?mid=1JJVPshZJtXkydosP2DN9XjG-1Mwv9SH-&hl=de';

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
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            alignment: Alignment.centerLeft,
            child: Text("Lagepläne", style: Heading1White),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
            child: AspectRatio(
              aspectRatio: 1 / 1,
              child: mapsWidget(context),
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

Widget mapsWidget(context) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(8),
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
