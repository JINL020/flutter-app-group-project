import 'package:flutter/material.dart';
import 'package:hci_m3_app/info_page/kontakt_page.dart';
import 'package:hci_m3_app/info_page/verhalten_page.dart';

class InfoPage extends StatefulWidget {
  InfoPage({Key key}) : super(key: key);

  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage>
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
                VerhaltenPage(),
                KontaktPage(),
              ]),
            ),
          ]),
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
        Tab(text: "Verhalten"),
        Tab(text: "Kontakt"),
      ],
    ),
  );
}
