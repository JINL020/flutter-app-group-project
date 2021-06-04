// import 'package:flutter/material.dart';
// import 'package:hci_m3_app/config/style.dart';
// import 'package:hci_m3_app/widgets/map_search_bar.dart';
// import 'package:hci_m3_app/widgets/map_tile.dart';

// class MapsPage extends StatefulWidget {
//   MapsPage({Key key}) : super(key: key);

//   @override
//   _MapsPageState createState() => _MapsPageState();
// }

// class _MapsPageState extends State<MapsPage>
//     with AutomaticKeepAliveClientMixin {
//   @override
//   Widget build(BuildContext context) {
//     // AutomaticKeepAliveClientMixin saves the screen state enabling us to switching back and forth
//     super.build(context);
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.transparent,
//         resizeToAvoidBottomInset: false,
//         body: ListView(
//           physics: BouncingScrollPhysics(),
//           children: [
//             Stack(children: [
//               Container(
//                 margin: EdgeInsets.all(10),
//                 decoration:
//                     BoxDecoration(borderRadius: BorderRadius.circular(10)),
//                 clipBehavior: Clip.hardEdge,
//                 child: Image.asset(
//                   'assets/images/map.png',
//                 ),
//               ),
//               MapSearchBar()
//             ]),
//             Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 15),
//                 child: Text("Lagepläne", style: Heading1White)),
//             Padding(
//               padding: EdgeInsets.all(10),
//               child: ExpansionTile(
//                 title: Text("Währinger Straße 29"),
//                 trailing: Icon(Icons.arrow_drop_down),
//                 backgroundColor: Colors.white,
//                 collapsedBackgroundColor: Colors.white,
//                 children: [
//                   MapTile(place: "UG", map: "assets/images/WS_UG.jpg"),
//                   MapTile(place: "EG", map: "assets/images/WS_EG.jpg"),
//                   MapTile(place: "OG1", map: "assets/images/WS_OG1.jpg"),
//                   MapTile(place: "OG2", map: "assets/images/WS_OG2.jpg"),
//                   MapTile(place: "OG3", map: "assets/images/WS_OG3.jpg"),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.all(10),
//               child: ExpansionTile(
//                 title: Text("Oskar-Morgenstern-Platz 1"),
//                 trailing: Icon(Icons.arrow_drop_down),
//                 backgroundColor: Colors.white,
//                 collapsedBackgroundColor: Colors.white,
//                 children: [
//                   MapTile(place: "UG", map: "assets/images/OMP_UG.png"),
//                   MapTile(place: "EG", map: "assets/images/OMP_EG.png"),
//                   MapTile(place: "OG1", map: "assets/images/OMP_OG1.png"),
//                   MapTile(place: "OG2", map: "assets/images/OMP_OG2.png"),
//                   MapTile(place: "OG3", map: "assets/images/OMP_OG3.png"),
//                   MapTile(place: "DG", map: "assets/images/OMP_DG.png"),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   bool get wantKeepAlive => true;
// }
import 'package:flutter/material.dart';
import 'package:hci_m3_app/config/phone_size.dart';
import 'package:webview_flutter/webview_flutter.dart';

const _url =
    'https://www.google.com/maps/d/embed?mid=1JJVPshZJtXkydosP2DN9XjG-1Mwv9SH-&hl=de';

class MapsPage extends StatefulWidget {
  MapsPage({Key key}) : super(key: key);

  @override
  _MapsPageState createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage>
    with AutomaticKeepAliveClientMixin {
  // AutomaticKeepAliveClientMixin saves the screen state enabling us to switching back and forth
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: SafeArea(
        child: Scaffold(
          body: Column(children: [
            buildTabbar(context),
            Expanded(
              child: TabBarView(children: [
                mapsWidget(context),
                mapsWidget(context),
              ]),
            ),
          ]),
        ),
      ),
    );
  }

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

  @override
  bool get wantKeepAlive => true;
}

Widget buildTabbar(context) {
  return Container(
    color: Theme.of(context).appBarTheme.color,
    child: TabBar(
      tabs: [
        Tab(text: "Google Maps"),
        Tab(text: "Lagepläne"),
      ],
    ),
  );
}

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
