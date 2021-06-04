import 'package:flutter/material.dart';

import 'package:hci_m3_app/config/phone_size.dart';
import 'package:hci_m3_app/maps_page/slide_up_panel.dart';
import 'package:webview_flutter/webview_flutter.dart';

const _url =
    'https://www.google.com/maps/d/embed?mid=1JJVPshZJtXkydosP2DN9XjG-1Mwv9SH-&hl=de';

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
        ),
      ),
      body: mapsWidget(context),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => SlidingUpPanel(),
            backgroundColor: Colors.transparent),
        label: const Text('Lagepläne'),
        icon: const Icon(Icons.location_on),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
