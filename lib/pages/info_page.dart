import 'package:flutter/material.dart';
import 'package:hci_m3_app/widgets/textSection.dart';

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
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: ListView(
          children: [
            TextSection(
              title: "Brandschutzordnungen der Uni Wien",
              body:
                  "https://event.univie.ac.at/fileadmin/user_upload/d_event/Dokumente/Service_Download/Brandschutzordnung.pdf",
            ),
            TextSection(
              title: "Im Falle eines Alarms",
              body:
                  "Bitte verlassen Sie das Gebäude ruhig und in einem zügigen Tempo. Nutzen Sie dazu nähersten (Not)ausgäng.\nEs besteht kein Grund zur Panik!\nNachem Sie das Gebäude verlassen haben, bewegen Sie sich zum nächstgelegenen Sammelplatz. Warten Sie dort bitte auf weitere Anweisungen. Falls Sie Unterstützung benötigen, fragen Sie um Hilfe. Bei Bedarf bedienen Sie sich den eingebauten Kommunikationsmöglichkeiten dieser App.",
            ),
            TextSection(
                title: "VERHALTEN BEI BRANDAUSBRUCH",
                body:
                    "1. Ruhe bewahren\n2. Immer beachten: Alarmieren der Feuerwehr, erforderlichenfalls Räumungsalarm auslösen; Retten, Löschen.\n3. Türen des Brandraumes schließen.\n4. Stiegenhaus- und Fluchtwegtüren schließen, Stiegenhausfenster öffnen.\n5. Lüftungs- und Klimaanlagen abstellen\n6. Aufzüge nicht benutzen.\n7. Bei Ertönen des Räumungsalarmes (Angabe des Alarmzeichens) sofort das Gebäude verlassen. Falls dies nicht möglich ist:\n- im Raum verbleiben\n- Türen schließen, Fenster öffnen\n- sich den Löschkräften bemerkbar machen"),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
