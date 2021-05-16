import 'package:flutter/material.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text("Maps page"),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
